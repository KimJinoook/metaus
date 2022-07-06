package com.metaus.mailbox.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.mailbox.model.MailboxAtcVO;
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
		
		//수신자 셋팅
		RecipientVO recipientVo = new RecipientVO();
		recipientVo.setMsgaddAdsee(msgaddAdsee);
		
		//수신자 번호 셋팅 - 등록한 쪽지 번호 셋팅
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
				
				MailboxAtcVO mailboxAtcVo = new MailboxAtcVO();
				mailboxAtcVo.setMsgNo(msgNo);
				mailboxAtcVo.setMfileFilename(fileName);
				mailboxAtcVo.setMfileOriginname(originalFileName);
				mailboxAtcVo.setMfileFilesize(fileSize);
				
				int cnt3=mailboxService.insertMailboxAtc(mailboxAtcVo);
				logger.info("메세지 첨부파일 처리 결과 cnt3={}", cnt3);

			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mailbox/mailbox";
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
		
		return "/mailbox/ajaxMailbox";
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
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/mailbox")
	public String mailNoByFlag(HttpSession session, Model model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		
		int receivedNo = mailboxService.findReceivedNo(memId);
		logger.info("받은 메세지 개수, receivedNo={}", receivedNo);
		
		int sentNo = mailboxService.findSentNo(memId);
		logger.info("보낸 메세지 개수, sentNo={}", sentNo);
		
		int starNo = mailboxService.findStarNo(memId);
		logger.info("별표 메세지 개수, starNo={}", starNo);
		
		int temporaryNo = mailboxService.findTemporaryNo(memId);
		logger.info("임시 보관함 개수, temporaryNo={}", temporaryNo);
		
		int spamNo = mailboxService.findSpamNo(memId);
		logger.info("임시 보관함 개수, spamNo={}", spamNo);
		
		int trashNo = mailboxService.findTrashNo(memId);
		logger.info("임시 보관함 개수, trashNo={}", trashNo);
		
		model.addAttribute("receivedNo", receivedNo);
		model.addAttribute("sentNo", sentNo);
		model.addAttribute("starNo", starNo);
		model.addAttribute("temporaryNo", temporaryNo);
		model.addAttribute("spamNo", spamNo);
		model.addAttribute("trashNo", trashNo);
		
		return "/mailbox/mailbox";
	}
	
	@RequestMapping("/mailDetail")
	public String mailDetail(@RequestParam(defaultValue = "0") int msgaddNo, ModelMap model) {
		logger.info("메세지 상세 조회, 매개변수 msgaddNo={}", msgaddNo);
		
		Map<String, Object> map = mailboxService.selectByMsgAddNo(msgaddNo);
		logger.info("메세지 상세 조회 결과, map={}", map);
		
		model.addAttribute("map", map);
		
		return "/mailbox/readMail";
	}
	
	@RequestMapping("/starFlagUpdate")
	@ResponseBody
	public int starFlagUpdate(HttpSession session, @RequestParam boolean emptyFlag, @RequestParam String msgaddNo) {
		String memId=(String) session.getAttribute("memId");
		logger.info("별표 메세지 처리 파라미터, memId={}, msgaddNo={}, emptyFlag={}", memId, msgaddNo, emptyFlag);
		
		Map<String, String> map = new HashMap<>();
		map.put("msgaddAdsee", memId);
		map.put("emptyFlag", emptyFlag+"");
		map.put("msgaddNo", msgaddNo);
		
		int cnt=mailboxService.updateStarFlag(map);
		logger.info("별표 플래그 업데이트 결과, cnt={}", cnt);
		
		int starNo=mailboxService.findStarNo(memId);
		
		return starNo;
	}
}
