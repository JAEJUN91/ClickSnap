package org.np.mapper;

import java.util.List;

import org.np.domain.ServiceImageVO;

public interface ServiceImageMapper {

	public void insert(ServiceImageVO vo);
	public List<ServiceImageVO> getList();
	
}
