package com.metaus.request.controller;

import java.util.List;
import java.util.Map;

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

import com.metaus.board.model.BoardVO;
import com.metaus.common.ConstUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;
import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;
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
	
	@RequestMapping("/detail")
	public String pagere(@RequestParam(defaultValue = "0") int recNo, Model model) {
		logger.info("의뢰 글 페이지");
		
		RequestVO vo=requestService.selectRequestDetail(recNo);
		
		model.addAttribute("vo", vo);
		
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
	public String postre(@RequestParam String comId, @ModelAttribute RequestVO requestVo, @ModelAttribute RequestAtcVO recAtcVo, Model model) {
		logger.info("의뢰 작성 페이지");
		
		CompanyVO comVo=companyService.selectByUserid(comId);
		logger.info("커뮤니티 글 작성 페이지, 파라미터 comId={}",comId);
		requestVo.setComNo(comVo.getComNo());
		
		String fileName = "", originFileName = "";
		
		int cnt = requestService.insertRequest(requestVo);
		
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

	
}
