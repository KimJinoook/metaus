package com.metaus.request.model;

import lombok.Data;

@Data
public class RequestAtcVO {
	private int recfile_no; /* 의뢰첨부번호 */
	private int rec_no; /* 의뢰번호 */
	private String recfile_filename; /* 파일명 */
	private String recfile_originname; /* 원본파일명 */
}
