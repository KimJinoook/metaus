package com.metaus.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/company")
@RequiredArgsConstructor
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

	private final CompanyService companyService;
	
	@PostMapping("/companyRegister")
	public String memregister_post(@ModelAttribute CompanyVO vo, Model model) {
		logger.info("기업회원 회원가입 처리, 파라미터 vo={}", vo);
		
		int cnt=companyService.insertCompany(vo);
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
	
	@ResponseBody
	@RequestMapping("comIdCheck")
	public int comIdCheck(String id) {
		int result = 0;
		if(id!=null && !id.isEmpty()) {
			result=companyService.duplicateId(id);
		
			logger.info("아이디 중복확인 결과, result={}", result);
		}
		
		return result;
	}

}
