package com.metaus.member.model;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberDAO {
	public int insertMember(MemberVO vo);
	String selectPwd(String memId);
	MemberVO selectByUserid(String memId) ;
	MemberVO selectByMemNo(int memNo) ;
	public int duplicateId(String memId);

}
