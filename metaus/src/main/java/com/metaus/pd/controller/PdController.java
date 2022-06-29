package com.metaus.pd.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
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
	
	@RequestMapping("/pd")
	public String pd() {
		logger.info("pd 페이지");
		
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
	public String pd_get() {
		logger.info("pd Post 페이지");		
		
		return "/pd/pdPost";
	}
	
	@PostMapping("/pdPost")
	public String pd_Post(@ModelAttribute PdVO vo, HttpServletRequest request, Model model) {
		logger.info("pd Post 등록처리, 파라미터 vo={}",vo);
		String fileName="";

		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_IMAGE_FLAG);

			for(Map<String, Object> fileMap : fileList) { 
				fileName=(String) fileMap.get("fileName");
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		vo.setPdFilename(fileName);

		int cnt=pdService.insertPd(vo);
		logger.info("상품 등록 처리 결과, cnt={}",cnt);

		return "redirect:/pd/pd";
	}
	
	@RequestMapping("/pdByCategory")
	public void pdByCategory(@RequestParam String cateName,
			@RequestParam int cateNo, Model model) {
		logger.info("카테고리 상품 화면, 파라미터 categoryName={}, categoryNo={}"
				,cateName, cateNo);

		List<PdVO> list=pdService.selectByCategory(cateNo);

		model.addAttribute("list", list);

	}
}