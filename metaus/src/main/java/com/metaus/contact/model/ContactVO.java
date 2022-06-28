package com.metaus.contact.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ContactVO {
	private int recNo;
	private int memNo;
	private int conPay;
	private Timestamp conDonedate;
	private int comNo;
	private String recTitle;
	private String recContent;
	private int recPay;
	private Timestamp recRegdate;
	private int recReadcount;
	private String comId;
	private String comPw;
	private String comName;
	private String comPreview;
	private String comPic;
	private String comCeo;
	private String comAdd;
	private String comLati; /* 주소 위도 */
	private String comLongi; /* 주소 경도 */
	private String comRrn; /* 사업자 등록번호 */
	private int comReccnt; /* 의뢰 수 */
	private String comTel; /* 전화번호 */
	private Timestamp comJoindate; /* 가입일 */
	private Timestamp comOutdate; /* 탈퇴일 */
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
	private String memNaver;
	private String memFacebook;
	private int memItem;
	private int memComplete;
}
