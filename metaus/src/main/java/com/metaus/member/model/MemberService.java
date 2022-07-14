package com.metaus.member.model;

import java.util.List;
import java.util.Map;

import com.metaus.common.SearchVO;
import com.metaus.resume.model.PortfolioVO;

public interface MemberService {
	public static final int USABLE_ID=1;  //사용가능한 아이디
	public static final int UNUSABLE_ID=2; //이미 존재해서 사용불가능한 아이디

	//로그인 체크에서 사용하는 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int DISAGREE_PWD=2;  //비번 불일치
	public static final int NONE_USERID=3;  //해당 아이디 없다	
	
	public int checkLogin(String userid, String pwd);
	public MemberVO selectByUserid(String memId);
	public MemberVO selectBySocialid(String memId);
	public MemberVO selectByMemNo(int memNo);
	public int duplicateId(String memId);
	public int insertMember(MemberVO vo);
	public int updateKakao(int memNo);
	public int updateNaver(int memNo);
	public int updateFacebook(int memNo);
	public String findId(MemberVO vo);
	public String findPw(MemberVO vo);
	public int updatePw(MemberVO vo);
	public List<MemberVO> selectAllCreater(SearchVO vo);
	public int getTotalRecord(SearchVO vo);
	public List<PortfolioVO> selectPortByMenNo(int memNo);
	List<MemberVO> selectAll();
	public int getAllMemNoPort();
	public String sumPayToday();
	public int unlockMember(int memNo);
	public int lockMember(MemberVO vo);
	public int warnCntUp(MemberVO vo);
	//회원정보 수정 - 최재훈
	int updateMember(MemberVO vo);
	//의뢰 지원자 현황 - 한용민
	public List<MemberVO> selectCreaterByRecNo(Map<String, Object> map);
	public int getTotalRecordByrecNo(Map<String, Object> map);
}
