package com.metaus.mailbox.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.mailbox.model.MailboxDAO;
import com.metaus.mailbox.model.MailboxService;
import com.metaus.mailbox.model.MailboxUtil;
import com.metaus.mailbox.model.MailboxVO;
import com.metaus.mailbox.model.RecipientVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mailbox")
public class MailboxController {
	private static final Logger logger
		= LoggerFactory.getLogger(MailboxController.class);
	
	private final MailboxService mailboxService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/compose")
	public String compose() {
		return "/mailbox/compose";
	}
	
	@RequestMapping("/mailbox")
	public String mailbox() {
		return "redirect:/mailbox/receivedMail";
	}
	
	@RequestMapping("/readMail")
	public String readMail() {
		return "/mailbox/readMail";
	}
	
	@RequestMapping("/sendMail")
	public String sendMail(@ModelAttribute MailboxVO vo, @RequestParam String msgaddAdsee 
			, HttpServletRequest request, HttpSession session){
		//쪽지 등록 처리
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		vo.setMsgaddAdser(memId);
		
		logger.info("메세지 전송 처리, 파라미터 vo={}, msgaddAdsee={}", vo, msgaddAdsee);
		
		int cnt=mailboxService.insertMailbox(vo);
		logger.info("메세지 등록 결과 cnt={}", cnt);
		
		//수신자 등록 처리
		RecipientVO recipientVo = new RecipientVO();
		recipientVo.setMsgaddAdsee(msgaddAdsee);
		
		//등록한 쪽지 번호 셋팅
		int msgNo=mailboxService.selectMsgNo();
		recipientVo.setMsgNo(msgNo);
		logger.info("수신자 등록 처리 파라미터, recipientVo={}", recipientVo);
		
		int cnt2=mailboxService.insertRecipient(recipientVo);
		logger.info("수신자 등록 결과, cnt2={}", cnt2);
		
		//파일 업로드 처리
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			List<Map<String, Object>> list
				=fileUploadUtil.multiFileUpload(request, ConstUtil.UPLOAD_MESSAGE_FLAG);
			logger.info("업로드된 파일 목록 list={}", list);
			
			for(Map<String, Object> fileMap : list) {
				//다중 파일 업로드 처리
				originalFileName=(String) fileMap.get("originalFileName");
				fileName=(String) fileMap.get("fileName");
				fileSize= (long) fileMap.get("fileSize");	
				
				logger.info("파일 업로드 성공, fileName={}, fileSize={}", fileName,	fileSize);
				
				/*
				 * vo.setFileName(fileName); vo.setOriginalFileName(originFileName);
				 * vo.setFileSize(fileSize);
				 * 
				 * int cnt=reBoardService.insertReBoard(vo);
				 */
				logger.info("글쓰기 처리 결과, cnt={}", cnt);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mailbox/receivedMail";
	}
	
	@RequestMapping("/receivedMail")
	public String receivedMail(HttpSession session, ModelMap model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		
		List<Map<String, Object>> list 
			= mailboxService.selectMsgView(memId, MailboxUtil.MSG_RECEIVED_FLAG);
		logger.info("메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "received");
		
		return "/mailbox/mailboxByFlag";
	}
	
	@RequestMapping("/sentMail")
	public String sentMail(HttpSession session, ModelMap model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		
		List<Map<String, Object>> list 
			= mailboxService.selectMsgView(memId, MailboxUtil.MSG_SENT_FLAG);
		logger.info("메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "sent");
		
		return "/mailbox/mailboxByFlag";
	}
	
	@RequestMapping("/mailDetail")
	public String mailDetail(@RequestParam(defaultValue = "0") int msgNo, ModelMap model) {
		logger.info("메세지 상세 조회, 매개변수 msgNo={}", msgNo);
		
		Map<String, Object> map = mailboxService.selectByMsgNo(msgNo);
		logger.info("메세지 상세 조회 결과, map={}", map);
		
		model.addAttribute("map", map);
		
		return "/mailbox/readMail";
	}
}
