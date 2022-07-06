package com.metaus.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/ModifyInfo")
@RequiredArgsConstructor
public class UpdateController {
	
	private static final Logger logger = LoggerFactory.getLogger(UpdateController.class);
	
	private final MemberService memberService;
	private final CompanyService companyService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/UpdateInfo")
	public String updatePage(HttpSession session, Model model) {
		String kind = (String)session.getAttribute("isLogin");
		logger.info("정보 수정 페이지 회원 종류 isLogin={}",kind);
		
		String msg="정보수정 페이지 이동 실패!", url="/";
		if(kind.equals("company")) {
			msg="[기업회원] 정보수정 페이지로 이동합니다.";
			url="/ModifyInfo/companyUpdate";
			logger.info("url={}",url);
		}else if(kind.equals("member")) {
			msg="[개인회원] 정보수정 페이지로 이동합니다.";
			url="/ModifyInfo/memberUpdate";
			logger.info("url={}",url);
		}else {
			msg="로그인이 필요한 메뉴입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@GetMapping("/memberUpdate")
	public String memberUpdate_get(HttpSession session, Model model) {
		logger.info("개인 회원 - 정보수정페이지");
		
		String memId = (String)session.getAttribute("memId");
		MemberVO memVo = memberService.selectByUserid(memId);
		
		model.addAttribute("memVo", memVo);
		logger.info("memVo={}", memVo);
		
		return "/ModifyInfo/memberUpdate";
	}
	
	@PostMapping("/memberUpdate")
	public String memberUpdate_post(@ModelAttribute MemberVO vo, HttpServletRequest request, Model model) {
		logger.info("개인 회원 - 정보수정페이지 vo={}", vo);
		
		String fileName = "";
		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_MEMBER_PROFILE_FLAG);
			
			for (Map<String, Object> fileMap : fileList) {
				fileName = (String) fileMap.get("fileName");
			}
			logger.info("파일 업로드 성공, fileName={}", fileName);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setMemPic(fileName);
		
		int cnt = memberService.updateMember(vo);
		logger.info("정보수정 결과 cnt={}", cnt);
		
		return "redirect:/ModifyInfo/memberUpdate";
	}
	
	@GetMapping("/companyUpdate")
	public String companyUpdate_get(HttpSession session, Model model) {
		logger.info("기업 회원 - 정보수정페이지");
		
		String comId = (String)session.getAttribute("comId");
		CompanyVO vo = companyService.selectByUserid(comId);
		
		model.addAttribute("comVo", vo);
		logger.info("comVo={}", vo);
		
		return "/ModifyInfo/companyUpdate";
	}
	
	@PostMapping("/companyUpdate")
	public String companyUpdate_post(HttpSession session, Model model) {
		logger.info("기업 회원 - 정보수정페이지");
		
		String comId = (String)session.getAttribute("comId");
		CompanyVO vo = companyService.selectByUserid(comId);
		
		model.addAttribute("comVo", vo);
		logger.info("comVo={}", vo);
		
		return "/ModifyInfo/companyUpdate";
	}
	
}
