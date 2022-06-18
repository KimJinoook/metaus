package com.metaus.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.board.model.BoardService;
import com.metaus.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger
	=LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	
	@RequestMapping("/notice")
	public String notice(@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("notice 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(btypeNo);
		logger.info("notice 목록 조회 결과, list.size={}",list.size());

		model.addAttribute("list",list);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/notice";
	}
	
	@RequestMapping("/faq")
	public String faq(@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("FAQ 페이지");

		return "/board/faq";
	}
	
	@RequestMapping("/news")
	public String news(@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("news 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(btypeNo);
		logger.info("news 목록 조회 결과, list.size={}",list.size());

		model.addAttribute("list",list);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/news";
	}
	
	@RequestMapping("/freeBoard")
	public String freeBoard(@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("freeBoard 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(btypeNo);
		logger.info("freeBoard 목록 조회 결과, list.size={}",list.size());

		model.addAttribute("list",list);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/freeBoard";
	}
	
	@RequestMapping("/QuestionBoard")
	public String QuestionBoard(@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("QuestionBoard 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(btypeNo);
		logger.info("QuestionBoard 목록 조회 결과, list.size={}",list.size());

		model.addAttribute("list",list);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/QuestionBoard";
	}
	
	@RequestMapping("/qna")
	public String qna(@RequestParam(defaultValue = "0")int btypeNo, ModelMap model) {
		logger.info("qna 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(btypeNo);
		logger.info("qna 목록 조회 결과, list.size={}",list.size());

		model.addAttribute("list",list);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/qna";
	}
	
	@RequestMapping("/shareBoard")
	public String shareBoard(@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("shareBoard 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(btypeNo);
		logger.info("shareBoard 목록 조회 결과, list.size={}",list.size());

		model.addAttribute("list",list);
		model.addAttribute("btypeNo", btypeNo);
		
		return "/board/shareBoard";
	}
	
	@RequestMapping("/requestBoard")
	public String requestBoard(@RequestParam(defaultValue = "0")int btypeNo, Model model) {
		logger.info("requestBoard 페이지 - 게시판 종류 btypeNo={}", btypeNo);
		
		List<Map<String, Object>>list = boardService.selectBoard(btypeNo);
		logger.info("requestBoard 목록 조회 결과, list.size={}",list.size());

		model.addAttribute("list",list);
		model.addAttribute("btypeNo", btypeNo);
		
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
	public String boardWrite_post(@RequestParam int btypeNo,
			@ModelAttribute BoardVO boardVo, Model model) {
		logger.info("커뮤니티 글 작성 페이지, 파라미터 btypeNo={}", btypeNo);
		
		boardVo.setBtypeNo(btypeNo);
		int cnt = boardService.insertBoard(boardVo);
		logger.info("글 작성 결과 조회, cnt={}", cnt);
		
		if(cnt>0) {
			logger.info("글 작성 성공!");
		}else {
			logger.info("글 작성 실패!");
		}
		
		
		if(btypeNo==3) {
			return "redirect:/board/qna";
		}else if(btypeNo==8) {
			return "redirect:/board/freeBoard";
		}else if(btypeNo==5) {
			return "redirect:/board/QuestionBoard";
		}else if(btypeNo==6) {
			return "redirect:/board/shareBoard";
		}else if(btypeNo==7) {
			return "redirect:/board/requestBoard";
		}
		return "/";
	}
}
