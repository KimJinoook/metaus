package com.metaus.board.model;

import lombok.Data;

@Data
public class BoardAtcVO {
	private int bfileNo; /* 파일번호 */
	private int boardNo; /* 글 번호 */
	private String bfileFilename; /* 파일명 */
	private String bfileOriginname; /* 원본파일명 */
	private String bfileFilesize; /* 파일사이즈 */
}
