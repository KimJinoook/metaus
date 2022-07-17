package com.metaus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.model.IndexService;
import com.metaus.model.IndexVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ErrorsController implements ErrorController {
	private static final Logger logger
		=LoggerFactory.getLogger(ErrorsController.class);
	
	private final IndexService indexService;
	
	@RequestMapping("/error")
	public String index(Model model) {
		logger.info("index 페이지");
		
		IndexVO cateCnt = indexService.selectCateCnt();
		model.addAttribute("cateCnt",cateCnt);
		
		IndexVO footCnt = indexService.selectFooterCnt();
		model.addAttribute("footCnt",footCnt);
		
		List<IndexVO> recList = indexService.selectRec();
		model.addAttribute("recList",recList);
		
		return "/inc/404";
	}

	
	
}

