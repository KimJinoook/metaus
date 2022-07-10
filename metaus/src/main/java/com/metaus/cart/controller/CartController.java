package com.metaus.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.cart.model.CartService;
import com.metaus.cart.model.CartVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {
	private static final Logger logger
	=LoggerFactory.getLogger(CartController.class);
	
	private final CartService cartService;
	
	@RequestMapping("/cartAdd")
	public String cartAdd(@ModelAttribute CartVO cartVo, HttpSession session) {
		int memNo=(int)session.getAttribute("memNo");
		cartVo.setMemNo(memNo);
		logger.info("장바구니 담기 파라미터 cartVo={}, memNo={}",cartVo, memNo);
		
		int cnt=cartService.insertCart(cartVo);
		logger.info("장바구니 담기 결과 cnt={}",cnt);
		
		return "/cart/cart";
	}
	
	@RequestMapping("/cart")
	public String cartList(HttpSession session, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("장바구니 목록 조회 파라미터 memNo={}",memNo);
		
		List<Map<String, Object>>list=cartService.selectCartList(memNo);
		logger.info("장바구니 목록, 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/cart/cart";
	}
	
	@RequestMapping("/checkOut")
	public String checkOut() {
		return "/cart/checkOut";
	}
}
