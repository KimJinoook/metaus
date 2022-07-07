package com.metaus.admin.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.admin.model.ManagerBoardService;
import com.metaus.admin.model.ManagerBoardVO;
import com.metaus.admin.model.ManagerPdService;
import com.metaus.admin.model.ManagerPdVO;
import com.metaus.admin.model.ManagerService;
import com.metaus.member.model.CompanyService;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/pd")
@RequiredArgsConstructor
public class AdminPdController {

	private static final Logger logger
	=LoggerFactory.getLogger(AdminPdController.class);
	
	private final ManagerService managerService;
	private final MemberService memberService;
	private final CompanyService comService;
	private final ManagerBoardService managerBoardService;
	private final ManagerPdService managerPdService;
	
	@RequestMapping("/pdList")
	public void memberBoardList(@RequestParam(defaultValue = "0") int cateNo, Model model) {
		logger.info("모델링 상품 조회 페이지 cateNo={}",cateNo);
		
		List<ManagerPdVO> list;;
		
		if(cateNo == 1) {
			list = managerPdService.selectPdAll();
		}else {
			
			list=managerPdService.selectPdByCateNo(cateNo);
		}
		
		logger.info("list={}",list);
		model.addAttribute("list",list);
		
		ManagerPdVO cate = managerPdService.selectCateByCateNo(cateNo);
		List<ManagerPdVO> cateList = managerPdService.selectCateAll();
		model.addAttribute("cate",cate);
		model.addAttribute("cateList",cateList);
	}
	
	
	@RequestMapping("/memberBoardDelete")
	public String memberBoardDelete(@RequestParam(defaultValue = "0") int boardNo, @RequestParam(defaultValue = "8") int btypeNo) {
		logger.info("일반 회원 게시글 삭제 boardNo={}",boardNo);
		
		int cnt = managerBoardService.deleteBoard(boardNo);
		logger.info("삭제결과 cnt={}",cnt);
		
		
		if(btypeNo==8) {
			return "redirect:/admin/board/memberBoardList?btypeNo=8";
		}else if(btypeNo==5) {
			return "redirect:/admin/board/memberBoardList?btypeNo=5";
		}else if(btypeNo==6) {
			return "redirect:/admin/board/memberBoardList?btypeNo=6";
		}else if(btypeNo==3) {
			return "redirect:/admin/board/memberBoardList?btypeNo=3";
		}else if(btypeNo==1) {
			return "redirect:/admin/board/managerBoardList?btypeNo=1";
		}else if(btypeNo==2) {
			return "redirect:/admin/board/managerBoardList?btypeNo=2";
		}else {
			return "redirect:/admin/";
		}
	}
	
	@RequestMapping("/managerBoardList")
	public void managerBoardList(@RequestParam(defaultValue = "1") int btypeNo, Model model) {
		logger.info("관리자 게시판 조회 페이지 btypeNo={}",btypeNo);
		
		List<ManagerBoardVO> list=managerBoardService.selectBoardByBtypeNo(btypeNo);
		logger.info("list={}",list);
		model.addAttribute("list",list);
		
		ManagerBoardVO btype = managerBoardService.selectBtypeByBtypeNo(btypeNo);
		model.addAttribute("btype",btype);
	}
	
	@GetMapping("/managerBoardWrite")
	public void managerBoardwrite_get() {
		logger.info("관리자 글 작성 페이지");
	}
	
	@PostMapping("/managerBoardWrite")
	public String managerBoardwrite_post(@ModelAttribute ManagerBoardVO vo) {
		logger.info("관리자 글 작성 포스트 vo={}",vo);
		
		int cnt = managerBoardService.insertBoard(vo);
		logger.info("관리자 글 작성 결과 cnt={}",cnt);
		
		int btypeNo = vo.getBtypeNo();
		return "redirect:/admin/board/managerBoardList?btypeNo="+btypeNo;
	}
	
	@GetMapping("/managerBoardEdit")
	public void managerBoardEdit_get(int boardNo, Model model) {
		logger.info("관리자 글 수정 페이지 boardNo={}",boardNo);
		
		ManagerBoardVO vo = managerBoardService.selectBoardByBoardNo(boardNo);
		model.addAttribute("vo",vo);
	}
	
	@PostMapping("/managerBoardEdit")
	public String managerBoardEdit_post(@ModelAttribute ManagerBoardVO vo) {
		logger.info("관리자 글 수정 포스트 vo={}",vo);
		
		int cnt = managerBoardService.updateBoard(vo);
		logger.info("관리자 글 수정 결과 cnt={}",cnt);
		
		int btypeNo = vo.getBtypeNo();
		return "redirect:/admin/board/managerBoardList?btypeNo="+btypeNo;
	}
	
	@RequestMapping("/reportList")
	public void reportList(Model model) {
		logger.info("신고게시판 조회");
		
		List<ManagerBoardVO> list=managerBoardService.selectReport();
		logger.info("list={}",list);
		model.addAttribute("list",list);
		
	}
	
	@RequestMapping("/reportGood")
	public String reportGood(int boardNo) {
		logger.info("신고게시판 문제없음 처리 boardNo={}",boardNo);
		int cnt = managerBoardService.reportConfirmBoard(boardNo);
		logger.info("신고게시판 문제없음 처리 cnt={}",cnt);
		
		return "redirect:/admin/board/reportList";
	}
	@RequestMapping("/reportBad")
	public String reportBad(int boardNo) {
		logger.info("신고게시판 삭제 처리 boardNo={}",boardNo);
		
		int cnt = managerBoardService.deleteBoard(boardNo);
		logger.info("게시글 삭제처리 cnt={}",cnt);
		
		ManagerBoardVO boardVo = managerBoardService.selectBoardByBoardNo(boardNo);
		logger.info("게시글 정보 boardVo={}",boardVo);
		
		MemberVO memberVo = memberService.selectByMemNo(boardVo.getMemNo());
		logger.info("작성자 정보 memberVo={}",memberVo);
		
		memberVo.setMemWarncnt(memberVo.getMemWarncnt()+1);
		
		cnt = memberService.warnCntUp(memberVo);
		logger.info("사용자 경고수 증가 결과 cnt={}",cnt);
		
		Date date = new Date();
		long cutTime = (long)(memberVo.getMemWarncnt()*24*60*60*1000);		
		Timestamp timestamp = new Timestamp(date.getTime()+cutTime);
		
		
		memberVo.setMemCutdate(timestamp);
		
		cnt = memberService.lockMember(memberVo);
		logger.info("일반회원 차단 cnt={}",cnt);
		
		
		cnt = managerBoardService.reportConfirmBoard(boardNo);
		logger.info("신고게시판 confirm 처리 cnt={}",cnt);
		
		return "redirect:/admin/board/reportList";
	}
}
