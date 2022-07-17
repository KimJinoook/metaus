package com.metaus.commission.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.metaus.commission.model.MypageService;
import com.metaus.commission.model.MypageVO;
import com.metaus.common.ConstUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;
import com.metaus.request.model.RequestService;
import com.metaus.request.model.RequestVO;
import com.metaus.request.model.ScrapVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/commission")
@RequiredArgsConstructor
public class CommissionController {
	private static final Logger logger
	=LoggerFactory.getLogger(CommissionController.class);
	
	private final MypageService mypageService;
	private final MemberService memberService;
	private final RequestService requestService;
	
	@RequestMapping("/progressSchedule")
	public String progressSchedule(@ModelAttribute MypageVO searchVo,HttpSession session,Model model) {
		logger.info("의뢰 완료 목록 페이지");

		int memNo = (int)session.getAttribute("memNo");
		logger.info("memNo={}",memNo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setMemNo(memNo);
		
		List<MypageVO> list=mypageService.completion1(searchVo);
		logger.info("list={}",list);
		int totalRecord = mypageService.getTotalRecord1(memNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info(" totalRecord={}", totalRecord);
		logger.info("목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		
		return "/commission/progressSchedule";
	}
	
	@RequestMapping("/commissionList")
	public String commissionList(@ModelAttribute MypageVO searchVo,HttpSession session,Model model) {
		logger.info("의뢰 목록 페이지");

		int memNo = (int)session.getAttribute("memNo");
		logger.info("memNo={}",memNo);
		
		
		
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setMemNo(memNo);
		
		List<MypageVO> list=mypageService.selectAll(searchVo);
		logger.info("list={}",list);
		int totalRecord = mypageService.getTotalRecord(memNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		
		return "/commission/commissionList";
	}
	
	@RequestMapping("/Progress")
	public String Progress(@ModelAttribute MypageVO searchVo,HttpSession session,Model model) {
		logger.info("의뢰 진행 페이지");

		int memNo = (int)session.getAttribute("memNo");
		logger.info("memNo={}",memNo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);		
		searchVo.setMemNo(memNo);

		List<MypageVO> list=mypageService.completion(searchVo);
		
		logger.info("list={}",list);
		logger.info("list.size={}",list.size());
		int totalRecord = mypageService.getTotalRecord1(memNo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info(" totalRecord={}", totalRecord);
		logger.info("목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		
		return "/commission/Progress";
	}
	
	/*박정환*/
	@RequestMapping("/interestList")
	public String AttentionList(HttpSession session, Model model) {
		logger.info("관심 의뢰 페이지");
		
		String memId=(String)session.getAttribute("memId");
		logger.info("memId={}", memId);
		
		MemberVO mvo= memberService.selectByUserid(memId);
		
		List<ScrapVO> scList=requestService.selectScrapBymemNo(mvo.getMemNo());
		List<RequestVO> reList=requestService.selectRequestAll();
		
		model.addAttribute("scList", scList);
		model.addAttribute("reList", reList);
		
		return "/commission/interestList";
		
	}
}
