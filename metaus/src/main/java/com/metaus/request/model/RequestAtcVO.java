package com.metaus.request.model;

import lombok.Data;

@Data
public class RequestAtcVO {
	private int recfileNo; /* 의뢰첨부번호 */
	private int recNo; /* 의뢰번호 */
	private String recfileFilename; /* 파일명 */
	private String recfileOriginname; /* 원본파일명 */
}
