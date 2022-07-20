package com.metaus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.common.EmailSender;
import com.metaus.member.model.MemberService;
import com.metaus.model.IndexService;
import com.metaus.model.IndexVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndexController.class);
	
	private final IndexService indexService;
	
	@RequestMapping("/")
	public String index(Model model) {
		logger.info("index 페이지");
		
		IndexVO cateCnt = indexService.selectCateCnt();
		model.addAttribute("cateCnt",cateCnt);
		
		IndexVO footCnt = indexService.selectFooterCnt();
		model.addAttribute("footCnt",footCnt);
		
		List<IndexVO> recList = indexService.selectRec();
		model.addAttribute("recList",recList);
		
		return "/index";
	}
	
	
	@RequestMapping("/etc/create")
	public void create() {
		
	}
	
	
}

