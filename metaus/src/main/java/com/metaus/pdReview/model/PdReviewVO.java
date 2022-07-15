package com.metaus.pdReview.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PdReviewVO {
	private int reviewNo; /* 리뷰번호 */
	private int pdNo; /* 모델번호 */
	private int memNo; /* 회원번호 */
	private String reviewContent; /* 리뷰 */
	private int reviewScore; /* 평점 */
	private Timestamp reviewRegdate; /* 등록일 */
}
