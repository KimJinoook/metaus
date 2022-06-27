package com.metaus.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.common.SearchVO;
import com.metaus.member.model.MemberVO;

@Mapper
public interface BoardDAO {
	int insertBoard(BoardVO boardVo);
	int insertBoardAtc(BoardAtcVO boardAtcVo);
	List<Map<String, Object>> selectBoard(SearchVO vo);
	List<BoardAtcVO> selectBoardAtc();
	BoardVO selectBoardDetail(int boardNo);
	BoardAtcVO selectBoardAtcByNo(int boardNo);
	int updateBoardReadCount(int boardNo);
	int selectTotalRecord(int btypeNo);
	List<BoardVO> selectBoardFaq(BoardVO boardVo);
	int updateBoard(BoardVO vo);
	int updateBoardAtc(BoardAtcVO vo);
	BoardVO selectByBoardNo(int boardNo);
	BoardAtcVO selectByBfileNo(int bfileNo);
}
