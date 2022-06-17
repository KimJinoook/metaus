package com.metaus.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private static final Logger logger
	=LoggerFactory.getLogger(ResumeController.class);
	
	
	@GetMapping("/resumeWrite")
	public void get_write() {
		logger.info("등록 화면");
	}
	
	@RequestMapping("/resumeDetail")
	public void detail() {
		
	}
	
}
