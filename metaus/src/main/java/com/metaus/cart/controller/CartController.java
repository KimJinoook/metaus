package com.metaus.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.cart.model.CartService;
import com.metaus.cart.model.CartVO;
import com.metaus.pd.model.PdVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {
	private static final Logger logger
	=LoggerFactory.getLogger(CartController.class);
	
	private final CartService cartService;
	
	@RequestMapping("/cartAdd")
	public String cartAdd(HttpServletRequest request, @RequestParam int pdNo, @ModelAttribute CartVO cartVo, HttpSession session, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		cartVo.setMemNo(memNo);
		cartVo.setPdNo(pdNo);
		logger.info("장바구니 담기 파라미터 cartVo={}, memNo={}",cartVo, memNo, pdNo);
		int cnt=cartService.insertCart(cartVo);
		if(cnt==0) {
			String msg="이미 장바구니에 담긴 상품입니다.";			
			String url=request.getHeader("Referer");
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "/common/message";
		}
		logger.info("장바구니 담기 결과 cnt={}",cnt);
		
		cnt=cartService.selectBuyCount(memNo, pdNo);
		if(cnt>0) {
			String msg="이미 구매하신 상품입니다. 다운로드 페이지로 이동합니다.";
			cnt=cartService.deleteCartByMemNo(memNo,pdNo);
			String url="/pd/myPdList";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "/common/message";
		}
		List<CartVO> list=cartService.selectCartList(memNo);
		logger.info("장바구니 목록, 결과 list.size={}", list.size());
		
		return "redirect:/cart/cart";
	}
	
	@RequestMapping("/cart")
	public String cartList(HttpSession session, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("장바구니 목록 조회 파라미터 memNo={}",memNo);
		
		List<CartVO> list=cartService.selectCartList(memNo);
		logger.info("장바구니 목록, 결과 list.size={}", list.size());
		
		
		model.addAttribute("list", list);
		return "/cart/cart";
	}
	
	@RequestMapping("/checkOut")
	public String checkOut(HttpSession session, CartVO vo, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("결제화면 조회 파라미터 memno={}",memNo);
		
		List<CartVO> list=cartService.selectCartList(memNo);
		logger.info("장바구니 목록, 결과 list.size={}", list.size());
		
		model.addAttribute("list",list);
		
		return "/cart/checkOut";
	}
	
	@RequestMapping("/delete")
	public String cartDel(HttpSession session, @RequestParam int pdNo, Model model) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("장바구니 목록 삭제 파라미터 memNo={}",memNo);
		
		int cnt=cartService.deleteCartByMemNo(memNo, pdNo);
		logger.info("장바구니 목록 삭제 결과 cnt={}",cnt);
		
		String msg="삭제 실패했습니다.", url="/cart/cart";
		if(cnt>0) {
			msg="삭제되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "/common/message";
	}
	
}
