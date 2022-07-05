package com.metaus.admin.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ManagerVO {
	private int managerNo;
	private String managerId;
	private String managerName;
	private String managerPwd;
	private Timestamp managerRegdate;
	private String managerPic;
	private String managerTel;
}
