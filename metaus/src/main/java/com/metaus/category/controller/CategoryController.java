package com.metaus.category.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.category.model.CategoryService;
import com.metaus.category.model.CategoryVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pd")
public class CategoryController {
	private static final Logger logger
	=LoggerFactory.getLogger(CategoryController.class);
	
	private final CategoryService categoryService;
	
	@RequestMapping("/categoryList")
	public String cgList(Model model) {
		logger.info("카테고리 조회 페이지");
		
		List<CategoryVO> list=categoryService.selectCategory();
		logger.info("카테고리 조회 결과, list.size={}",list.size());
		
		model.addAttribute("cgList",list);
		
		return "/pd/categoryList";
	}
}
