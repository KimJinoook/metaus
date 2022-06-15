package com.metaus.mailbox.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mailbox")
public class MailboxController {
	
	@RequestMapping("/compose")
	public String compose() {
		return "/mailbox/compose";
	}
	
	@RequestMapping("/mailbox")
	public String mailbox() {
		return "/mailbox/mailbox";
	}
	
	@RequestMapping("/readMail")
	public String readMail() {
		return "/mailbox/readMail";
	}
}
