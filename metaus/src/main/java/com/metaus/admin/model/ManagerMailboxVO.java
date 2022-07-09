package com.metaus.admin.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ManagerMailboxVO {
	private int msgNo;
	private String msgTitle;
	private String msgaddAdser;
	private String msgContent;
	private String msgtypeNo;
	private Timestamp sendDate;
	
	int msgaddNo;
	String msgaddAdsee;
	Timestamp msgaddDate;
	private String starFlag;
	private String temporaryFlag;
	private String spamFlag;
	private String trashFlag;
	
	private String managerName;
	private String managerPic;
	
}
