package org.np.controller;

import org.np.domain.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {

	/*
	 * @GetMapping("/login") public void goToLoginPage() {
	 * log.info("login page로 이동!"); }
	 * 
	 * @PostMapping("/login/loginProc") public String loginProc(MemberVO vo) {
	 * log.info("vo : " + vo); return "/index"; }
	 */
	
	@GetMapping("/myPage")
	public void myPage() {
		log.info("myPage로 매핑합니다.");
	}
	
}
