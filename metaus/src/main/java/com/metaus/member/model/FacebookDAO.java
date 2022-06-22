package com.metaus.member.model;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface FacebookDAO {
	FacebookVO selectByUserid(String facebookEmail);
	public int insertMember(FacebookVO vo);

}
