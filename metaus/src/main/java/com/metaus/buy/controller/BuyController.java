package com.metaus.buy.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.buy.model.BuyService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/buy")
@RequiredArgsConstructor
public class BuyController {
	private static final Logger logger
	=LoggerFactory.getLogger(BuyController.class);
	
	private final BuyService buyService;
	
	@RequestMapping("/delete")
	public String buyDel(HttpSession session, @RequestParam int pdNo, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("구매한 목록 삭제 파라미터 memNo={}",memNo);
		
		int cnt=buyService.deleteBuyByMemNo(memNo, pdNo);
		logger.info("구매한 목록 삭제 결과 cnt={}",cnt);
		
		String msg="삭제 실패했습니다.", url="/pd/myPdList";
		if(cnt>0) {
			msg="삭제되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "/common/message";
	}
}
