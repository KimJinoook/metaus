package com.metaus.admin.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ManagerPdVO {
	private int pdNo; /* 모델번호 */
	private int cateNo; /* 카테고리번호 */
	private int memNo; /* 회원번호 */
	private String pdName; /* 모델명 */
	private String pdPre; /* 모델소개 */
	private String pdFilename; /* 모델파일명 */
	private String pdOriginname; /* 모델원본파일명 */
	private int pdFilesize; /* 모델파일사이즈 */
	private int pdBuycnt; /* 구매수 */
	private int pdPrice;
	private Timestamp buyDate;
	
	private String cateName;
	
	private String memId;
	
	private String buyYear;
	private String buyMonth;
}
