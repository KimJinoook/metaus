package com.metaus.member.model;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface KakaoDAO {
	KakaoVO selectByUserid(String kakaoEmail);
	public int insertMember(KakaoVO vo);

}
