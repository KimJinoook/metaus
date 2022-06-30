package com.metaus.admin.controller;

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

import com.metaus.admin.model.ManagerService;
import com.metaus.admin.model.ManagerVO;
import com.metaus.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	private static final Logger logger
	=LoggerFactory.getLogger(AdminController.class);
	
	private final ManagerService managerService;
	
	@RequestMapping("/")
	public String index() {
		return "/admin/index";
	}
	
	@GetMapping("/login/adminLogin")
	public void adminLogin_get() {
		
	}
	
	@PostMapping("/login/adminLogin")
	public String adminLogin_post(@ModelAttribute ManagerVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		logger.info("로그인 처리, 파라미터 vo={}", vo);
		
		int result=managerService.checkLogin(vo.getManagerId(), vo.getManagerPwd());
		logger.info("로그인 처리 결과 result={}", result);
		
		String msg="로그인 처리 실패", url="/admin/login/adminLogin";
		if(result==MemberService.LOGIN_OK) {
			//회원정보 조회
			ManagerVO managerVo=managerService.selectByUserid(vo.getManagerId());
			logger.info("로그인 처리-회원정보 조회결과 memVo={}", managerVo);
			
			//[1] session에 저장
			HttpSession session=request.getSession();
			session.setAttribute("isAdmin", "admin");
			session.setAttribute("managerNo", managerVo.getManagerNo());
			session.setAttribute("managerId", vo.getManagerId());
			session.setAttribute("managerName", managerVo.getManagerName());
			
			msg=managerVo.getManagerName() +"님 로그인되었습니다.";
			url="/admin/";
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_USERID) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	@RequestMapping("/login/adminLogout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");		
		session.invalidate();

		return "redirect:/admin/login/adminLogin";
	}

}
