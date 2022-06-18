package com.metaus.board.model;

import java.util.List;

public interface BoardService {
	int insertBoard(BoardVO boardVo);
	List<BoardVO> selectBoard(int btypeNo);
}
