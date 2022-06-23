package com.metaus.vod.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vod")
public class VodController {
	private static final Logger logger
	=LoggerFactory.getLogger(VodController.class);
	
	@RequestMapping("/vod")
	public String vod() {
		logger.info("vod 페이지");
		
		return "/vod/vod";
	}
	
	@RequestMapping("/vodDetail")
	public String vodDetail() {
		logger.info("vod Detail 페이지");
		
		return "/vod/vodDetail";
	}
	
	@GetMapping("/vodPost")
	public String vodPost() {
		logger.info("vod Post 페이지");
		
		return "/vod/vodPost";
	}
}
