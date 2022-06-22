package com.metaus.member.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NaverServiceImpl implements NaverService {
	
	private final NaverDAO naverDao;


	public NaverVO selectByUserid(String naverEmail) {
		return naverDao.selectByUserid(naverEmail);
	}
	
	public int insertMember(NaverVO vo){
		int cnt=naverDao.insertMember(vo);
		return cnt;
	}
	


}
