package com.metaus.member.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FacebookServiceImpl implements FacebookService {
	
	private final FacebookDAO facebookDao;


	public FacebookVO selectByUserid(String facebookEmail) {
		return facebookDao.selectByUserid(facebookEmail);
	}
	
	public int insertMember(FacebookVO vo){
		int cnt=facebookDao.insertMember(vo);
		return cnt;
	}
	


}
