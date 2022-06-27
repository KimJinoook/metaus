package com.metaus.pd.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.pd.model.PdService;
import com.metaus.pd.model.PdVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/pd")
@RequiredArgsConstructor
public class PdController {
	private static final Logger logger
	=LoggerFactory.getLogger(PdController.class);
	
	private final PdService pdService;
	
	@RequestMapping("/pd")
	public String pd() {
		logger.info("pd 페이지");
		
		return "/pd/pd";
	}
	
	@RequestMapping("/pdDetail")
	public void pd_Detail(@RequestParam int pdNo, Model model) {
		logger.info("상품 상세보기 화면, 파라미터 pdNo={}",pdNo);
		
		PdVO vo=pdService.selectPdByNo(pdNo);		
		logger.info("상품 상세보기 vo={}",vo);
		
		model.addAttribute("vo", vo);
	}
	
	@GetMapping("/pdPost")
	public String pd_get() {
		logger.info("pd Post 페이지");		
		
		return "/pd/pdPost";
	}
	
	@PostMapping("/pdPost")
	public String pd_Post(@ModelAttribute PdVO vo, HttpSession session, Model model) {
		logger.info("pd Post 등록처리, 파라미터 vo={}",vo);
		int cnt=pdService.insertPd(vo);
		
		return "/pd/pdDetail";
	}
}