package com.metaus.chatting.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chatting")
public class ChattingController {
	private static final Logger logger
	=LoggerFactory.getLogger(ChattingController.class);

	@RequestMapping("/Chatting")
	public String memberChatting(HttpSession session, Model model) {

		String msg="로그인 후 이용가능합니다!", url="/";
		//세션에 저장된 회원 종류 가져오기
		String kind = (String)session.getAttribute("isLogin");
		if(kind!=null) {
			if(kind.equals("member")) {
				msg="개인회원 채팅페이지로 이동합니다.";
				url="/chatting/memberChatting";
			}else if(kind.equals("company")) {
				msg="기업회원 채팅페이지로 이동합니다.";
				url="/chatting/companyChatting";
			}
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";
	}

	//기업 회원 채팅창 화면
	@RequestMapping("/memberChatting")
	public String memberChatting() {
		logger.info("개인회원 채팅 페이지");

		return "/chatting/memberChatting";
	}

	//기업 회원 채팅창 화면
	@RequestMapping("/companyChatting")
	public String companyChatting() {
		logger.info("기업회원 채팅 페이지");

		return "/chatting/companyChatting";
	}
}
