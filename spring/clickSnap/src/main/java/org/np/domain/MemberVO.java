package org.np.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phoneNum;
	private String profileImg;
	private String nickName;
	private Date regDate;
	private List<AuthVO> authList;
	
}
