package com.metaus.board.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.metaus.common.SearchVO;
import com.metaus.member.model.MemberVO;

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
	public List<Map<String, Object>> selectBoard(SearchVO vo) {
		return boardDao.selectBoard(vo);
	}
	@Override
	public int insertBoardAtc(BoardAtcVO boardAtcVo) {
		return boardDao.insertBoardAtc(boardAtcVo);
	}
	@Override
	public List<BoardAtcVO> selectBoardAtc() {
		return boardDao.selectBoardAtc();
	}
	@Override
	public BoardVO selectBoardDetail(int boardNo) {
		return boardDao.selectBoardDetail(boardNo);
	}
	@Override
	public BoardAtcVO selectBoardAtcByNo(int boardNo) {
		return boardDao.selectBoardAtcByNo(boardNo);
	}
	@Override
	public int updateBoardReadCount(int boardNo) {
		return boardDao.updateBoardReadCount(boardNo);
	}
	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return boardDao.selectTotalRecord(searchVo);
	}
	@Override
	public List<BoardVO> selectBoardFaq(BoardVO boardVo) {
		return boardDao.selectBoardFaq(boardVo);
	}
	@Override
	public int updateBoard(BoardVO vo) {
		return boardDao.updateBoard(vo);
	}
	@Override
	public int updateBoardAtc(BoardAtcVO vo) {
		return boardDao.updateBoardAtc(vo);
	}
	@Override
	public BoardVO selectByBoardNo(int boardNo) {
		return boardDao.selectByBoardNo(boardNo);
	}
	@Override
	public BoardAtcVO selectByBfileNo(int bfileNo) {
		return boardDao.selectBoardAtcByNo(bfileNo);
	}
	@Override
	public int deleteBoard(BoardVO vo) {
		return boardDao.deleteBoard(vo);
	}
	
	

}
