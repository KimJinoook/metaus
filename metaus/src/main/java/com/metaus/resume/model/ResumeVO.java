package com.metaus.resume.model;

import lombok.Data;

@Data
public class ResumeVO {
	private int memNo;  /* 회원번호 */
	private String resTitle; /* 이력서 제목 */
	private String resContent;  /* 이력서 내용 */
	private String resTime;  /* 연락가능시간 */
}
