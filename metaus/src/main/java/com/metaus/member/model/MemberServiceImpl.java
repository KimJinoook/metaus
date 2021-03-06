package com.metaus.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.metaus.common.SearchVO;
import com.metaus.resume.model.PortfolioVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	private final MemberDAO memberDao;
	
	public int insertMember(MemberVO vo){
		int cnt=memberDao.insertMember(vo);
		return cnt;
	}
	
	public int checkLogin(String userid, String pwd) {
		String dbPwd = memberDao.selectPwd(userid);
		String dbLock = memberDao.selectLock(userid);
		BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
		
		
		int result=0;
		if(dbPwd !=null && !dbPwd.isEmpty()) {
			/*
			if(encoder.matches(pwd, dbLock)) {
				result=MemberService.LOGIN_OK;
			}else {
				result=MemberService.DISAGREE_PWD;				
			}
			*/
			if(pwd.equals(dbPwd)) {
				result=MemberService.LOGIN_OK;
			}else {
				result=MemberService.DISAGREE_PWD;				
			}
		}else {
			result=MemberService.NONE_USERID;
		}
		
		return result;
	}
	
	public MemberVO selectByUserid(String memId) {
		return memberDao.selectByUserid(memId);
	}
	public MemberVO selectBySocialid(String memId) {
		return memberDao.selectBySocialid(memId);
	}
	public MemberVO selectByMemNo(int memNo) {
		return memberDao.selectByMemNo(memNo);
	}
	
	public int duplicateId(String memId){
		int count=memberDao.duplicateId(memId);
		
		int result=0;
		if(count>0) {  //이미 존재 => 사용불가
			result=MemberService.UNUSABLE_ID;
		}else { //사용가능
			result=MemberService.USABLE_ID;			
		}
		
		return result;
	}
	public int updateKakao(int memNo) {
		return memberDao.updateKakao(memNo);
	}
	public int updateNaver(int memNo) {
		return memberDao.updateNaver(memNo);
	}
	public int updateFacebook(int memNo) {
		return memberDao.updateFacebook(memNo);
	}
	
	public String findId(MemberVO vo) {
		return memberDao.findId(vo);
	}
	public String findPw(MemberVO vo) {
		return memberDao.findPw(vo);
	}
	public int updatePw(MemberVO vo) {
		return memberDao.updatePw(vo);
	}
	
	public List<MemberVO> selectAllCreater(SearchVO vo){
		return memberDao.selectAllCreater(vo);
	}
	
	public int getTotalRecord(SearchVO vo) {
		return memberDao.getTotalRecord(vo);
	}
	
	public List<PortfolioVO> selectPortByMenNo(int menNo) {
		return memberDao.selectPortByMenNo(menNo);
	}

	@Override
	public List<MemberVO> selectAll() {
		return memberDao.selectAll();

	}
	public int getAllMemNoPort() {
		return memberDao.getAllMemNoPort();
	}
	public String sumPayToday() {
		return memberDao.sumPayToday();
	}
	public int unlockMember(int memNo) {
		return memberDao.unlockMember(memNo);
	}
	public int lockMember(MemberVO vo) {
		return memberDao.lockMember(vo);
	}
	public int warnCntUp(MemberVO vo) {
		return memberDao.warnCntUp(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return memberDao.updateMember(vo);
	}

	@Override
	public List<MemberVO> selectCreaterByRecNo(Map<String, Object> map) {
		return memberDao.selectCreaterByRecNo(map);
	}

	@Override
	public int getTotalRecordByrecNo(Map<String, Object> map) {
		return memberDao.getTotalRecordByrecNo(map);
	}

}
