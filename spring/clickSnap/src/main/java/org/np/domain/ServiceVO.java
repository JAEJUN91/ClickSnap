package org.np.domain;

import java.util.List;

import lombok.Data;

@Data
public class ServiceVO {

	private int sno;
	private String content;
	private String category;
	private String[] tList;
	private String artist_id;
	private String registerDate;
	private List<ServiceImageVO> iList;
	private String title;
	private float latStart;
	private float lngStart;
	private float latTarget;
	private float lngTarget;
	private int studio;
	private int pickUp;
	private String startTime;
	private String endTime;
	
}
