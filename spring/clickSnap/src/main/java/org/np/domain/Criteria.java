package org.np.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
public class Criteria {
	
	public Criteria() {
		// TODO Auto-generated constructor stub
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		// TODO Auto-generated constructor stub
		this.pageNum = pageNum; 
		this.amount = amount;
	}
	
	private int pageNum; //페이지 번호
	private int amount; // 한 페이지에 출력되는 데이터 수
	private List<ServiceImageVO> iList;
	private List<ServiceTagVO> tList;
	private String type;//검색항목
	private String keyword;//사용자가 입력하는 검색어
	private String location;
	private String tag;
	private String[] tagArr;
	
	public String[] getArr() {
		return type==null? new String[] {} : type.split("");
	}
}
