package com.metaus.controller;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.common.EmailSender;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	private final EmailSender emailSender;
	
	@RequestMapping("/signEmail")
	public String sendEmail(String receiver, String num) {
		String subject="메타어스 회원가입 이메일 인증번호 발송";
		String content = "인증번호 : "+num;
		String sender = "kimjin0132@naver.com";
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일발송");
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.info("이메일실패");
		}
		return "/common/close";
	}
}
