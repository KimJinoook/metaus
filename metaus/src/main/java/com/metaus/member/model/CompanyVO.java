package com.metaus.member.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CompanyVO {
	private int comNo;
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
}
