package com.metaus.mailbox.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RecipientVO {
	int msgaddNo;
	int msgNo;
	String msgaddAdsee;
	Timestamp msgaddDate;
	private String starFlag;
	private String temporaryFlag;
	private String spamFlag;
	private String trashFlag;
}
