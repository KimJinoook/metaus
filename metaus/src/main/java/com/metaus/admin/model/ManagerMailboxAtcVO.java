package com.metaus.admin.model;

import lombok.Data;

@Data
public class ManagerMailboxAtcVO {
	private int mfileNo;
	private int msgNo;
	private String mfileFilename;
	private String mfileOriginname;
	private long mfileFilesize;
}
