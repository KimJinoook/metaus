package com.metaus.member.model;

import java.util.List;

public interface CompanyService {
	public static final int USABLE_ID=1;  //사용가능한 아이디
	public static final int UNUSABLE_ID=2; //이미 존재해서 사용불가능한 아이디

	//로그인 체크에서 사용하는 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int DISAGREE_PWD=2;  //비번 불일치
	public static final int NONE_USERID=3;  //해당 아이디 없다	
	
	public int checkLogin(String userid, String pwd);
	public CompanyVO selectByUserid(String comId);
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
