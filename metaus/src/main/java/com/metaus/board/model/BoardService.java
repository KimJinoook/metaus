package com.metaus.board.model;

import java.util.List;
import java.util.Map;

import com.metaus.common.SearchVO;
import com.metaus.member.model.MemberVO;

public interface BoardService {
	int insertBoard(BoardVO boardVo);
	int insertBoardAtc(BoardAtcVO boardAtcVo);
	List<Map<String, Object>> selectBoard(SearchVO vo);
	List<BoardAtcVO> selectBoardAtc();
	BoardVO selectBoardDetail(int boardNo);
	BoardAtcVO selectBoardAtcByNo(int boardNo);
	int updateBoardReadCount(int boardNo);
	int selectTotalRecord(SearchVO searchVo);
	List<BoardVO> selectBoardFaq(BoardVO boardVo);
	int updateBoard(BoardVO vo);
	int updateBoardAtc(BoardAtcVO vo);
	BoardVO selectByBoardNo(int boardNo);
	BoardAtcVO selectByBfileNo(int bfileNo);
	int deleteBoard(BoardVO vo);
	List<BoardVO> PopularSelect(int btypeNo);
}
