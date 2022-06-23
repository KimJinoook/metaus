package com.metaus.vod.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.vod.model.VodVO;

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
	public String vodDetail(@RequestParam(defaultValue = "0") int class_no, Model model) {
		logger.info("vod Detail 페이지");
		
		return "/vod/vodDetail";
	}
	
	@GetMapping("/vodPost")
	public String vodPost(@ModelAttribute VodVO vo, HttpSession session,Model model) {
		logger.info("vod Post 페이지");
		
		return "/vod/vodPost";
	}
}
