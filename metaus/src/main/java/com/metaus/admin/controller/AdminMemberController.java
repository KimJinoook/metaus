package com.metaus.admin.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.admin.model.ManagerService;
import com.metaus.admin.model.ManagerVO;
import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;
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
	private final CompanyService comService;
	
	@RequestMapping("/memberList")
	public void memberList(@ModelAttribute MemberVO mvo,Model model) {
		logger.info("일반 회원 조회 페이지");
		
		List<MemberVO> list=memberService.selectAll();
		logger.info("list={}",list);
		model.addAttribute("list",list);
		
		Date today = new Date();
		model.addAttribute("today",today);
	}
	
	@RequestMapping("/comList")
	public void comList(Model model) {
		logger.info("기업 회원 조회 페이지");
		
		List<CompanyVO> list=comService.selectAll();
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping("/managerList")
	public void managerList(Model model) {
		logger.info("관리자 조회 페이지");
		
		List<ManagerVO> list=managerService.selectAll();
		model.addAttribute("list",list);
	}
	@GetMapping("/register")
	public void get_manager() {
		logger.info("관리자 등록 페이지");
	}
	
	@PostMapping("/managerList")
	public String post_manager(@ModelAttribute ManagerVO vo,Model model) {
	logger.info("관리자 등록 처리, 파라미터 vo={}", vo);
		
		int cnt=managerService.insertMember(vo);
		logger.info("관리자 등록 결과, cnt={}", cnt);

		String msg="관리자 등록 실패", url="admin/member/register";
		if(cnt>0) {
			msg="관리자가 등록 되었습니다.";
			url="/admin/member/managerList";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";
	}
	
	@ResponseBody
	@RequestMapping("managerIdCheck")
	public int comIdCheck(String id) {
		int result = 0;
		if(id!=null && !id.isEmpty()) {
			result=managerService.duplicateId(id);
		
			logger.info("아이디 중복확인 결과, result={}", result);
		}
		
		return result;
	}
}
