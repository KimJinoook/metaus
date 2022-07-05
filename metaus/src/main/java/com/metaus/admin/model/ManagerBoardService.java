package com.metaus.admin.model;

import java.util.List;

public interface ManagerBoardService {
	List<ManagerBoardVO> selectBoardByBtypeNo(int btypeNo);
	ManagerBoardVO selectBtypeByBtypeNo(int btypeNo);
	int deleteBoard(int boardNo);
	int insertBoard(ManagerBoardVO vo);
	ManagerBoardVO selectBoardByBoardNo(int boardNo);
	int updateBoard(ManagerBoardVO vo);

}
