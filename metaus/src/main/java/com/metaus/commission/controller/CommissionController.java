package com.metaus.commission.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commission")
public class CommissionController {
	
	@RequestMapping("/progressSchedule")
	public String progressSchedule() {
		return "/commission/progressSchedule";
	}
	
	@RequestMapping("/commissionList")
	public String commissionList() {
		return "/commission/commissionList";
	}
}
