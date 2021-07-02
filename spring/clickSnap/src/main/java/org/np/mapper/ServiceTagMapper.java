package org.np.mapper;

import java.util.List;

import org.np.domain.ServiceTagVO;

public interface ServiceTagMapper {

	public void insert(ServiceTagVO vo);
	public List<ServiceTagVO> getList();
	
}
