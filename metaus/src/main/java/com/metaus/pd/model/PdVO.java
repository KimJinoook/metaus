package com.metaus.pd.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PdVO {
	private int pdNo; /* 상품 번호 */
	private String pdName; /* 상품명 */
	private int pdPrice; /* 가격 */
	private Timestamp pdRegdate; /* 등록일 */
	private String pdPreview; /* 상품소개 */
    private String pdFileName; /* 파일명 */
	private String pdOriginName; /* 원본파일명 */
	private int memNo; /* 회원번호 */
}
