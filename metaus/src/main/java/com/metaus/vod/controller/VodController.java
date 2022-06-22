package com.metaus.vod.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
}
