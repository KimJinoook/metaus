package com.metaus.request.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RequestVO {
	private int recNo; /* 의뢰번호 */
	private int comNo; /* 기업번호 */
	private String recTitle; /* 의뢰제목 */
	private String recContent; /* 의뢰내용 */
	private int recPay; /* 페이 */
	private Timestamp recRegdate; /* 등록일 */
	private int recReadcount; /* 조회수 */
}
