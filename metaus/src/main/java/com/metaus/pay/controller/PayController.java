package com.metaus.pay.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay")
public class PayController {
	private static final Logger logger
	=LoggerFactory.getLogger(PayController.class);
	
	@RequestMapping("/pay")
	public String pay() {
		
		return "/pay/pay";
	}
}
