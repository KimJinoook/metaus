package com.metaus.resume.model;

import lombok.Data;

@Data
public class PortfolioVO {
	private int portNo;  /* 포트폴리오 번호 */
	private int memNo;  /* 회원번호 */
	private String portTitle;  /* 작업제목 */
	private String portFilename; /* 작업사진 */
	private String portOriginname;  /* 작업사진원본 */
	private String portContent;  /* 작업내용 */
}
