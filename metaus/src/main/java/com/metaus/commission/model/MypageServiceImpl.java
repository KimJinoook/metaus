package com.metaus.commission.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.metaus.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService{
	
	private final MypageDAO mypageDao;

	

	@Override
	public int getTotalRecord(int memNo) {
		return mypageDao.getTotalRecord(memNo);
	}



	@Override
	public List<MypageVO> selectAll(MypageVO vo) {
		return mypageDao.selectAll(vo);
	}



	@Override
	public List<MypageVO> completion(MypageVO vo) {
		return mypageDao.completion(vo);
	}



	@Override
	public int getTotalRecord1(int memNo) {
		return mypageDao.getTotalRecord1(memNo);
	}



	@Override
	public List<MypageVO> completion1(MypageVO vo) {
		return mypageDao.completion1(vo);
	}
}
