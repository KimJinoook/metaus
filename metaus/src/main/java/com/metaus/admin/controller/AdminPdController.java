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
	public void pdList(@RequestParam(defaultValue = "0") int cateNo, Model model) {
		logger.info("모델링 상품 조회 페이지 cateNo={}",cateNo);
		
		List<ManagerPdVO> list;;
		
		if(cateNo == 0) {
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
	
	
	@RequestMapping("/pdDetail")
	public void pdDetail(@RequestParam(defaultValue = "0") int pdNo, Model model) {
		
	}
}
