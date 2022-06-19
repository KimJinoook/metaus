package com.metaus.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.member.model.CompanyService;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final MemberService memberService;
	private final CompanyService companyService;
	
	@GetMapping("/register")
	public void register_get() {
		logger.info("회원가입 뷰");
	}
	
	@PostMapping("/memberRegister")
	public String memregister_post(@ModelAttribute MemberVO vo, Model model) {
		logger.info("일반회원 회원가입 처리, 파라미터 vo={}", vo);
		
		int cnt=memberService.insertMember(vo);
		logger.info("회원가입 결과, cnt={}", cnt);

		String msg="회원가입 실패", url="/member/register";
		if(cnt>0) {
			msg="회원가입되었습니다.";
			url="/";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";
		
	}

}
