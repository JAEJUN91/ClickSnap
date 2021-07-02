package org.np.service;

import java.util.List;

import org.np.domain.Criteria;
import org.np.domain.ServiceDTO;
import org.np.domain.ServiceVO;

public interface ServiceService {

	public void insert(ServiceVO vo);
	public ServiceDTO searchList(Criteria cri);
	public ServiceDTO searchByCategory(String category);
}
