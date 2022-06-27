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
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.mailbox.model.MailboxDAO;
import com.metaus.mailbox.model.MailboxVO;
import com.metaus.mailbox.model.RecipientVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mailbox")
public class MailboxController {
	private static final Logger logger
		= LoggerFactory.getLogger(MailboxController.class);
	
	private final MailboxDAO mailboxDao;
	private final FileUploadUtil fileUploadUtil;
	
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
	public String sendMail(@ModelAttribute MailboxVO vo, @RequestParam String msgaddAdsee 
			, HttpServletRequest request, HttpSession session){
		logger.info("메세지 전송 처리, 파라미터 vo={}, msgaddAdsee={}", vo, msgaddAdsee);
		
		//쪽지 등록 처리
		String userid=(String) session.getAttribute("userid");
		logger.info("userid={}", userid);
		//vo.setMsgaddAdser(userid);
		//임시 sender
		vo.setMsgaddAdser("test@naver.com");
		
		int cnt=mailboxDao.insertMailbox(vo);
		logger.info("메세지 등록 결과 cnt={}", cnt);
		
		//수신자 등록 처리
		RecipientVO recipientVo = new RecipientVO();
		recipientVo.setMsgaddAdsee(msgaddAdsee);
		
		//등록한 쪽지 번호 셋팅
		int msgNo=mailboxDao.selectMsgNo();
		recipientVo.setMsgNo(msgNo);
		logger.info("수신자 등록 처리 파라미터, recipientVo={}", recipientVo);
		
		int cnt2=mailboxDao.insertRecipient(recipientVo);
		logger.info("수신자 등록 결과, cnt2={}", cnt2);
		
		//파일 업로드 처리
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			List<Map<String, Object>> list
				=fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_MESSAGE_FLAG);
			logger.info("업로드된 파일 목록 list={}", list);
			
			for(Map<String, Object> fileMap : list) {
				//다중 파일 업로드 처리
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mailbox/mailbox";
	}
}
