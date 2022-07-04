package com.metaus.mailbox.model;

import lombok.Data;

@Data
public class MailboxAtcVO {
	private int mfileNo;
	private int msgNo;
	private String mfileFilename;
	private String mfileOriginname;
	private long mfileFilesize;
}
