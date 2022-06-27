package com.metaus.pd.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PdServiceImpl implements PdService{	
	private final PdDAO pdDao;
	
	@Override
	public int insertPd(PdVO vo) {
		return pdDao.insertPd(vo);
	}

	@Override
	public PdVO selectPdByNo(int pdNo) {
		return pdDao.selectPdByNo(pdNo);
	}

	@Override
	public List<PdVO> selectByCategory(int cateNo) {
		return pdDao.selectByCategory(cateNo);
	}

	@Override
	public int deletePd(int pdNo) {
		return pdDao.deletePd(pdNo);
	}
	
}
