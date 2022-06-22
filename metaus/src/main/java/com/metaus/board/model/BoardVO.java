package com.metaus.board.model;

import java.sql.Timestamp;

import com.metaus.common.SearchVO;

import lombok.Data;

@Data
public class BoardVO extends SearchVO {
	private int boardNo;/* 글 번호 */
	private int memNo;/* 회원번호 */
	private String boardTitle;/* 제목 */
	private Timestamp boardRegdate;/* 작성일 */
	private int boardReadcount;/* 조회수 */
	private String boardContent;/* 내용 */
	private int boardGroupNo;/* 그룹번호 */
	private int boardStep;/* 글 단계 */
	private int boardSortNo;/* 글 정렬순서 */
	private String boardDelFlag;/* 삭제 */
	private int boardReport;/* 신고수 */
	private int btypeNo;/* 타입 번호 */
}
