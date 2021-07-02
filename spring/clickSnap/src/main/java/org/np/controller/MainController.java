package org.np.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.np.domain.Criteria;
import org.np.domain.ServiceDTO;
import org.np.mapper.ServiceImageMapper;
import org.np.mapper.ServiceMapper;
import org.np.mapper.ServiceTagMapper;
import org.np.service.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

	@Setter(onMethod_= {@Autowired})
	private ServiceImageMapper iMapper;
	
	@Setter(onMethod_= {@Autowired})
	private ServiceMapper sMapper;
	
	@Setter(onMethod_= {@Autowired})
	private ServiceTagMapper tMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private ServiceService service;
	
	@GetMapping("/artist/artistList")
	public void list(Model model) {
		log.info("artist List로 이동");
		/*
		 * List<ServiceVO> sList = sMapper.searchList(); model.addAttribute("sList",sList);
		 */
	}
	
	@GetMapping(value="/service/search/type/{type}/keyword/{keyword}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> searchTK(Criteria cri){
		log.info("search 실행");
		return new ResponseEntity<>(service.searchList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value="/service/search/location/{location}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> searchL(Criteria cri){
		log.info("search 실행");
		return new ResponseEntity<>(service.searchList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value="/service/search/tagArr/{tagArr}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> searchTA(Criteria cri){
		log.info("search 실행");
		return new ResponseEntity<>(service.searchList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value="/service/search/type/{type}/keyword/{keyword}/location/{location}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> searchTKL(Criteria cri){
		log.info("search 실행");
		return new ResponseEntity<>(service.searchList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value="/service/search/type/{type}/keyword/{keyword}/tagArr/{tagArr}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> searchTKTA(Criteria cri){
		log.info("search 실행");
		return new ResponseEntity<>(service.searchList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value="/service/search/location/{location}/tagArr/{tagArr}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> searchLTA(Criteria cri){
		log.info("search 실행");
		return new ResponseEntity<>(service.searchList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value="/service/search/type/{type}/keyword/{keyword}/location/{location}/tagArr/{tagArr}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> searchTKLTA(Criteria cri){
		log.info("search 실행");
		log.info(cri.getKeyword());
		log.info(cri.getType());
		return new ResponseEntity<>(service.searchList(cri), HttpStatus.OK);
	}
	
	@GetMapping("/index")
	public String logOut() {
		log.info("다시 메인으로");
		return "index";
	}
	
}
