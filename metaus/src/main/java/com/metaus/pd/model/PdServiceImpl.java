package com.metaus.pd.model;

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
	
}
