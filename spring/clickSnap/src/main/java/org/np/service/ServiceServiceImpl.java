package org.np.service;

import java.util.List;

import org.np.domain.Criteria;
import org.np.domain.ServiceDTO;
import org.np.domain.ServiceImageVO;
import org.np.domain.ServiceTagVO;
import org.np.domain.ServiceVO;
import org.np.mapper.ServiceImageMapper;
import org.np.mapper.ServiceMapper;
import org.np.mapper.ServiceTagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ServiceServiceImpl implements ServiceService {

	@Setter(onMethod_ = {@Autowired})
	private ServiceMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private ServiceImageMapper iMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private ServiceTagMapper tMapper;
	
	@Override
	public void insert(ServiceVO vo) {
		log.info("ServiceServiceImpl 실행");
		mapper.insert(vo);
		ServiceTagVO tVO = new ServiceTagVO();

		for(ServiceImageVO i : vo.getIList()) {
			ServiceImageVO iVO = new ServiceImageVO();
			iVO.setFileName(i.getFileName());
			iVO.setUploadPath(i.getUploadPath());
			iVO.setUuid(i.getUuid());
			iVO.setSno(vo.getSno());
			iMapper.insert(iVO);
		}
		
		for(String t:vo.getTList()) {
			tVO.setSno(vo.getSno());
			tVO.setTag(t);
			tMapper.insert(tVO);
		}
		//ServiceMapper, SeriviceImageMapper 둘다 활용
	}
	@Override
	public ServiceDTO searchList(Criteria cri) {
		log.info(cri.getKeyword());
		log.info(cri.getType());
		ServiceDTO sDTO = new ServiceDTO();
		sDTO.setList(mapper.searchList(cri));
		return sDTO;
	}
	
	@Override
	public ServiceDTO searchByCategory(String categoty) {
		ServiceDTO sDTO = new ServiceDTO();
		sDTO.setList(mapper.searchByCategory(categoty));
		return sDTO;
	}
}
