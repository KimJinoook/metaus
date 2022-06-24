package com.metaus.pd.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.pd.model.PdDAO;
import com.metaus.pd.model.PdVO;
import com.metaus.vod.model.VodDAO;
import com.metaus.vod.model.VodVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/pd")
@RequiredArgsConstructor
public class PdController {
	private static final Logger logger
	=LoggerFactory.getLogger(PdController.class);
	
	private final PdDAO pdDao;
	
	@RequestMapping("/pd")
	public String vod() {
		logger.info("pd 페이지");
		
		return "/pd/pd";
	}
	
	@RequestMapping("/pdDetail")
	public String vodDetail(@RequestParam(defaultValue = "0") int classNo, Model model) {
		logger.info("pd Detail 페이지");
		
		
		return "/pd/pdDetail";
	}
	
	@GetMapping("/pdPost")
	public String vodPost(@ModelAttribute PdVO vo, HttpSession session,Model model) {
		logger.info("pd Post 페이지");
		
		int cnt=pdDao.insertPd(vo);
		
		return "/pd/pdPost";
	}
}