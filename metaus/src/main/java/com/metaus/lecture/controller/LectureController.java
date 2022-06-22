package com.metaus.lecture.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lecture")
public class LectureController {
	private static final Logger logger
		= LoggerFactory.getLogger(LectureController.class);
	
	@RequestMapping("/lectureList")
	public String lectureList() {
		return "/lecture/lectureList";
	}
	
	@RequestMapping("/salesChart")
	public void salesChart() {
		logger.info("salesChart 페이지");
	}
	
	@RequestMapping("/chart_component")
	public void inline() {
		logger.info("chart_component 페이지");
	}
	
	@RequestMapping("/morris")
	public void morris() {
		logger.info("morris 페이지");
	}
	
}
