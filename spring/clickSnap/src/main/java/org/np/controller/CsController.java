package org.np.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/customerService/*")
@Log4j
public class CsController {

	@RequestMapping(value = "/cs", method = RequestMethod.GET)
	public String cs() {
		
		return "/customerService/cs";
	}
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String cscs() {
		
		return "/customerService/faq";
	}
	
	
	
}
