package com.metaus.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ManagerBoardDAO {
	List<ManagerBoardVO> selectBoardByBtypeNo(int btypeNo);
	ManagerBoardVO selectBtypeByBtypeNo(int btypeNo);
	int deleteBoard(int boardNo);
	int insertBoard(ManagerBoardVO vo);
	ManagerBoardVO selectBoardByBoardNo(int boardNo);
	int updateBoard(ManagerBoardVO vo);
	List<ManagerBoardVO> selectReport();
}
