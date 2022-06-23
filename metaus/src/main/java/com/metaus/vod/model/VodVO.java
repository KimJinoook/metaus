package com.metaus.vod.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class VodVO {
	private int classNo; /* 클래스번호 */
	private String className; /* 클래스명 */
	private int classPrice; /* 가격 */
	private Timestamp classRegdate; /* 등록일 */
	private String classPreview; /* 클래스소개 */
	private int memNo; /* 회원번호 */
	private int cateNo; /* 카테고리번호 */
}
