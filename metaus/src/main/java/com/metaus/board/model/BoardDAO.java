package com.metaus.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.member.model.MemberVO;

@Mapper
public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	int insertBoardAtc(BoardAtcVO boardAtcVo);
	List<Map<String, Object>> selectBoard(int btypeNo);
	List<BoardAtcVO> selectBoardAtc();
	BoardVO selectBoardDetail(int boardNo);
	BoardAtcVO selectBoardAtcByNo(int boardNo);
	int updateBoardReadCount(int boardNo);
}
