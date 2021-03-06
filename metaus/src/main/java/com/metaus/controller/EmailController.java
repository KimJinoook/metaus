package com.metaus.controller;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.common.EmailSender;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	private final EmailSender emailSender;
	private final MemberService memberService;
	
	
	@ResponseBody
	@RequestMapping("/signEmail")
	public int sendEmail(String receiver, String num) {
		
		int echeck=0;
		int result=0;
		if(receiver!=null && !receiver.isEmpty()) {
				echeck=memberService.duplicateId(receiver);
			
			logger.info("이메일 중복확인 결과, echeck={}", echeck);
		}
	
		if(echeck==MemberService.UNUSABLE_ID) {
			result = MemberService.UNUSABLE_ID;
			return result;
		}else if(echeck==MemberService.USABLE_ID) {
			String subject="메타어스 회원가입 이메일 인증번호 발송";
			String content = "인증번호 : "+num;
			String sender = "kimjin0132@naver.com";
			
			try {
				emailSender.sendEmail(subject, content, receiver, sender);
				logger.info("이메일발송");
				result = MemberService.USABLE_ID;
				return result;
			} catch (MessagingException e) {
				e.printStackTrace();
				logger.info("이메일실패");
			}
		}
		
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/pwEmail")
	public int pwEmail(String receiver, String pw) {
		
		int result=0;

		String subject="메타어스 신규 비밀번호 발송";
		String content = "신규 비밀번호 : "+pw;
		String sender = "kimjin0132@naver.com";
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일발송");
			result = 1;
			MemberVO vo = new MemberVO();
			vo.setMemId(receiver);
			vo.setMemPw(pw);
			BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
			String memLock=encoder.encode(vo.getMemPw());
			vo.setMemLock(memLock);
			int cnt = memberService.updatePw(vo);
			
			
			return result;
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.info("이메일실패");
		}

		
		
		return result;
	}
}
