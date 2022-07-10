package com.metaus.admin.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.metaus.admin.model.ManagerBoardService;
import com.metaus.admin.model.ManagerMailboxService;
import com.metaus.admin.model.ManagerPdService;
import com.metaus.admin.model.ManagerService;
import com.metaus.admin.model.ManagerVO;
import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.mailbox.model.MailboxAtcVO;
import com.metaus.mailbox.model.MailboxService;
import com.metaus.mailbox.model.MailboxUtil;
import com.metaus.mailbox.model.MailboxVO;
import com.metaus.mailbox.model.RecipientVO;
import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/mail")
@RequiredArgsConstructor
public class AdminMailController {

	private static final Logger logger
	=LoggerFactory.getLogger(AdminMailController.class);
	
	private final ManagerService managerService;
	private final MemberService memberService;
	private final CompanyService comService;
	private final ManagerBoardService managerBoardService;
	private final ManagerPdService managerPdService;
	private final MailboxService mailboxService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/mailList")
	public void mailList(@RequestParam(defaultValue = "1") int getinFlag, Model model, String msgaddAdsee) {
		model.addAttribute("getinFlag",getinFlag);
		model.addAttribute("msgaddAdsee",msgaddAdsee);
	}
	
	@GetMapping("/sendAll")
	public void sendAll_get() {
		
	}
	
