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
}
