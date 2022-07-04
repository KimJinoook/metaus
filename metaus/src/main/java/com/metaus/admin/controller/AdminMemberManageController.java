package com.metaus.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.admin.model.ManagerService;
import com.metaus.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manage")
@RequiredArgsConstructor
public class AdminMemberManageController {

	private static final Logger logger
	=LoggerFactory.getLogger(AdminMemberManageController.class);
	
	private final ManagerService managerService;
	private final MemberService memberService;
	
	@RequestMapping("/memberUnlock")
	public String memberList(int memNo) {
		logger.info("일반회원 차단해제");
		
		int cnt = memberService.unlockMember(memNo);
		logger.info("일반회원 차단해제 cnt={}",cnt);
		
		return "redirect:/admin/member/memberList";
	}
}
