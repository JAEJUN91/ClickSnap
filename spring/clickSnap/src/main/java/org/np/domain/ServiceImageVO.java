package org.np.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class ServiceImageVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private int sno;
}
