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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	
	@RequestMapping("/ajaxCompose")
	public String ajaxCompose() {
		return "/mailbox/ajaxCompose";
	}
	
	@RequestMapping("/readMail")
	public String readMail() {
		return "/mailbox/readMail";
	}
	
	@RequestMapping("/sendMail")
	public String sendMail(@ModelAttribute MailboxVO vo, @RequestParam(defaultValue = "temporary") String msgaddAdsee 
			,@RequestParam(defaultValue = "N") String temporaryFlag , HttpServletRequest request, HttpSession session){
		//test
		
		//임시저장 메세지 전송 처리
		Map<String, ?> flashMap =RequestContextUtils.getInputFlashMap(request);
		
		if(flashMap!=null) {
			MailboxVO mailboxVo = (MailboxVO) flashMap.get("mailboxVo");
			String msgaddAdsee2 = (String) flashMap.get("msgaddAdsee");
			logger.info("임시저장 메세지 전송 파라미터, mailboxVo={}, msgaddAdsee2={}", mailboxVo, msgaddAdsee2);
			
			msgaddAdsee = msgaddAdsee2;
			vo = mailboxVo;
		}
		
		//새 메세지 전송 처리
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		vo.setMsgaddAdser(memId);
		
		logger.info("메세지 전송 처리, 파라미터 vo={}, msgaddAdsee={}, temporaryFlag={}", vo, msgaddAdsee, temporaryFlag);
		
		int cnt=mailboxService.insertMailbox(vo);
		logger.info("메세지 등록 결과 cnt={}", cnt);
		
		//수신자 셋팅
		RecipientVO recipientVo = new RecipientVO();
		recipientVo.setMsgaddAdsee(msgaddAdsee);
		recipientVo.setTemporaryFlag(temporaryFlag);
		logger.info("수신자 셋팅 결과 recipientVo={}", recipientVo);
		
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
	
	@RequestMapping("/starMail")
	public String starMail(HttpSession session, ModelMap model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(memId, MailboxUtil.MSG_STAR_FLAG);
		logger.info("별표 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "star");
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/trashMail")
	public String trashMail(HttpSession session, ModelMap model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(memId, MailboxUtil.MSG_TRASH_FLAG);
		logger.info("삭제 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "trash");
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/spamMail")
	public String spamMail(HttpSession session, ModelMap model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(memId, MailboxUtil.MSG_SPAM_FLAG);
		logger.info("스팸 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "spam");
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/temporaryMail")
	public String temporaryMail(HttpSession session, ModelMap model) {
		String memId=(String) session.getAttribute("memId");
		logger.info("memId={}", memId);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(memId, MailboxUtil.MSG_TEMPORARY_FLAG);
		logger.info("스팸 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "temporary");
		
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
		logger.info("별표 메세지 처리 파라미터, msgaddNo={}, emptyFlag={}", msgaddNo, emptyFlag);
		
		Map<String, String> map = new HashMap<>();
		map.put("emptyFlag", emptyFlag+"");
		map.put("msgaddNo", msgaddNo);
		
		int cnt=mailboxService.updateStarFlag(map);
		logger.info("별표 플래그 업데이트 결과, cnt={}", cnt);
		
		int starNo=mailboxService.findStarNo(memId);
		
		return starNo;
	}
	
	@RequestMapping("/trashFlagUpdate")
	@ResponseBody	
	public Map<String, Integer> trashFlagUpdate(HttpSession session
			, @RequestParam List<String> msgaddNoList, @RequestParam String trashFlag) {
		logger.info("메세지 삭제 파라미터, msgaddNoList={}, trashFlag={}", msgaddNoList, trashFlag);
		
		for(String msgaddNo : msgaddNoList) {
			Map<String, String> map = new HashMap<>();
			map.put("msgaddNo", msgaddNo);
			map.put("trashFlag", trashFlag);
			
			int cnt=mailboxService.updateTrashFlag(map);
			logger.info("삭제 플래그 업데이트 결과, cnt={}", cnt);
		}
		
		Map<String, Integer> map = getMailboxNoMap(session);
		
		return map;
	}
	
	@RequestMapping("/spamFlagUpdate")
	@ResponseBody
	public Map<String, Integer> spamFlagUpdate(HttpSession session
			, @RequestParam List<String> msgaddNoList, @RequestParam String spamFlag){
		logger.info("메세지 스팸처리 파라미터, msgaddNoList={}, spamFlag={}", msgaddNoList, spamFlag);
		
		for(String msgaddNo : msgaddNoList) {
			Map<String, String> map = new HashMap<>();
			map.put("msgaddNo", msgaddNo);
			map.put("spamFlag", spamFlag);
			
			int cnt=mailboxService.updateSpamFlag(map);
			logger.info("스팸 플래그 업데이트 결과, cnt={}", cnt);
		}
		
		Map<String, Integer> map = getMailboxNoMap(session);
		
		return map;
	}
	
	@RequestMapping("/temporaryFlagUpdate")
	public String temporaryFlagUpdate(RedirectAttributes redirect
			, @ModelAttribute MailboxVO mailboxVo, @RequestParam(defaultValue = "0") int msgaddNo
			, @RequestParam String msgaddAdsee) {
		logger.info("임시저장 메세지 삭제 파라미터, msgaddNo={}", msgaddNo);
		logger.info("msgaddAdsee={}", msgaddAdsee);
		
		int cnt=mailboxService.delTemporaryMail(msgaddNo);
		logger.info("임시저장 메세지 삭제 결과, cnt={}", cnt);
		
		redirect.addFlashAttribute("mailboxVo", mailboxVo);
		redirect.addFlashAttribute("msgaddAdsee", msgaddAdsee);
		
		return "redirect:/mailbox/sendMail";
	}
	
	public Map<String, Integer> getMailboxNoMap(HttpSession session){
		String memId = (String) session.getAttribute("memId");
		
		int receivedNo = mailboxService.findReceivedNo(memId);
		int sentNo = mailboxService.findSentNo(memId);
		int starNo = mailboxService.findStarNo(memId);
		int temporaryNo = mailboxService.findTemporaryNo(memId);
		int spamNo = mailboxService.findSpamNo(memId);
		int trashNo = mailboxService.findTrashNo(memId);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("receivedNo", receivedNo);
		map.put("sentNo", sentNo);
		map.put("starNo", starNo);
		map.put("temporaryNo", temporaryNo);
		map.put("spamNo", spamNo);
		map.put("trashNo", trashNo);

		return map;
	}
}
