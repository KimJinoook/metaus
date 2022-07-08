package com.metaus.admin.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ManagerRecipientVO {
	int msgaddNo;
	int msgNo;
	String msgaddAdsee;
	Timestamp msgaddDate;
	private String starFlag;
	private String temporaryFlag;
	private String spamFlag;
	private String trashFlag;
}
