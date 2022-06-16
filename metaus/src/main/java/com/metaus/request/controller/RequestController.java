package com.metaus.request.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/request")
public class RequestController {
	private static final Logger logger
	=LoggerFactory.getLogger(RequestController.class);
	
	@RequestMapping("/search")
	public String searchre() {
		logger.info("의뢰 검색 게시판");
		return "/request/search";
	}
	
	@RequestMapping("/detail")
	public String pagere() {
		logger.info("의뢰 글 페이지");
		return "/request/detail";
	}
	
	@RequestMapping("/post")
	public String postre() {
		logger.info("의뢰 작성 페이지");
		return "/request/post";
	}
}
