package com.metaus.pay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.buy.model.BuyService;
import com.metaus.buy.model.BuyVO;
import com.metaus.cart.model.CartService;
import com.metaus.cart.model.CartVO;
import com.metaus.pay.model.PayService;
import com.metaus.pay.model.PayVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/pay")
@RequiredArgsConstructor
public class PayController {
	private static final Logger logger
	=LoggerFactory.getLogger(PayController.class);
	
	private final PayService payService;
	private final CartService cartService;
	private final BuyService buyService;
	
	@RequestMapping("/pay")
	public String pay(@RequestParam int pdNo, @RequestParam int payPrice,@RequestParam String payKind, HttpSession session, @ModelAttribute PayVO payVo) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("결제 완료 페이지 파라미터 payVo={},memNo={}",payVo,memNo);
		payVo.setMemNo(memNo);
		payVo.setPayPrice(payPrice);
		payVo.setPayKind(payKind);
		int cnt=payService.insertPay(payVo);
		logger.info("결제 완료 파라미터 cnt={}",cnt);
		List<CartVO> list=null;
		BuyVO buyVo= new BuyVO();
		if(cnt>0) {
			list=cartService.selectCartList(memNo);
			for(int i=0;i<list.size();i++) {
				buyVo.setMemNo(memNo);
				buyVo.setPdNo(pdNo);
				int res=buyService.insertBuy(buyVo);
			}
			logger.info("결제 완료 파라미터 buyVo={}, list.size={}",buyVo,list.size());		
			cnt=cartService.deleteCartAllByMemNo(memNo);
		}
					
		return "redirect:/pd/myPdList";
	}
}
