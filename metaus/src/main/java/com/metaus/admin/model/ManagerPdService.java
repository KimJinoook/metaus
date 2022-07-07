package com.metaus.admin.model;

import java.util.List;

public interface ManagerPdService {
	List<ManagerBoardVO> selectBoardByBtypeNo(int btypeNo);
	ManagerBoardVO selectBtypeByBtypeNo(int btypeNo);
	int deleteBoard(int boardNo);
	int insertBoard(ManagerBoardVO vo);
	ManagerBoardVO selectBoardByBoardNo(int boardNo);
	int updateBoard(ManagerBoardVO vo);
	List<ManagerBoardVO> selectReport();
	int reportConfirmBoard(int boardNo);
	int reportBoard(ManagerBoardVO vo);
	int selectIsReportByBoardNo(int boardNo);
	
}
