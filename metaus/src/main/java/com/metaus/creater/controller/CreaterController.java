package com.metaus.creater.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.commission.model.CommissionService;
import com.metaus.common.ConstUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;
import com.metaus.contact.model.ContactService;
import com.metaus.contact.model.ContactVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;
import com.metaus.resume.model.PortfolioVO;
import com.metaus.resume.model.ResumeService;
import com.metaus.resume.model.ResumeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/creater")
@RequiredArgsConstructor
public class CreaterController {
	
	private static final Logger logger = LoggerFactory.getLogger(CreaterController.class);

	private final MemberService memberService;
	private final ResumeService resumeService;
	private final ContactService contactService;
	private final CommissionService commissionService;
	
	/*@RequestMapping("/createrList")
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
	}*/
	
	@RequestMapping("/createrList")
	public void createrList(@RequestParam(defaultValue = "0") int recNo, @ModelAttribute SearchVO searchVo,Model model) {
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
		
		int totalRecord=0;
		List<MemberVO> list=null;
		if(recNo < 1) {
			//전체조회
			list =  memberService.selectAllCreater(searchVo);
			logger.info("크리에이터 찾기 list={}",list);
			
			totalRecord = memberService.getTotalRecord(searchVo);
			
		}else { //기업의뢰 지원자 현황
			String searchKeyword = searchVo.getSearchKeyword();
			int firstRecordIndex = searchVo.getFirstRecordIndex();
			int recordCountPerPage = searchVo.getRecordCountPerPage();
			Map<String, Object> map = new HashMap<>();
			map.put("searchKeyword", searchKeyword);
			map.put("recNo", recNo);
			map.put("firstRecordIndex", firstRecordIndex);
			map.put("recordCountPerPage", recordCountPerPage);
			
			list = memberService.selectCreaterByRecNo(map);
			logger.info("기업의뢰 지원자 현황, list.size={}", list.size());
			
			totalRecord = memberService.getTotalRecordByrecNo(map);
		}
		
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("크리에이터 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("크리에이터 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("크리에이터 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("recNo", recNo);
	}
	
	@RequestMapping("/createrDetail")
	public void createrDetail(@RequestParam int memNo, Model model) {
		logger.info("크리에이터 디테일 뷰 memNo={}",memNo);
		
		MemberVO memVo = memberService.selectByMemNo(memNo);
		logger.info("크리에이터 디테일 뷰 memvo={}",memVo);
		
		ResumeVO resumeVo = resumeService.selectBymemNo(memNo); 
		logger.info("크리에이터 디테일 뷰 resumevo={}",resumeVo);
		
		List<PortfolioVO> portfolioList = memberService.selectPortByMenNo(memNo);
		logger.info("크리에이터 디테일 뷰 portfolioList={}",portfolioList);
		
		List<ContactVO> contactList = contactService.selectContactByMemNo(memNo);
		logger.info("크리에이터 디테일 뷰 contactList={}",contactList);
		
		
		model.addAttribute("memVo",memVo);
		model.addAttribute("resumeVo", resumeVo);
		model.addAttribute("portfolioList", portfolioList);
		model.addAttribute("contactList",contactList);
		
	}
	@RequestMapping("/createrDetail2")
	public void createrDetail2() {
		
	}
	
}
