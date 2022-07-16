package com.metaus.pdReview.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.pdReview.model.PdReviewService;
import com.metaus.pdReview.model.PdReviewVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/pd")
@RequiredArgsConstructor
public class PdReviewController {
	private static final Logger logger
	=LoggerFactory.getLogger(PdReviewController.class);
	
	private final PdReviewService pdReviewService;
	
	@PostMapping("/review")
	public String postReview(@RequestParam int pdNo, HttpSession session, @ModelAttribute PdReviewVO vo, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("리뷰 등록 페이지 파라미터 pdNo={}, memNo={}",pdNo, memNo);
		vo.setMemNo(memNo);
		vo.setPdNo(pdNo);
		int cnt=pdReviewService.insertPdReview(vo);
		logger.info("리뷰 등록 처리 파라미터 cnt={},vo={}",cnt,vo);
				
		return "redirect:/pd/pdDetail?pdNo="+pdNo;
	}
	
	@RequestMapping("/delete")
	public String pdReviewDel(HttpServletRequest request,@RequestParam int reviewNo, Model model) {
		logger.info("리뷰 삭제 파라미터 reviewNo={}", reviewNo);
		int cnt=pdReviewService.deletePdReview(reviewNo);
		
		logger.info("리뷰 삭제 결과 cnt={}", cnt);		
		String msg="삭제 실패했습니다.", url=request.getHeader("Referer");
		
		if(cnt>0) {
			msg="삭제 되었습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "/common/message";
	}
}
