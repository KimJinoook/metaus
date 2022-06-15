package com.metaus.layout.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/layout")
public class LayoutController {
	private static final Logger logger
	= LoggerFactory.getLogger(LayoutController.class);
	
	@RequestMapping("/sidebar")
	public String sidebar() {
		logger.info("sidebar 화면");
		
		return "/layout/sidebar";
	}
}
