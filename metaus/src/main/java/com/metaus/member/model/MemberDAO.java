package com.metaus.member.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.common.SearchVO;
import com.metaus.resume.model.PortfolioVO;


@Mapper
public interface MemberDAO {
	public int insertMember(MemberVO vo);
	String selectPwd(String memId);
	MemberVO selectByUserid(String memId) ;
	MemberVO selectBySocialid(String memId) ;
	MemberVO selectByMemNo(int memNo) ;
	public int duplicateId(String memId);
	public int updateKakao(int memNo);
	public int updateNaver(int memNo);
	public int updateFacebook(int memNo);
	public String findId(MemberVO vo);
	public String findPw(MemberVO vo);
	public int updatePw(MemberVO vo);
	public List<MemberVO> selectAllCreater(SearchVO vo);
	public int getTotalRecord(SearchVO vo);
	public List<PortfolioVO> selectPortByMenNo(int memNo);

}
