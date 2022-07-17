package com.metaus.request.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RecpreVO {
	private int RecpreNo;
	private int RecNo;
	private int MemNo;
	private Timestamp RecpreDate;
	private String RecpreContent;
}
