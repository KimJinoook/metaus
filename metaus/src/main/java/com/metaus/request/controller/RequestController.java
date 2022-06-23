package com.metaus.request.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.metaus.common.ConstUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;
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
	
	@RequestMapping("/search")
	public String searchre() {
		logger.info("의뢰 검색 게시판");
		return "/request/search";
	}
	
	@RequestMapping("/detail")
	public String pagere() {
		logger.info("의뢰 글 페이지");
		return "/request/detail";
	}
	
	@RequestMapping("/post")
	public String postre() {
		logger.info("의뢰 작성 페이지");
		return "/request/post";
	}
	
	@PostMapping("/insertRequest")
	public String insertRequest(@ModelAttribute RequestVO vo) {
		logger.info("의뢰 글 등록 처리, 파리미터 vo={}", vo);
		
		int cnt=requestService.insertRequest(vo);
		logger.info("글 등록 결과 cnt={}", cnt);
		
		return "redirect:/request/search";
		
	}
	
	@PostMapping("/list")
	public String requestList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("의뢰 검색 페이지");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		List<RequestVO> list = requestService.selectAll(searchVo);
		logger.info("글 목록 조회 결과, list.size={}", list.size());
		
		int totalRecord=requestService.getTotalRecord(searchVo);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/request/search";
	}
}
