package org.np.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.np.domain.ArtistVO;
import org.np.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Getter
@Log4j
public class CustomUser extends User {
	
	private static final long serialVersionUID = 1L;
	private MemberVO member;
	private ArtistVO artist;
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	public CustomUser(MemberVO vo) {
		super(vo.getUserId(), vo.getUserPwd(), vo.getAuthList().stream()
				.map(auth->new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
			this.member = vo;
			log.warn(vo);
	}
	
	public CustomUser(ArtistVO vo) {
		super(vo.getArtistId(), vo.getArtistPwd(), vo.getAuthList().stream()
				.map(auth->new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
			this.artist = vo;
			log.warn(vo);
	}
	
	/*
	 * public void setSession (MemberVO vo, HttpServletRequest request) {
	 * HttpSession session = request.getSession(); session.setAttribute("cust", vo);
	 * log.warn(session); }
	 */
}
