package com.metaus.resume.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;
import com.metaus.resume.model.ResumeService;
import com.metaus.resume.model.ResumeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/resume")
@RequiredArgsConstructor
public class ResumeController {
	private static final Logger logger
	=LoggerFactory.getLogger(ResumeController.class);
	
	private final ResumeService resumeService;
	private final MemberService memberService;
	
	@GetMapping("/resumeWrite")
	public String get_write(HttpSession session,Model model) {		
		String memId=(String)session.getAttribute("memId");
		logger.info("등록 화면");
		if(memId==null || memId.isEmpty()) {
			return "/index";
		}
		MemberVO mvo=memberService.selectByUserid(memId);
		logger.info("등록 mvo={}",mvo);

		
		model.addAttribute("mvo",mvo);

		
		return "/resume/resumeWrite";
		
	}
	
	@PostMapping("/resumeWrite")
	public String post_write(@ModelAttribute ResumeVO Rvo,@RequestParam String resTime1,
			@RequestParam String resTime2,Model model) {
		logger.info("등록 처리,파라미터 Rvo={},resTime1= {}",Rvo,resTime1);
		
		String res1=resTime1;
		String res2=resTime2;
		String resTime=res1+"-"+res2;
		Rvo.setResTime(resTime);		
		
		int cnt=resumeService.insertresume(Rvo);
		logger.info("등록 처리 결과 cnt={}",cnt);		
		
		return "redirect:/resume/resumeDetail";
		
	}
	
	@RequestMapping("/resumeDetail")
	public String detail(HttpSession session,Model model) {
		String memId=(String)session.getAttribute("memId");
		logger.info("상세보기 화면");
		MemberVO mvo=memberService.selectByUserid(memId);
		ResumeVO rvo=resumeService.selectBymemNo(mvo.getMemNo());
		if(rvo==null) {
			return "redirect:/resume/resumeWrite";
		}
		model.addAttribute("mvo",mvo);
		model.addAttribute("rvo",rvo);
		
		return "/resume/resumeDetail";
	}
	
}
