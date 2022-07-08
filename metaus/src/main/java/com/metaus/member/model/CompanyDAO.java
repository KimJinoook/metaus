package com.metaus.member.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CompanyDAO {
	String selectPwd(String memId);
	CompanyVO selectByUserid(String memId) ;
	CompanyVO selectByComNo(int memNo) ;
	public int duplicateId(String comId);
	public int insertCompany(CompanyVO vo);
	public String findId(CompanyVO vo);
	public String findPw(CompanyVO vo);
	public int updatePw(CompanyVO vo);
	public int selectAllCount();
	public int selectRecCount();
	public int selectConCount();
	public int selectConCountNotEnd();
	public int selectConCountEnd();
	List<CompanyVO> selectAll();
	/*기업 회원 정보 수정 - 최재훈*/
	int updateCompany(CompanyVO vo);
}
