package com.metaus.member.model;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberDAO {
	String selectPwd(String memId);
	MemberVO selectByUserid(String memId) ;

}
