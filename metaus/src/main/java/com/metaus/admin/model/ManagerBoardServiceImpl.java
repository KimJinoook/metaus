package com.metaus.admin.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerBoardServiceImpl implements ManagerBoardService {
	
	private final ManagerBoardDAO managerBoardDao;
	
	public List<ManagerBoardVO> selectBoardByBtypeNo(int btypeNo){
		return managerBoardDao.selectBoardByBtypeNo(btypeNo);
	}
	
	public ManagerBoardVO selectBtypeByBtypeNo(int btypeNo) {
		return managerBoardDao.selectBtypeByBtypeNo(btypeNo);
	}
	public int deleteBoard(int boardNo) {
		return managerBoardDao.deleteBoard(boardNo);
	}
	public int insertBoard(ManagerBoardVO vo) {
		return managerBoardDao.insertBoard(vo);
	}
	
	public ManagerBoardVO selectBoardByBoardNo(int boardNo) {
		return managerBoardDao.selectBoardByBoardNo(boardNo);
	}
	
	public int updateBoard(ManagerBoardVO vo) {
		return managerBoardDao.updateBoard(vo);
	}
	
	
}