	@PostMapping("/sendAll")
	public String sendAll_post(@ModelAttribute MailboxVO vo, @RequestParam String[] mailScope, HttpSession session, Model model){
		
		String memId=(String) session.getAttribute("managerId");
		logger.info("memId={}", memId);
		vo.setMsgaddAdser(memId);
		
		logger.info("메세지 전송 처리, 파라미터 vo={}", vo);
		
		int cnt1=mailboxService.insertMailbox(vo);
		logger.info("메세지 송신자 등록 결과 cnt={}", cnt1);
		
		int cnt3=0;
		for(int i=0; i<mailScope.length;i++) {
			if(mailScope[i].equals("1")) {
				List<MemberVO> list = memberService.selectAll();
				
				for(int j=0; j<list.size(); j++) {
					MemberVO memberVo = list.get(j);
					RecipientVO recipientVo = new RecipientVO();
					recipientVo.setMsgaddAdsee(memberVo.getMemId());
					recipientVo.setTemporaryFlag("N");
					
					int msgNo=mailboxService.selectMsgNo();
					recipientVo.setMsgNo(msgNo);
					
					int cnt2=mailboxService.insertRecipient(recipientVo);
					if(cnt2>0) {
						cnt3++;
					}
				}
				
			}else if(mailScope[i].equals("2")) {
				List<CompanyVO> list = comService.selectAll();
				
				for(int j=0; j<list.size(); j++) {
					CompanyVO memberVo = list.get(j);
					RecipientVO recipientVo = new RecipientVO();
					recipientVo.setMsgaddAdsee(memberVo.getComId());
					recipientVo.setTemporaryFlag("N");
					
					int msgNo=mailboxService.selectMsgNo();
					recipientVo.setMsgNo(msgNo);
					
					int cnt2=mailboxService.insertRecipient(recipientVo);
					if(cnt2>0) {
						cnt3++;
					}
				}
				
			}else if(mailScope[i].equals("3")) {
				List<ManagerVO> list = managerService.selectAll();
				
				for(int j=0; j<list.size(); j++) {
					ManagerVO memberVo = list.get(j);
					RecipientVO recipientVo = new RecipientVO();
					recipientVo.setMsgaddAdsee(memberVo.getManagerId());
					recipientVo.setTemporaryFlag("N");
					
					int msgNo=mailboxService.selectMsgNo();
					recipientVo.setMsgNo(msgNo);
					
					int cnt2=mailboxService.insertRecipient(recipientVo);
					if(cnt2>0) {
						cnt3++;
					}
				}
				
			}
			
		}
		logger.info("전체발송 결과 발숭 메세지 수 cnt3={}",cnt3);
		String msg="메세지 발송 실패", url="/admin/mail/sendAll";
		if(cnt3>0) {
			msg="메세지 발송 성공, 발송 메세지 수 = "+cnt3;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		
		

		return "/common/message";
	}

	@RequestMapping("/ajaxMail")
	public String ajaxMail(HttpSession session, ModelMap model, @RequestParam(defaultValue = "1") int flag) {
		String memId=(String) session.getAttribute("managerId");
		logger.info("memId={}", memId);
		
		List<Map<String, Object>> list 
			= mailboxService.selectMsgView(memId, flag);
		logger.info("메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", flag);
		
		return "/admin/mail/ajaxMailbox";
	}
	
	@RequestMapping("/ajaxCompose")
	public String ajaxCompose(String msgaddAdsee, Model model) {
		model.addAttribute("msgaddAdsee",msgaddAdsee);
		return "/admin/mail/ajaxCompose";
	}
	
	@RequestMapping("/sendMail")
	public String sendMail(@ModelAttribute MailboxVO vo, @RequestParam(defaultValue = "temporary") String msgaddAdsee
			,@RequestParam(defaultValue = "0") int msgaddNo
			,@RequestParam(defaultValue = "N") String temporaryFlag , HttpServletRequest request, HttpSession session){
		//임시저장 메세지 전송 처리
		/*Map<String, ?> flashMap =RequestContextUtils.getInputFlashMap(request);
		
		if(flashMap!=null) {
			MailboxVO mailboxVo = (MailboxVO) flashMap.get("mailboxVo");
			String msgaddAdsee2 = (String) flashMap.get("msgaddAdsee");
			logger.info("임시저장 메세지 전송 파라미터, mailboxVo={}, msgaddAdsee2={}", mailboxVo, msgaddAdsee2);
			
			msgaddAdsee = msgaddAdsee2;
			vo = mailboxVo;
		}*/
		
		int cnt=mailboxService.delTemporaryMail(msgaddNo);
		logger.info("임시저장 메세지 삭제 결과, cnt={}", cnt);
		
		//새 메세지 전송 처리
		String memId=(String) session.getAttribute("managerId");
		logger.info("memId={}", memId);
		vo.setMsgaddAdser(memId);
		
		logger.info("메세지 전송 처리, 파라미터 vo={}, msgaddAdsee={}, temporaryFlag={}", vo, msgaddAdsee, temporaryFlag);
		
		int cnt1=mailboxService.insertMailbox(vo);
		logger.info("메세지 등록 결과 cnt={}", cnt1);
		
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
		
		return "redirect:/admin/mail/mailList";
	}
	
	@RequestMapping("/selectTemporaryMail")
	public String selectTemporaryMail(@RequestParam(defaultValue = "0") int msgaddNo
			, @RequestParam(defaultValue = "0") int msgNo, Model model) {
		logger.info("임시저장 메세지 상세보기, 파라미터 msgaddNo={}, msgNo={}", msgaddNo, msgNo);
		
		Map<String, Object> map = mailboxService.selectByMsgAddNo(msgaddNo);
		List<MailboxAtcVO> list = mailboxService.selectMsgAtcByMsgNo(msgNo);
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "/admin/mail/ajaxCompose";
	}
	
	@RequestMapping("/mailDetail")
	public String mailDetail(@RequestParam(defaultValue = "0") int msgaddNo, @RequestParam(defaultValue = "0") int msgNo
			, ModelMap model) {
		logger.info("메세지 상세 조회, 매개변수 msgaddNo={}, msgNo={}", msgaddNo, msgNo);
		
		Map<String, Object> map = mailboxService.selectByMsgAddNo(msgaddNo);
		logger.info("메세지 상세 조회 결과, map={}", map);
		
		Timestamp msgaddDate = (Timestamp) map.get("MSGADD_DATE");
		if(msgaddDate == null) {
			int cnt = mailboxService.updateMsgaddDate(msgaddNo);
			map = mailboxService.selectByMsgAddNo(msgaddNo);
			logger.info("메세지 읽은 날짜 업데이트 결과, cnt={}, map={}", cnt, map);
		}
		
		List<MailboxAtcVO> list = mailboxService.selectMsgAtcByMsgNo(msgNo);
		logger.info("메세지 첨부파일 조회 결과, list.size={}", list.size());
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "/admin/mail/mailDetail";
	}
	@RequestMapping("/ajaxmailDetail")
	public String ajaxmailDetail(@RequestParam(defaultValue = "0") int msgaddNo, @RequestParam(defaultValue = "0") int msgNo
			, ModelMap model) {
		logger.info("메세지 상세 조회, 매개변수 msgaddNo={}, msgNo={}", msgaddNo, msgNo);
		
		Map<String, Object> map = mailboxService.selectByMsgAddNo(msgaddNo);
		logger.info("메세지 상세 조회 결과, map={}", map);
		
		Timestamp msgaddDate = (Timestamp) map.get("MSGADD_DATE");
		if(msgaddDate == null) {
			int cnt = mailboxService.updateMsgaddDate(msgaddNo);
			map = mailboxService.selectByMsgAddNo(msgaddNo);
			logger.info("메세지 읽은 날짜 업데이트 결과, cnt={}, map={}", cnt, map);
		}
		
		List<MailboxAtcVO> list = mailboxService.selectMsgAtcByMsgNo(msgNo);
		logger.info("메세지 첨부파일 조회 결과, list.size={}", list.size());
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "/admin/mail/ajaxReadMail";
	}
	
	@ResponseBody
	@RequestMapping("/temporaryFlagUpdate")
	public String temporaryFlagUpdate(@RequestParam(defaultValue = "0") int msgaddNo) {
		
		
		int cnt=mailboxService.delTemporaryMail(msgaddNo);
		logger.info("임시저장 메세지 삭제 결과, cnt={}", cnt);
		
		
		return "a";
	}
	
}
