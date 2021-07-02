package org.np.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private long bno;
	private String writer;
	private String title;
	private String contents;
	private Date regDate;
	private Date updateDate;
	private String status;
	
}
