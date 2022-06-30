package com.metaus.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.admin.model.ManagerService;
import com.metaus.member.model.MemberService;

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
	public void memberList() {
		
	}
}
