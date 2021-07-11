package org.np.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.np.domain.Criteria;
import org.np.domain.PageDTO;
import org.np.domain.ServiceDTO;
import org.np.domain.ServiceImageVO;
import org.np.domain.ServiceVO;
import org.np.mapper.ServiceImageMapper;

import org.np.service.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/category/*")
@Log4j
public class CatContorller {

	@Setter(onMethod_ = {@Autowired})
	private ServiceService service;
	
	@Setter(onMethod_ = {@Autowired})
	private ServiceImageMapper iMapper;
	
	@GetMapping("/category")
	public void sView(Criteria cri, Model model) {
		log.info("category로 매핑");
		/*
		 * ServiceVO sVO = service.getBySno(sno); List<ServiceImageVO> iVO =
		 * iMapper.getList(sno);
		 */
		log.info(service);

		model.addAttribute("list",service.getList(cri));
		model.addAttribute("rec",service.getRecList());
		
		int total = service.getTotal(cri);
		log.info("total:"+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		ServiceVO vo = new ServiceVO();
		int sno = vo.getSno();
		
		List<ServiceImageVO> iVO = iMapper.getList(sno);
		model.addAttribute("iVO", iVO);
		/*
		 * model.addAttribute("sVO", sVO); model.addAttribute("iVO", iVO);
		 */
		
	}
	
	@GetMapping(value="/pages/{page}",
			produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ServiceVO>> getList(@PathVariable("page") int page){
		log.info("getList");
		Criteria cri = new Criteria(page, 6);
		
		return new ResponseEntity<>(service.getList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<ServiceImageVO>>getAttachList(Long sno){
		log.info("getAttachList" + sno);
		return new ResponseEntity<>(service.getAttachList(sno), HttpStatus.OK);
	}
	
	@GetMapping(value="/getByCategory/{category}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> getByCategory(@PathVariable("category")String category){
		log.info("categoty : " + category);
		return new ResponseEntity<>(service.searchByCategory(category), HttpStatus.OK);
	}
	
	  @GetMapping(value = "/category/type/{type}/keyword/{keyword}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	  public ResponseEntity<ServiceDTO> get1(@PathVariable String type, @PathVariable String keyword) 
	  {  /* return mainService.findByKeyword(keyword); */
		  Criteria cri = new Criteria();
		  cri.setKeyword(keyword);
		  cri.setType(type);
		  log.info(cri.getTypeArr()[0]);
		  return new ResponseEntity<>(service.findByKeyword1(cri), HttpStatus.OK);
	  	}
	 
	  @GetMapping(value = "/category/tag/{tagArr}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	  public ResponseEntity<ServiceDTO> get2(@PathVariable String[] tagArr) 
	  {  /* return mainService.findByKeyword(keyword); */
		  Criteria cri = new Criteria();
		  cri.setTagArr(tagArr);
		  log.info(tagArr);
		  return new ResponseEntity<>(service.findByKeyword2(cri), HttpStatus.OK);
	  	}
	  
	  @GetMapping(value = "/serviceView/location/{location}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	  public ResponseEntity<ServiceDTO> get3(@PathVariable String location) 
	  {  /* return mainService.findByKeyword(keyword); */
		  Criteria cri = new Criteria();
		  cri.setLocation(location);
		  log.info(location);
		  return new ResponseEntity<>(service.findByKeyword3(cri), HttpStatus.OK);
	  	}
	  //tag+location
	  @GetMapping(value = "/category/location/{location}/tag/{tagArr}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	  public ResponseEntity<ServiceDTO> get4(@PathVariable String location,@PathVariable String[] tagArr) 
	  {  /* return mainService.findByKeyword(keyword); */
		  Criteria cri = new Criteria();
		  cri.setLocation(location);
		  cri.setTagArr(tagArr);
		  log.info(location+tagArr);
		  return new ResponseEntity<>(service.findByKeyword4(cri), HttpStatus.OK);
	  	}
	  //title+tag
	  @GetMapping(value = "/category/type/{type}/keyword/{keyword}/tag/{tagArr}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	  public ResponseEntity<ServiceDTO> get5(@PathVariable String type, @PathVariable String keyword, @PathVariable String[] tagArr) 
	  {  /* return mainService.findByKeyword(keyword); */
		  Criteria cri = new Criteria();
		  cri.setType(type);
		  cri.setKeyword(keyword);
		  cri.setTagArr(tagArr);
		  log.info(type+keyword+tagArr);
		  return new ResponseEntity<>(service.findByKeyword5(cri), HttpStatus.OK);
	  	}
	  //title+location
	  @GetMapping(value = "/category/type/{type}/keyword/{keyword}/location/{location}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	  public ResponseEntity<ServiceDTO> get6(@PathVariable String type, @PathVariable String keyword, @PathVariable String location) 
	  {  /* return mainService.findByKeyword(keyword); */
		  Criteria cri = new Criteria();
		  cri.setType(type);
		  cri.setKeyword(keyword);
		  cri.setLocation(location);
		  log.info(type+keyword+location);
		  return new ResponseEntity<>(service.findByKeyword6(cri), HttpStatus.OK);
	  	}
	  
	  @GetMapping(value = "/category/type/{type}/keyword/{keyword}/location/{location}/tag/{tagArr}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	  public ResponseEntity<ServiceDTO> get7(@PathVariable String type, @PathVariable String keyword, @PathVariable String location, @PathVariable String[] tagArr) 
	  {  /* return mainService.findByKeyword(keyword); */
		  Criteria cri = new Criteria();
		  cri.setType(type);
		  cri.setKeyword(keyword);
		  cri.setLocation(location);
		  cri.setTagArr(tagArr);
		  log.info(type+keyword+location+tagArr);
		  return new ResponseEntity<>(service.findByKeyword7(cri), HttpStatus.OK);
	  	}
}
