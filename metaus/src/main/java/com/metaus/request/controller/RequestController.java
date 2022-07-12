package com.metaus.request.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.metaus.board.model.BoardAtcVO;
import com.metaus.board.model.BoardVO;
import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;
import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;
import com.metaus.member.model.MemberVO;
import com.metaus.request.model.RequestAtcVO;
import com.metaus.request.model.RequestDAO;
import com.metaus.request.model.RequestService;
import com.metaus.request.model.RequestVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/request")
@RequiredArgsConstructor
public class RequestController {
	private static final Logger logger
	=LoggerFactory.getLogger(RequestController.class);
	
	private final RequestService requestService;
	private final CompanyService companyService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/detail")
	public String pagere(HttpSession session, @RequestParam(defaultValue = "0") int recNo, Model model) {
		logger.info("의뢰 글 페이지");
		
		RequestVO vo=requestService.selectRequestDetail(recNo);
		List<CompanyVO> comlist= companyService.selectAll();
		List<RequestAtcVO> ratcList = requestService.selectRequestAtc();
		String comId=(String)session.getAttribute("comId");
		
		/* RequestAtcVO atcvo=requestService.selectByrecfileNo(); */
		
		model.addAttribute("vo", vo);
		model.addAttribute("comlist", comlist);
		model.addAttribute("comId", comId);
		model.addAttribute("ratcList",ratcList);
		return "/request/detail";
	}
	
	@GetMapping("/post")
	public String postRequest(HttpSession session, Model model) {
		logger.info("의뢰 작성 페이지");
		
		String comId=(String)session.getAttribute("comId");
		logger.info("커뮤니티 글 작성 페이지, 파라미터 comId={}",comId);
		
		model.addAttribute("comId",comId);
		
		return "request/post";
		
		
	}
	
	@PostMapping("/post")
	public String postre(@RequestParam String comId, @ModelAttribute RequestVO requestVo, 
			@ModelAttribute RequestAtcVO recAtcVo, HttpServletRequest request, Model model) {
		logger.info("의뢰 작성 페이지");
		
		CompanyVO comVo=companyService.selectByUserid(comId);
		logger.info("커뮤니티 글 작성 페이지, 파라미터 comId={}, requestVo={}, recAtcVo={}",comId, requestVo, recAtcVo);
		requestVo.setComNo(comVo.getComNo());
		
		String fileName = "", originFileName = "";
		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileUpload(request, 
					ConstUtil.UPLOAD_RECRUIT_FLAG);

			for(Map<String, Object> fileMap : fileList) {
				//다중 파일 업로드 처리 해야 함!

				originFileName=(String) fileMap.get("originalFileName");
				fileName=(String) fileMap.get("fileName");	
			}//for

			logger.info("파일 업로드 성공, fileName={}", fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 int cnt = requestService.insertRequest(requestVo);
		
		recAtcVo.setRecfileFilename(fileName);
		recAtcVo.setRecfileOriginname(originFileName);
		recAtcVo.setRecNo(requestVo.getRecNo());
		
		int cnt2 = requestService.insertRequest(requestVo);
		int upload=requestService.insertRequestAtc(recAtcVo);
		return "redirect:/request/search";
	}
	
	  @RequestMapping("/search") 
	  public String requestList(@ModelAttribute SearchVO searchVo, Model model, HttpSession session) { 
		 logger.info("의뢰 검색 페이지");
		 
		 String comId = (String)session.getAttribute("comId");
		 logger.info("페이지, searchVo={}", searchVo);
		 
		 PaginationInfo pagingInfo = new PaginationInfo();
		 pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		 pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		 pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		 logger.info("t ={}",pagingInfo.getCurrentPage());
		  
		 searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		 logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		 logger.info("t3={}",searchVo.getFirstRecordIndex());
		 
		 searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		  
		 //List<Map<String, Object>> list = requestService.selectAll(searchVo);
		 List<RequestVO> reclist = requestService.selectRequest(searchVo);
		 List<CompanyVO> comlist = requestService.selectCom();
		 logger.info("글 목록 조회 결과, list.size={}", reclist.size()); 
		 List<RequestAtcVO> ratcList = requestService.selectRequestAtc();
		 int totalRecord=requestService.selectTotalRecord(searchVo);
		  
		 pagingInfo.setTotalRecord(totalRecord);
		 
		 logger.info("의뢰 글 목록 레코드 개수, totalRecord={}", totalRecord);
		 logger.info("의뢰 글 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		 logger.info("의뢰 글 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		  
		 model.addAttribute("pagingInfo", pagingInfo);
		 model.addAttribute("reclist",reclist);
		 model.addAttribute("ratcList",ratcList);
		 model.addAttribute("comId", comId);
		 model.addAttribute("comlist",comlist);
		 model.addAttribute("totalRecord", totalRecord);
		  
		 return "/request/search"; 
		  
	  }
	  
	  @RequestMapping("/requestDelete")
		public String requestDelete(@RequestParam int recNo) {
			logger.info("의뢰 글 삭제");

			int cnt = requestService.requestDelete(recNo);
			logger.info("의뢰 삭제, 결과 cnt={}",cnt);
			
			return "redirect:/request/search";
		}

	  @GetMapping("/update")
		public String boardUpdate_get(@RequestParam int recNo,
				@RequestParam int recfileNo, Model model) {
			logger.info("글 수정 페이지, 파라미터", recNo, recfileNo);

			RequestVO vo = requestService.selectByRequestNo(recNo);
			RequestAtcVO AtcVo = requestService.selectByrecfileNo(recfileNo);

			model.addAttribute("vo", vo);
			model.addAttribute("AtcVo", AtcVo);

			return "/request/Update";
		}
	  
	  @PostMapping("/update")
		public String boardUpdate_post(@ModelAttribute RequestVO requestVo,
				HttpSession session,
				HttpServletRequest request,
				@ModelAttribute RequestAtcVO requestAtcVo,
				Model model) {

			int requestResult = requestService.updateRequest(requestVo);
			logger.info("글 내용 수정 결과,requestResult={}", requestResult);


			String fileName = "", originFileName = "";

			try {
				List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_RECRUIT_FLAG);

				for (Map<String, Object> fileMap : fileList) {
					originFileName = (String) fileMap.get("originalFileName");
					fileName = (String) fileMap.get("fileName");
				}
				logger.info("파일 업로드 성공, fileName={}", fileName);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			requestAtcVo.setRecfileFilename(fileName);
			requestAtcVo.setRecfileOriginname(originFileName);
			requestAtcVo.setRecNo(requestVo.getRecNo());

			int RequestAtcResult = requestService.updateRequestAtc(requestAtcVo);
			logger.info("의뢰 글 파일 수정 결과, RequestAtcResult={}", RequestAtcResult);

			CompanyVO comVo = companyService.selectByComNo(requestVo.getComNo());

			model.addAttribute("comVo", comVo);

			model.addAttribute("requestVo", requestVo);
			model.addAttribute("requestAtcVo", requestAtcVo);

			model.addAttribute("recNo", requestVo.getRecNo());

			
			return "redirect:/request/search";
		}

}
