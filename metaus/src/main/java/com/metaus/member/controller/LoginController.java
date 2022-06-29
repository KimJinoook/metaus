package com.metaus.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;
import com.metaus.member.model.FacebookService;
import com.metaus.member.model.FacebookVO;
import com.metaus.member.model.KakaoService;
import com.metaus.member.model.KakaoVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;
import com.metaus.member.model.NaverService;
import com.metaus.member.model.NaverVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	private final MemberService memberService;
	private final CompanyService companyService;
	private final KakaoService kakaoService;
	private final NaverService naverService;
	private final FacebookService facebookService;
	
	
	
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
			session.setAttribute("memNo", memVo.getMemNo());
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
	
	@ResponseBody
	@RequestMapping("/ajaxLoginCheck")
	public int ajaxLoginCheck(@RequestParam String memId, @RequestParam(defaultValue = "0") String memPw) {
		logger.info("ajax 아이디 비밀번호 확인, 파라미터 memId={},memPw={}", memId,memPw);
		
		int result=memberService.checkLogin(memId, memPw);
		logger.info("로그인 처리 결과 result={}", result);
		return result;

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
			session.setAttribute("comNo", comVo.getComNo());
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
	@RequestMapping("/kakaologin")
	public String kakaologin_post(@ModelAttribute KakaoVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		logger.info("카카오 로그인 처리, 파라미터 vo={}", vo);
		
		KakaoVO kakaoVo = kakaoService.selectByUserid(vo.getKakaoEmail());
		String kakaoId = vo.getKakaoEmail().substring(0, vo.getKakaoEmail().indexOf("@"));
		logger.info("kakaoId={}",kakaoId);
		
		String url = "/", msg="로그인 실패";
		
		if(kakaoVo != null) {
			//[1] session에 저장
			MemberVO memVo = memberService.selectByMemNo(kakaoVo.getMemNo());
			
			HttpSession session=request.getSession();
			session.setAttribute("isLogin", "kakao");
			session.setAttribute("memNo", memVo.getMemNo());
			session.setAttribute("memId", memVo.getMemId());
			session.setAttribute("memName", memVo.getMemName());
			
			msg = memVo.getMemName()+"님 환영합니다";
			
		}else if(kakaoVo == null) {
			MemberVO memVo = memberService.selectBySocialid(kakaoId);
			model.addAttribute("vo",memVo);
			model.addAttribute("socialEmail",vo.getKakaoEmail());
			model.addAttribute("socialName",vo.getKakaoName());
			model.addAttribute("socialType","kakao");
			msg = "연동된 계정이 없습니다";
			return "/member/socialRegister";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/naverlogin")
	public String naverlogin_post(@ModelAttribute NaverVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		logger.info("카카오 로그인 처리, 파라미터 vo={}", vo);
		
		NaverVO naverVo = naverService.selectByUserid(vo.getNaverEmail());
		String naverId = vo.getNaverEmail().substring(0, vo.getNaverEmail().indexOf("@"));
		logger.info("naverId={}",naverId);
		
		String url = "/", msg="로그인 실패";
		
		if(naverVo != null) {
			//[1] session에 저장
			MemberVO memVo = memberService.selectByMemNo(naverVo.getMemNo());
			
			HttpSession session=request.getSession();
			session.setAttribute("isLogin", "naver");
			session.setAttribute("memNo", memVo.getMemNo());
			session.setAttribute("memId", memVo.getMemId());
			session.setAttribute("memName", memVo.getMemName());
			
			msg = memVo.getMemName()+"님 환영합니다";
			
		}else if(naverVo == null) {
			MemberVO memVo = memberService.selectBySocialid(naverId);
			model.addAttribute("vo",memVo);
			model.addAttribute("socialEmail",vo.getNaverEmail());
			model.addAttribute("socialName",vo.getNaverName());
			model.addAttribute("socialType","naver");
			msg = "연동된 계정이 없습니다";
			return "/member/socialRegister";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/facebooklogin")
	public String facebooklogin_post(@ModelAttribute FacebookVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		logger.info("카카오 로그인 처리, 파라미터 vo={}", vo);
		
		FacebookVO facebookVo = facebookService.selectByUserid(vo.getFacebookEmail());
		String facebookId = vo.getFacebookEmail().substring(0, vo.getFacebookEmail().indexOf("@"));
		logger.info("facebookId={}",facebookId);
		
		String url = "/", msg="로그인 실패";
		
		if(facebookVo != null) {
			//[1] session에 저장
			MemberVO memVo = memberService.selectByMemNo(facebookVo.getMemNo());
			
			HttpSession session=request.getSession();
			session.setAttribute("isLogin", "facebook");
			session.setAttribute("memNo", memVo.getMemNo());
			session.setAttribute("memId", memVo.getMemId());
			session.setAttribute("memName", memVo.getMemName());
			
			msg = memVo.getMemName()+"님 환영합니다";
			
		}else if(facebookVo == null) {
			MemberVO memVo = memberService.selectBySocialid(facebookId);
			model.addAttribute("vo",memVo);
			model.addAttribute("socialEmail",vo.getFacebookEmail());
			model.addAttribute("socialName",vo.getFacebookName());
			model.addAttribute("socialType","facebook");
			msg = "연동된 계정이 없습니다";
			return "/member/socialRegister";
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
	
	@RequestMapping("/navercallback")
	public String naverCallback() {
		return "/member/navercallback";
	}

}
