package com.metaus.admin.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.metaus.admin.model.ManagerPdSearchVO;
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
		
		List<ManagerPdVO> list;
		
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
		
		
		int maxP = managerPdService.selectMaxPrice();
		model.addAttribute("maxP",maxP);
	}
	
	@RequestMapping("/pdSearch")
	public String pdSearch(@ModelAttribute ManagerPdSearchVO mpsVo, Model model) {
		
		System.out.println(mpsVo.getPriceMin());
		System.out.println(mpsVo.getPriceMax());
		
		
		if(mpsVo.getPriceMax() < mpsVo.getPriceMin()) {
			int temp = mpsVo.getPriceMax();
			mpsVo.setPriceMax(mpsVo.getPriceMin());
			mpsVo.setPriceMin(temp);
		}
		
		List<ManagerPdVO> list = managerPdService.selectSearch(mpsVo);
		logger.info("list={}",list);
		model.addAttribute("list",list);
		
		List<ManagerPdVO> cateList = managerPdService.selectCateAll();
		model.addAttribute("cateList",cateList);
		
		return "/admin/pd/pdList";
	}
	@RequestMapping("/ajaxpdSearch")
	public String ajaxpdSearch(@ModelAttribute ManagerPdSearchVO mpsVo, Model model) {
		
		System.out.println(mpsVo.getPriceMin());
		System.out.println(mpsVo.getPriceMax());
		
		if(mpsVo.getPriceMax() < mpsVo.getPriceMin()) {
			int temp = mpsVo.getPriceMax();
			mpsVo.setPriceMax(mpsVo.getPriceMin());
			mpsVo.setPriceMin(temp);
		}
		
		List<ManagerPdVO> list = managerPdService.selectSearch(mpsVo);
		logger.info("list={}",list);
		model.addAttribute("list",list);
		
		List<ManagerPdVO> cateList = managerPdService.selectCateAll();
		model.addAttribute("cateList",cateList);
		
		return "/admin/pd/ajaxPdList";
	}
	
	
	@RequestMapping("/pdDetail")
	public void pdDetail(@RequestParam(defaultValue = "0") int pdNo, Model model) {
		ManagerPdVO pdVo = managerPdService.selectPdByPdNo(pdNo);
		
		model.addAttribute("pdVo",pdVo);
		
		
		
		Calendar today = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		SimpleDateFormat sdfy = new SimpleDateFormat("yyyy");
		Date dyear = today.getTime();
		String syear = sdfy.format(dyear);
		pdVo.setBuyYear(syear);
		
		ArrayList<String> monthForSell = new ArrayList<String>();
		ArrayList<String> sellForMonth = new ArrayList<String>();
		
		
		for(int i=0; i<12; i++) {
			Date dateToday = today.getTime();
			String month = sdf.format(dateToday);
			pdVo.setBuyMonth(month);
			
			int sellCnt = managerPdService.selectBuyCntByMonth(pdVo);
			logger.info("pdvo={}, sellcnt={}",pdVo,sellCnt);
			int sellSum = sellCnt * pdVo.getPdPrice();
			String ssellSum = Integer.toString(sellSum);
			
			sellForMonth.add(ssellSum);
			
			switch(month) {
            case "01" : month="Jan"; break;
            case "02" : month="Feb"; break;
            case "03" : month="Mar"; break;
            case "04" : month="Apr"; break;
            case "05" : month="May"; break;
            case "06" : month="Jun"; break;
            case "07" : month="Jul"; break;
            case "08" : month="Aug"; break;
            case "09" : month="Sep"; break;
            case "10" : month="Oct"; break;
            case "11" : month="Nov"; break;
            case "12" : month="Dec"; break;
            }
			monthForSell.add(month);
			System.out.println(month);
			today.add(Calendar.MONTH, -1);
			
		}
		model.addAttribute("monthForSell",monthForSell);
		model.addAttribute("sellForMonth",sellForMonth);
		
	}
}
