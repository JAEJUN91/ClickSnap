package org.np.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ArtistVO {

	private String artistId;
	private String artistPwd;
	private String email;
	private String artistName;
	private String phoneNum;
	private String profileImg;
	private String nickName;
	private int penalty;
	private String introduce;
	private String career;
	private String concept;
	private Date regDate;
	private List<AuthVO> authList;
	
}
