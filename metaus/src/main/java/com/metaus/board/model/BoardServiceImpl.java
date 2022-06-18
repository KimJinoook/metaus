package com.metaus.board.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final BoardDAO boardDao;	
	@Override
	public int insertBoard(BoardVO boardVo) {
		return boardDao.insertBoard(boardVo);
	}
	@Override
	public List<BoardVO> selectBoard(int btypeNo) {
		return boardDao.selectBoard(btypeNo);
	}

}
