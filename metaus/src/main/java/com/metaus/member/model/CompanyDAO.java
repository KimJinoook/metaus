package com.metaus.member.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CompanyDAO {
	String selectPwd(String memId);
	CompanyVO selectByUserid(String memId) ;
	public int duplicateId(String comId);
	public int insertCompany(CompanyVO vo);
	public String findId(CompanyVO vo);
	public String findPw(CompanyVO vo);
	public int updatePw(CompanyVO vo);
}
