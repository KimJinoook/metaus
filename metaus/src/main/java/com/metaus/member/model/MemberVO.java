package com.metaus.member.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int memNo;
	private String memName;
	private String memId;
	private String memPw;
	private String memNick;
	private String memBirth;
	private String memTel;
	private String memZipcode;
	private String memAdd;
	private String memAdd2;
	private String memPic;
	private Timestamp memJoindate;
	private Timestamp memOutdate;
	private Timestamp memCutdate;
	private int memWarncnt;
	private String memLock;
	private String memKakao;
}
