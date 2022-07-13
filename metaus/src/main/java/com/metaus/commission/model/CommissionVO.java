package com.metaus.commission.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommissionVO {
	private int recNo; /* 의뢰번호 */
	private int comNo; /* 기업번호 */
	private String recTitle; /* 의뢰제목 */
	private String recContent; /* 의뢰내용 */
	private String recContent2;
	private String recContent3;
	private String recWeb;
	private String recTwitter;
	private int recPay; /* 페이 */
	private Timestamp recRegdate; /* 등록일 */
	private int recReadcount; /* 조회수 */
}
