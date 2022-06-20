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
		MemberVO mvo=memberService.selectByUserid(memId);
		logger.info("등록 mvo={}",mvo);
		String msg="실패",url="/resume/resumeWrite?memId="+mvo.getMemId();
		if(mvo.getMemId() != null && !mvo.getMemId().isEmpty()) {
			url="/resume/resumeWrite?memId="+mvo.getMemId();
		}else{
			msg="로그인 후 이용하세요";
			url="/";
		}
		model.addAttribute("mvo",mvo);
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "/common/message";
		
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
	public void detail(@RequestParam int memNo,@RequestParam String memid,Model model) {
		logger.info("상세보기 화면");
		MemberVO mvo=memberService.selectByUserid(memid);
		//ResumeVO rvo=resumeService.selectBymemNo(memNo);
		model.addAttribute("mvo",mvo);
		//model.addAttribute("rvo",rvo);
	}
	
}
