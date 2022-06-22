package com.metaus.request.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RequestVO {
	private int rec_no; /* 의뢰번호 */
	private int com_no; /* 기업번호 */
	private String rec_title; /* 의뢰제목 */
	private String rec_content; /* 의뢰내용 */
	private int rec_pay; /* 페이 */
	private Timestamp rec_regdate; /* 등록일 */
	private int rec_readcount; /* 조회수 */
}
