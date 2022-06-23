package com.metaus.mailbox.model;

import lombok.Data;

@Data
public class MailboxFileVO {
	private String fileName;
	private long fileSize;
	private String originalFileName;
}
