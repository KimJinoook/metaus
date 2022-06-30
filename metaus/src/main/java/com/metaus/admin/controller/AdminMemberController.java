package com.metaus.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.admin.model.ManagerService;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {

	private static final Logger logger
	=LoggerFactory.getLogger(AdminMemberController.class);
	
	private final ManagerService managerService;
	private final MemberService memberService;
	
	@RequestMapping("/memberList")
	public void memberList(@ModelAttribute MemberVO mvo,Model model) {
		logger.info("일반 회원 조회 페이지");
		
		List<MemberVO> list=memberService.selectAll();
		logger.info("list={}",list);
		model.addAttribute("list",list);
	}
}
