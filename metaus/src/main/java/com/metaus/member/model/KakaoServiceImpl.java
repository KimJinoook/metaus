package com.metaus.member.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KakaoServiceImpl implements KakaoService {
	
	private final KakaoDAO kakaoDao;


	public KakaoVO selectByUserid(String kakaoEmail) {
		return kakaoDao.selectByUserid(kakaoEmail);
	}
	
	public int insertMember(KakaoVO vo){
		int cnt=kakaoDao.insertMember(vo);
		return cnt;
	}
	


}
