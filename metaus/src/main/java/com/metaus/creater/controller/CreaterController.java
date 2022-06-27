package com.metaus.creater.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.common.ConstUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/creater")
@RequiredArgsConstructor
public class CreaterController {
	
	private static final Logger logger = LoggerFactory.getLogger(CreaterController.class);

	private final MemberService memberService;

	
	@RequestMapping("/createrList")
	public void createrList(@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("크리에이터 찾기 뷰");
		
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
		
		List<MemberVO> list =  memberService.selectAllCreater(searchVo);
		logger.info("크리에이터 찾기 list={}",list);
		int totalRecord = memberService.getTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("크리에이터 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("크리에이터 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("크리에이터 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
	}
	
	@RequestMapping("/createrDetail")
	public void createrDetail() {
		
	}
	@RequestMapping("/createrDetail2")
	public void createrDetail2() {
		
	}
	
}
