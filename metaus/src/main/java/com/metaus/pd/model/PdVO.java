package com.metaus.pd.model;

import com.metaus.common.SearchVO;

import lombok.Data;

@Data
/* 모델링상품 */
public class PdVO extends SearchVO {
	private int pdNo; /* 모델번호 */
	private int cateNo; /* 카테고리번호 */
	private int memNo; /* 회원번호 */
	private String pdName; /* 모델명 */
	private String pdPre; /* 모델소개 */
	private String pdFilename; /* 모델파일명 */
	private String pdOriginname; /* 모델원본파일명 */
	private int pdFilesize; /* 모델파일사이즈 */
	private int pdBuycnt; /* 구매수 */
}
