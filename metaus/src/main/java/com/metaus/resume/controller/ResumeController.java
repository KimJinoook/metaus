package com.metaus.resume.controller;

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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;
import com.metaus.resume.model.PortfolioVO;
import com.metaus.resume.model.ResumeService;
import com.metaus.resume.model.ResumeVO;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/resume")
@RequiredArgsConstructor
public class ResumeController {
	private static final Logger logger
	=LoggerFactory.getLogger(ResumeController.class);
	
	private final ResumeService resumeService;
	private final MemberService memberService;
	private final FileUploadUtil fileUploadUtil;
	
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
		List<PortfolioVO> list=resumeService.selectmemNo(mvo.getMemNo());
		logger.info("list={}",list);
		model.addAttribute("list",list);
		model.addAttribute("mvo",mvo);
		model.addAttribute("rvo",rvo);
		
		return "/resume/resumeDetail";
	}
	@GetMapping("/resumeEdit")
	public void edit_get(HttpSession session,Model model) {
		String memId=(String)session.getAttribute("memId");
		logger.info("수정페이지 화면");
		
		MemberVO mvo=memberService.selectByUserid(memId);
		ResumeVO rvo=resumeService.selectBymemNo(mvo.getMemNo());
		model.addAttribute("mvo",mvo);
		model.addAttribute("rvo",rvo);
	}
	
	@PostMapping("/resumeEdit")
	public String edit_post(@ModelAttribute ResumeVO rvo,@RequestParam String resTime1,
			@RequestParam String resTime2,Model model) {
		logger.info("수정 처리,파라미터 rvo={}",rvo);
		
		String res1=resTime1;
		String res2=resTime2;
		String resTime=res1+"-"+res2;
		rvo.setResTime(resTime);
		
		int cnt=resumeService.updateresume(rvo);
		String msg="실패",url="/resume/resumeEdit";
		if(cnt>0) {
			msg="수정 성공";
			url="/resume/resumeDetail";
		}else {
			msg="수정 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "/common/message";
		
	}
	
	@GetMapping("/portfolio")
	public void get_portfolio(HttpSession session,Model model) {
		String memId=(String)session.getAttribute("memId");
		logger.info("포트폴리오 화면");
		
		MemberVO mvo=memberService.selectByUserid(memId);
		model.addAttribute("mvo",mvo);
	}
	
	@PostMapping("/portfolio")
	public String post_portfolio(@ModelAttribute PortfolioVO pvo, HttpServletRequest request,Model model) {
		logger.info("포트폴리오 처리,파라미터 pvo={}",pvo);
		
		
		/* MemberVO mvo=memberService.selectByUserid(memId); */
		ResumeVO rvo=resumeService.selectBymemNo(pvo.getMemNo());
		
		String fileName = "", originFileName = "";		
		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);

			for (Map<String, Object> fileMap : fileList) {
				originFileName = (String) fileMap.get("originalFileName");
				fileName = (String) fileMap.get("fileName");
			}
			logger.info("파일 업로드 성공, fileName={}", fileName);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		pvo.setMemNo(rvo.getMemNo());
		pvo.setPortFilename(fileName);
		pvo.setPortOriginname(originFileName);
		int cnt=resumeService.insertPortAtc(pvo);
		
		String msg="실패",url="/resume/portfolio";
		if(cnt>0) {
			msg="포트폴리오 등록 성공";
			url="/resume/resumeDetail?memNo="+rvo.getMemNo();				
		}else {
			msg="포트폴리오 등록 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "/common/message";
	}
	
	@GetMapping("/portfolioDetail")
	public void portdetail(@RequestParam(defaultValue = "0")int portNo,Model model) {
		logger.info("포트폴리오 상세보기,파라미터 portNo={}",portNo);
		
		PortfolioVO pvo=resumeService.selectportNo(portNo);
		model.addAttribute("pvo",pvo);
	}
	
	@PostMapping("/portfolioDetail")
	public String detailport(@RequestParam(defaultValue = "0")int portNo,Model model) {
		logger.info("삭제처리,파라미터 portNo={}",portNo);
		
		int cnt=resumeService.deleteport(portNo);
		String msg="실패",url="/resume/portfolioDetail";
		if(cnt>0) {
			msg="삭제성공";
			url="/resume/resumeDetail";
		}else {
			msg="삭제실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "/common/message";
	}
	
}
