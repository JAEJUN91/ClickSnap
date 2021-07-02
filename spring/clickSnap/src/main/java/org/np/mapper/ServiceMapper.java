package org.np.mapper;

import java.util.List;

import org.np.domain.Criteria;
import org.np.domain.ServiceDTO;
import org.np.domain.ServiceVO;

public interface ServiceMapper {
	
	public int insert(ServiceVO vo);
	public List<ServiceVO> searchList(Criteria cri);
	public List<ServiceVO> searchByCategory(String category);
}
