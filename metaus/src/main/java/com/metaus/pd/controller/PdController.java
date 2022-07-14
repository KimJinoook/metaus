package com.metaus.pd.controller;

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

import com.metaus.category.model.CategoryService;
import com.metaus.category.model.CategoryVO;
import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.pd.model.PdService;
import com.metaus.pd.model.PdVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/pd")
@RequiredArgsConstructor
public class PdController {
	private static final Logger logger
	=LoggerFactory.getLogger(PdController.class);
	
	private final PdService pdService;
	private final FileUploadUtil fileUploadUtil;
	private final CategoryService cateService;
	
	@RequestMapping("/pd")
	public String pd(@ModelAttribute PdVO searchVo, Model model) {
		logger.info("pd 목록 페이지, 파라미터 searchVo={}",searchVo);
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		List<PdVO> list=pdService.selectAll(searchVo);
		logger.info("상품 목록 조회 결과, list.size={}", list.size());

		int totalRecord=pdService.selectTotalRecord(searchVo);
		logger.info("상품 목록 조회-레코드개수, totalRecord={}", totalRecord);		
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		return "/pd/pd";
	}
	
	@RequestMapping("/pdDetail")
	public void pd_Detail(@RequestParam int pdNo, Model model) {
		logger.info("상품 상세보기 화면, 파라미터 pdNo={}",pdNo);
		
		PdVO vo=pdService.selectPdByNo(pdNo);		
		logger.info("상품 상세보기 vo={}",vo);
		
		model.addAttribute("vo", vo);
	}
	
	@GetMapping("/pdPost")
	public void pd_get(HttpSession session,Model model) {
		logger.info("pd 등록 페이지");
		List<CategoryVO> list=cateService.selectCategory();
		logger.info("pd 등록 카테고리 조회 결과 list.size={}",list.size());
		
		model.addAttribute("list",list);
	}
	
	@PostMapping("/pdPost")
	public String pd_Post(@ModelAttribute PdVO vo, HttpSession session,
			HttpServletRequest request, Model model) {
		
		int memNo=(int)session.getAttribute("memNo");
		logger.info("pd 등록처리, 파라미터 memNo={}",memNo);
		
		logger.info("pd 등록처리, 파라미터 vo={}",vo);
		String fileName="";

		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_PRODUCT_FLAG);

			for(Map<String, Object> fileMap : fileList) { 
				fileName=(String) fileMap.get("fileName");
				logger.info("pd 등록처리, fileName={}",fileName);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		vo.setPdFilename(fileName);
		vo.setMemNo(memNo);
		
		int cnt=pdService.insertPd(vo);
		logger.info("상품 등록 처리 결과, cnt={}",cnt);

		return "redirect:/pd/pdDetail?pdNo="+vo.getPdNo();
	}
	
	@RequestMapping("/pdByCategory")
	public void pdByCategory(@ModelAttribute PdVO searchVo, @RequestParam String cateName,
			@RequestParam int cateNo, Model model) {
		logger.info("pd 목록 페이지, 파라미터 searchVo={}",searchVo);
		
		logger.info("카테고리 상품 화면, 파라미터 categoryName={}, categoryNo={}"
				,cateName, cateNo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);

		List<PdVO> list=pdService.selectByCategory(searchVo);
		logger.info("상품 목록 조회 결과, list.size={}", list.size());

		int totalRecord=pdService.selectTotalRecord(searchVo);
		logger.info("상품 목록 조회-레코드개수, totalRecord={}", totalRecord);		
		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
	}
	
	@RequestMapping("/best3")
	public String best(@RequestParam int pdNo ,Model model) {
		
		List<PdVO> list=pdService.selectByBuyCnt(pdNo);
		logger.info("카테고리별 판매가 가장 많은 상품 조회, 결과 list.size={}",
				list.size());
		
		model.addAttribute("list", list);
		
		return "/pd/best3";
	}
	
	@RequestMapping("/myPdList")
	public String myPdList() {
		logger.info("구매한 상품 조회 페이지");
		
		return "/pd/myPdList";
	}
}