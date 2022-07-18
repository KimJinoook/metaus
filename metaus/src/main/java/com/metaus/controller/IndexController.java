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
		
		return "/index_ex";
	}
	@RequestMapping("/index_ex2")
	public String index_ex() {
		logger.info("index 페이지");
		
		return "/index_ex2";
	}
	@RequestMapping("/test/test")
	public String test() {
		logger.info("test 페이지");
		
		return "/test/test";
	}
	@RequestMapping("/test/test3")
	public String test3() {
		logger.info("test3 페이지");
		
		return "/test/test3";
	}
	@RequestMapping("/test/test4")
	public String test4() {
		logger.info("test4 페이지");
		
		return "/test/test4";
	}
	@RequestMapping("/index-bak")
	public String ib() {
		logger.info("test4 페이지");
		
		return "/index-bak";
	}
	@RequestMapping("/test/testgeo")
	public String testgeo() {
		logger.info("testgeo 페이지");
		
		return "/test/testgeo";
	}
	@RequestMapping("/indexzip")
	public String indexzip() {
		logger.info("test 페이지");
		
		return "/indexzip";
	}
	
	@RequestMapping("/etc/create")
	public void create() {
		
	}
	
	
}

