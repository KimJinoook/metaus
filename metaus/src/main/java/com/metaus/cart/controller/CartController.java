package com.metaus.cart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartController {
	private static final Logger logger
	=LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping("/cart")
	public String cart() {
		return "/cart/cart";
	}
	
	@RequestMapping("/checkOut")
	public String checkOut() {
		return "/cart/checkOut";
	}
}
