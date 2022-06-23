package com.metaus.vod.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class VodVO {
	private int class_no; /* 클래스번호 */
	private String class_name; /* 클래스명 */
	private int class_price; /* 가격 */
	private Timestamp class_regdate; /* 등록일 */
	private String class_preview; /* 클래스소개 */
	private int mem_no; /* 회원번호 */
	private int cate_no; /* 카테고리번호 */
}
