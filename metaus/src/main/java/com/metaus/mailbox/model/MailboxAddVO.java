package com.metaus.mailbox.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MailboxAddVO {
	int msgaddNo;
	int msgNo;
	String msgaddAdsee;
	Timestamp msgaddDate;
}