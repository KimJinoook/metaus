package com.metaus.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lecture")
public class LectureController {
	
	@RequestMapping("/lectureList")
	public String lectureList() {
		return "/lecture/lectureList";
	}
}
