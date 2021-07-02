package org.np.controller;

import org.np.domain.ServiceDTO;
import org.np.domain.ServiceVO;
import org.np.service.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/category/*")
@Log4j
public class CatContorller {

	@Setter(onMethod_ = {@Autowired})
	private ServiceService service;
	
	@GetMapping("/serviceView")
	public void sView() {
		log.info("serviceView로 매핑");
	}
	
	@GetMapping(value="/getByCategory/{category}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ServiceDTO> getByCategory(@PathVariable("category")String category){
		log.info("categoty : " + category);
		return new ResponseEntity<>(service.searchByCategory(category), HttpStatus.OK);
	}
	
}
