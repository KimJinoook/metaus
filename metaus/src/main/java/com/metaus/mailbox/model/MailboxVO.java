package com.metaus.mailbox.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MailboxVO {
	private int msgNo;
	private String msgSender;
	private String msgRecipient;
	private String msgTitle;
	private String msgContent;
	private String msgtypeNo;
	private Timestamp sendDate;
	
}
