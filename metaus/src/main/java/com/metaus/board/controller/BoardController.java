package com.metaus.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/freeBoard")
	public String freeBoard() {
		logger.info("기사 페이지");
		return "/board/freeBoard";
	}
	
	@RequestMapping("/QuestionBoard")
	public String QuestionBoard() {
		logger.info("QuestionBoard 페이지");
		return "/board/QuestionBoard";
	}
	
	@RequestMapping("/qna")
	public String qna() {
		logger.info("qna 페이지");
		return "/board/qna";
	}
	
	@RequestMapping("/shareBoard")
	public String shareBoard() {
		logger.info("shareBoard 페이지");
		return "/board/shareBoard";
	}
	
	@RequestMapping("/requestBoard")
	public String requestBoard() {
		logger.info("requestBoard 페이지");
		return "/board/requestBoard";
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite_get(@RequestParam(defaultValue = "0") int btypeNo,
			Model model) {
		logger.info("커뮤니티 글 작성 페이지, 파라미터 btypeNo={}",btypeNo);
		
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/boardWrite";
	}
	
	@PostMapping("/boardWrite")
	public String boardWrite_post() {
		logger.info("커뮤니티 글 작성 페이지");
		
		return "/board/";
	}
}
