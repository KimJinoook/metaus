package com.metaus.member.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CompanyDAO {
	String selectPwd(String memId);
	CompanyVO selectByUserid(String memId) ;
}
