package com.metaus.mailbox.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.mailbox.model.MailboxVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mailbox")
public class MailboxController {
	private static final Logger logger
		= LoggerFactory.getLogger(MailboxController.class);
	
	private FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/compose")
	public String compose() {
		return "/mailbox/compose";
	}
	
	@RequestMapping("/mailbox")
	public String mailbox() {
		return "/mailbox/mailbox";
	}
	
	@RequestMapping("/readMail")
	public String readMail() {
		return "/mailbox/readMail";
	}
	
	@RequestMapping("/sendMail")
	public String sendMail(@ModelAttribute MailboxVO vo, HttpServletRequest request
			, HttpSession session){
		logger.info("메세지 전송 처리, 파라미터 vo={}", vo);
		
		//파일 업로드 처리
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			List<Map<String, Object>> list
				=fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_MESSAGE_FLAG);
			
			for(Map<String, Object> fileMap : list) {
				//다중 파일 업로드
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mailbox/mailbox";
	}
}
