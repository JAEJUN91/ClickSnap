package org.np.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberTest {

	@Setter(onMethod_ = { @Autowired })
	private PasswordEncoder pwencoder;
	@Setter(onMethod_ = { @Autowired })
	private DataSource ds;


	/*
	 * @Test public void testInsertMember() { String sql =
	 * "insert into np_cust(userid, userpwd, username, email, phonenum, profileimg, nickname) values"
	 * + "(?,?,?,?,?,?,?)"; Connection conn = null; PreparedStatement pstmt = null;
	 * try { conn = ds.getConnection(); pstmt = conn.prepareStatement(sql);
	 * pstmt.setString(1, "rhkr02"); pstmt.setString(2, pwencoder.encode("1234"));
	 * pstmt.setString(3, "곽박이"); pstmt.setString(4, "kcm941231@gmail.com");
	 * pstmt.setString(5, "01011112222"); pstmt.setString(6, "img.jpg");
	 * pstmt.setString(7, "치문짱456"); pstmt.executeUpdate(); }catch (SQLException e)
	 * {} finally { if(pstmt!=null) {try {pstmt.close();}catch (Exception e) {}
	 * if(conn!=null) {try {conn.close();}catch (Exception e) {} } } } }
	 */


	@Test
	public void testInsertArtist() {
		String sql = "insert into np_artist(artistid, artistpwd, artistname, email, phonenum, profileimg, nickname,"
				+ "penalty, introduce, career, concept) values" + "(?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "kcm941231");
			pstmt.setString(2, pwencoder.encode("1234"));
			pstmt.setString(3, "곽취문");
			pstmt.setString(4, "kcm941231@gmail.com");
			pstmt.setString(5, "01011112222");
			pstmt.setString(6, "img.jpg");
			pstmt.setString(7, "치문짱456");
			pstmt.setInt(8, 1);
			pstmt.setString(9,
					"What is Lorem Ipsum? -Lorem Ipsum is simply dummy text of the printing and typesetting industry.\r\n"
							+ "-Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,\r\n"
							+ "-when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n"
							+ "-It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. -It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\r\n"
							+ "and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");
			pstmt.setString(10, "<li><h5>**대학교 **학과 졸업</h5></li><li><h5>**상사 디자인팀 근무</h5></li><li><h5>**자격증 취득(2012)</h5></li>");
			pstmt.setString(11, "웨딩, 여행");
			pstmt.executeUpdate();
		} catch (SQLException e) {
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (Exception e) {
					}
				}
			}
		}
	}

	@Test
	public void testInsertMemberAuth() {
		String sql = "insert into tbl_member_auth(userid, auth) values(?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		for (int i = 0; i < 30; i++) {
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				if (i < 10) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				} else if (i < 20) {
					pstmt.setString(1, "manager" + i);
					pstmt.setString(2, "ROLE_MEMBER");
				} else {
					pstmt.setString(1, "admin" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
			} catch (SQLException e) {
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
					if (conn != null) {
						try {
							conn.close();
						} catch (Exception e) {
						}
					}
				}
			}
		}
	}
}
