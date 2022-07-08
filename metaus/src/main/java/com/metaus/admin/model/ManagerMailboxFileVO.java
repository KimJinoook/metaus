package com.metaus.admin.model;

import lombok.Data;

@Data
public class ManagerMailboxFileVO {
	private String fileName;
	private long fileSize;
	private String originalFileName;
}
