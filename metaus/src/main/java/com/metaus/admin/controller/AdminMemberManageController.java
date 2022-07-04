package com.metaus.admin.controller;

import java.sql.Timestamp;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.admin.model.ManagerService;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

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
	public String memberUnlock(int memNo) {
		logger.info("일반회원 차단해제");
		
		int cnt = memberService.unlockMember(memNo);
		logger.info("일반회원 차단해제 cnt={}",cnt);
		
		return "redirect:/admin/member/memberList";
	}
	@RequestMapping("/cutmemberUnlock")
	public String cutmemberUnlock(int memNo) {
		logger.info("일반회원 차단해제");
		
		int cnt = memberService.unlockMember(memNo);
		logger.info("일반회원 차단해제 cnt={}",cnt);
		
		return "redirect:/admin/member/cutmemberList";
	}
	@RequestMapping("/memberLock")
	public String memberLock(@ModelAttribute MemberVO vo) {
		logger.info("일반회원 차단 vo={}",vo);
		
		Date date = new Date();
		long cutTime = (long)(vo.getMemWarncnt()*24*60*60*1000);		
		Timestamp timestamp = new Timestamp(date.getTime()+cutTime);
		
		
		vo.setMemCutdate(timestamp);
		
		int cnt = memberService.lockMember(vo);
		logger.info("일반회원 차단 cnt={}",cnt);
		
		return "redirect:/admin/member/memberList";
	}
	
	@RequestMapping("/managerDelete")
	public String managerDelete(int managerNo) {
		logger.info("관리자 삭제 managerNo={}",managerNo);
		
		
		int cnt = managerService.deleteByManagerNo(managerNo);
		logger.info("관리자 삭제 cnt={}",cnt);
		
		return "redirect:/admin/member/managerList";
	}
}
