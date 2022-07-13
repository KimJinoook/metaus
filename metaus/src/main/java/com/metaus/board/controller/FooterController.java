package com.metaus.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.board.model.BoardService;
import com.metaus.board.model.BoardVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/inc")
public class FooterController {
	private static final Logger logger
	=LoggerFactory.getLogger(FooterController.class);

	private final BoardService boardService;
	
	
	@RequestMapping("/footer")
	public void footer(Model model) {
		List<BoardVO> fList = boardService.PopularSelect2();
		logger.info("인기글 불러오기");
		
		model.addAttribute("fList", fList);
		
	}
}
