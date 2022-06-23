package com.metaus.vod.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VodServiceImpl implements VodService{

	private final VodDAO vodDao;
	
	@Override
	public VodVO selectVodByNo(int classNo) {
		return vodDao.selectVodByNo(classNo);
	}
	
}
