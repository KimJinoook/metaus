package com.metaus.member.model;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface NaverDAO {
	NaverVO selectByUserid(String naverEmail);
	public int insertMember(NaverVO vo);

}
