package com.metaus.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger
	=LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/notice")
	public String notice() {
		logger.info("공지사항 페이지");
		return "/board/notice";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		logger.info("FAQ 페이지");
		return "/board/faq";
	}
	
	@RequestMapping("/news")
	public String news() {
		logger.info("기사 페이지");
		return "/board/news";
	}
}
