package com.metaus.creater.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/creater")
@RequiredArgsConstructor
public class CreaterController {
	
	private static final Logger logger = LoggerFactory.getLogger(CreaterController.class);

	private final MemberService memberService;

	
	@RequestMapping("/createrList")
	public void createrList(Model model) {
		logger.info("크리에이터 찾기 뷰");
		List<MemberVO> list =  memberService.selectAllCreater();
		logger.info("크리에이터 찾기 list={}",list);
		model.addAttribute("list",list);
	}
	
}
