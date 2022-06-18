package com.metaus.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	private final MemberService memberService;
	private final CompanyService companyService;
	
	
	
	@RequestMapping("/memberlogin")
	public String memlogin_post(@ModelAttribute MemberVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		logger.info("로그인 처리, 파라미터 vo={}", vo);
		
		int result=memberService.checkLogin(vo.getMemId(), vo.getMemPw());
		logger.info("로그인 처리 결과 result={}", result);
		
		String msg="로그인 처리 실패", url="/";
		if(result==MemberService.LOGIN_OK) {
			//회원정보 조회
			MemberVO memVo=memberService.selectByUserid(vo.getMemId());
			logger.info("로그인 처리-회원정보 조회결과 memVo={}", memVo);
			
			//[1] session에 저장
			HttpSession session=request.getSession();
			session.setAttribute("isLogin", "member");
			session.setAttribute("memNo", vo.getMemNo());
			session.setAttribute("memId", vo.getMemId());
			session.setAttribute("memName", memVo.getMemName());
			
			msg=memVo.getMemName() +"님 로그인되었습니다.";
			url="/";
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_USERID) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/companylogin")
	public String comlogin_post(@ModelAttribute CompanyVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		logger.info("로그인 처리, 파라미터 vo={}", vo);
		
		int result=companyService.checkLogin(vo.getComId(), vo.getComPw());
		logger.info("로그인 처리 결과 result={}", result);
		
		String msg="로그인 처리 실패", url="/";
		if(result==CompanyService.LOGIN_OK) {
			//회원정보 조회
			CompanyVO comVo=companyService.selectByUserid(vo.getComId());
			logger.info("로그인 처리-회원정보 조회결과 memVo={}", comVo);
			
			//[1] session에 저장
			HttpSession session=request.getSession();
			session.setAttribute("isLogin", "company");
			session.setAttribute("comNo", vo.getComNo());
			session.setAttribute("comId", vo.getComId());
			session.setAttribute("comName", comVo.getComName());
			
			msg=comVo.getComName() +"님 로그인되었습니다.";
			url="/";
		}else if(result==CompanyService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==CompanyService.NONE_USERID) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");		
		session.invalidate();

		return "redirect:/";
	}

}
