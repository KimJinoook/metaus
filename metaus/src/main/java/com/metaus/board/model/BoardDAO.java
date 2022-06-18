package com.metaus.board.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	List<BoardVO> selectBoard(int btypeNo);
}
