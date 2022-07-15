package com.metaus.mailbox.controller;

import java.sql.Timestamp;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;
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
		/*String memId=(String) session.getAttribute("memId");
		
		logger.info("memId={}", memId);
		vo.setMsgaddAdser(memId);*/
		
		String user = "";
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			user = (String) session.getAttribute("memId");
		}else {
			user = (String) session.getAttribute("comId");
		}
		
		logger.info("user={}", user);
		vo.setMsgaddAdser(user);
		
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
		
		return "redirect:/mailbox/receivedMail";
	}
	
	public PaginationInfo getPagingInfo(String sCurrentPage, int totalRecord) {
		SearchVO searchVo = new SearchVO();
		int currentPage =Integer.parseInt(sCurrentPage);
		searchVo.setCurrentPage(currentPage);
		
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.MESSEAGE_RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//[2] searchVo에 페이징 처리 관련 변수의 값 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		//totalRecord개수 구하기
		logger.info("글목록 totalRecord={}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);
		
		return pagingInfo;
	}
	
	@RequestMapping("/receivedMail")
	public String receivedMail(HttpSession session
			, @RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "1") String currentPage, ModelMap model) {
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
		logger.info("memId={}", memId);
		
		//페이징 처리
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("searchKeyword", searchKeyword);
		
		int totalRecord = mailboxService.getRecipientCount(map);
		PaginationInfo pagingInfo = getPagingInfo(currentPage, totalRecord);
		int firstRecordIndex = pagingInfo.getFirstRecordIndex();
		int recordCountPerPage = pagingInfo.getRecordCountPerPage();
		map.put("firstRecordIndex", firstRecordIndex);
		map.put("recordCountPerPage", recordCountPerPage);
		
		List<Map<String, Object>> list
			= mailboxService.selectMsgView(map, MailboxUtil.MSG_RECEIVED_FLAG);
		logger.info("받은 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "received");
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/sentMail")
	public String sentMail(HttpSession session
			, @RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "1") String currentPage, ModelMap model) {
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
		logger.info("memId={}", memId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("searchKeyword", searchKeyword);
		
		int totalRecord = mailboxService.getSenderCount(map);
		PaginationInfo pagingInfo = getPagingInfo(currentPage, totalRecord);
		int firstRecordIndex = pagingInfo.getFirstRecordIndex();
		int recordCountPerPage = pagingInfo.getRecordCountPerPage();
		map.put("firstRecordIndex", firstRecordIndex);
		map.put("recordCountPerPage", recordCountPerPage);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(map, MailboxUtil.MSG_SENT_FLAG);
		logger.info("메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "sent");
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/starMail")
	public String starMail(HttpSession session
			, @RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "1") String currentPage, ModelMap model) {
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
		logger.info("memId={}", memId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("searchKeyword", searchKeyword);
		
		int totalRecord = mailboxService.getStarCount(map);
		PaginationInfo pagingInfo = getPagingInfo(currentPage, totalRecord);
		int firstRecordIndex = pagingInfo.getFirstRecordIndex();
		int recordCountPerPage = pagingInfo.getRecordCountPerPage();
		map.put("firstRecordIndex", firstRecordIndex);
		map.put("recordCountPerPage", recordCountPerPage);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(map, MailboxUtil.MSG_STAR_FLAG);
		logger.info("별표 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "star");
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/trashMail")
	public String trashMail(HttpSession session
			, @RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "1") String currentPage, ModelMap model) {
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
		logger.info("memId={}", memId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("searchKeyword", searchKeyword);
		
		int totalRecord = mailboxService.getTrashCount(map);
		PaginationInfo pagingInfo = getPagingInfo(currentPage, totalRecord);
		int firstRecordIndex = pagingInfo.getFirstRecordIndex();
		int recordCountPerPage = pagingInfo.getRecordCountPerPage();
		map.put("firstRecordIndex", firstRecordIndex);
		map.put("recordCountPerPage", recordCountPerPage);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(map, MailboxUtil.MSG_TRASH_FLAG);
		logger.info("삭제 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "trash");
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/spamMail")
	public String spamMail(HttpSession session
			, @RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "1") String currentPage, ModelMap model) {
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
		logger.info("memId={}", memId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("searchKeyword", searchKeyword);
		
		int totalRecord = mailboxService.getSpamCount(map);
		PaginationInfo pagingInfo = getPagingInfo(currentPage, totalRecord);
		int firstRecordIndex = pagingInfo.getFirstRecordIndex();
		int recordCountPerPage = pagingInfo.getRecordCountPerPage();
		map.put("firstRecordIndex", firstRecordIndex);
		map.put("recordCountPerPage", recordCountPerPage);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(map, MailboxUtil.MSG_SPAM_FLAG);
		logger.info("스팸 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "spam");
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/temporaryMail")
	public String temporaryMail(HttpSession session
			, @RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "1") String currentPage, ModelMap model) {
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
		logger.info("memId={}", memId);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", memId);
		map.put("searchKeyword", searchKeyword);
		
		int totalRecord = mailboxService.getTemporaryCount(map);
		PaginationInfo pagingInfo = getPagingInfo(currentPage, totalRecord);
		int firstRecordIndex = pagingInfo.getFirstRecordIndex();
		int recordCountPerPage = pagingInfo.getRecordCountPerPage();
		map.put("firstRecordIndex", firstRecordIndex);
		map.put("recordCountPerPage", recordCountPerPage);
		
		List<Map<String, Object>> list 
		= mailboxService.selectMsgView(map, MailboxUtil.MSG_TEMPORARY_FLAG);
		logger.info("스팸 메세지 목록 조회, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("flag", "temporary");
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/mailbox/ajaxMailbox";
	}
	
	@RequestMapping("/mailbox")
	public String mailNoByFlag(HttpSession session, Model model) {
		getMailboxNoModel(session, model);
		
		return "/mailbox/mailbox";
	}
	
	@RequestMapping("/contentWrapper")
	public String contentWrapper(HttpSession session, Model model) {
		getMailboxNoModel(session, model);
		
		return "/mailbox/contentWrapper";
	}
	
	public void getMailboxNoModel(HttpSession session, Model model) {
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
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
		model.addAttribute("memId", memId);
		
	}
	
	@RequestMapping("/mailDetail")
	public String mailDetail(@RequestParam(defaultValue = "0") int msgaddNo, @RequestParam(defaultValue = "0") int msgNo
			,@RequestParam(required = false) String flag, ModelMap model) {
		logger.info("메세지 상세 조회, 매개변수 msgaddNo={}, msgNo={}", msgaddNo, msgNo);
		
		Map<String, Object> map = mailboxService.selectByMsgAddNo(msgaddNo);
		logger.info("메세지 상세 조회 결과, map={}", map);
		
		Timestamp msgaddDate = (Timestamp) map.get("MSGADD_DATE");
		if(msgaddDate == null && flag.equals("received")) {
			int cnt = mailboxService.updateMsgaddDate(msgaddNo);
			map = mailboxService.selectByMsgAddNo(msgaddNo);
			logger.info("메세지 읽은 날짜 업데이트 결과, cnt={}, map={}", cnt, map);
		}
		
		List<MailboxAtcVO> list = mailboxService.selectMsgAtcByMsgNo(msgNo);
		logger.info("메세지 첨부파일 조회 결과, list.size={}", list.size());
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		
		return "/mailbox/ajaxReadMail";
	}
	
	@RequestMapping("/selectTemporaryMail")
	public String selectTemporaryMail(@RequestParam(defaultValue = "0") int msgaddNo
			, @RequestParam(defaultValue = "0") int msgNo, Model model) {
		logger.info("임시저장 메세지 상세보기, 파라미터 msgaddNo={}, msgNo={}", msgaddNo, msgNo);
		
		Map<String, Object> map = mailboxService.selectByMsgAddNo(msgaddNo);
		List<MailboxAtcVO> list = mailboxService.selectMsgAtcByMsgNo(msgNo);
		
		model.addAttribute("map", map);
		model.addAttribute("list", list);
		model.addAttribute("flag", "temporary");
		
		return "/mailbox/ajaxCompose";
	}
	
	@RequestMapping("/updatDetailTrashFlag")
	public String mailDetailDelete(@RequestParam String msgaddNo, @RequestParam String trashFlag) {
		Map<String, String> map = new HashMap<>();
		map.put("msgaddNo", msgaddNo);
		map.put("trashFlag", trashFlag);
		
		int cnt=mailboxService.updateTrashFlag(map);
		logger.info("삭제 플래그 업데이트 결과, cnt={}", cnt);
		
		return "redirect:/mailbox/contentWrapper";
	}
	
	
	@RequestMapping("/starFlagUpdate")
	@ResponseBody
	public int starFlagUpdate(HttpSession session, @RequestParam boolean emptyFlag, @RequestParam String msgaddNo) {
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
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
			, @RequestParam(defaultValue = "0") int msgNo
			, @RequestParam String msgaddAdsee) {
		logger.info("임시저장 메세지 삭제 파라미터, msgaddNo={}, msgNo={}", msgaddNo, msgNo);
		logger.info("msgaddAdsee={}", msgaddAdsee);
		
		int cnt=mailboxService.delTemporaryMail(msgaddNo);
		logger.info("임시저장 메세지 삭제 결과, cnt={}", cnt);
		
		redirect.addFlashAttribute("mailboxVo", mailboxVo);
		redirect.addFlashAttribute("msgaddAdsee", msgaddAdsee);
		
		return "redirect:/mailbox/sendMail";
	}
	
	@RequestMapping("/updateMailboxNo")
	@ResponseBody
	public Map<String, Integer> updateMailboxNo(HttpSession session){
		Map<String, Integer> map =getMailboxNoMap(session);
		return map;
	}
	
	public Map<String, Integer> getMailboxNoMap(HttpSession session){
		String memId="";
		
		String isLogin = (String) session.getAttribute("isLogin");
		if(isLogin.equals("member")) {
			memId = (String) session.getAttribute("memId");
		}else {
			memId = (String) session.getAttribute("comId");
		}
		logger.info("memId={}", memId);
		
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
	
	@RequestMapping("/replyMail")
	public String replyMail(@RequestParam(defaultValue = "0") int msgaddNo, ModelMap model){
		Map<String, Object> map = mailboxService.selectByMsgAddNo(msgaddNo);
		
		model.addAttribute("map", map);
		model.addAttribute("flag", "reply");
		
		return "/mailbox/ajaxCompose";
	}
	
	@RequestMapping("/shareMail")
	public String shareMail(@RequestParam(defaultValue = "0") int msgaddNo, ModelMap model){
		Map<String, Object> map = mailboxService.selectByMsgAddNo(msgaddNo);
		
		model.addAttribute("map", map);
		model.addAttribute("flag", "share");
		
		return "/mailbox/ajaxCompose";
	}
}
