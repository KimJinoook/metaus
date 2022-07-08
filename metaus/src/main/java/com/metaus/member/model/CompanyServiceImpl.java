package com.metaus.member.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService {
	private final CompanyDAO companyDao;
	
	public int checkLogin(String userid, String pwd) {
		String dbPwd = companyDao.selectPwd(userid);
		
		int result=0;
		if(dbPwd !=null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result=MemberService.LOGIN_OK;
			}else {
				result=MemberService.DISAGREE_PWD;				
			}
		}else {
			result=MemberService.NONE_USERID;
		}
		
		return result;
	}
	
	public CompanyVO selectByUserid(String memId) {
		return companyDao.selectByUserid(memId);
	}
	
	public int duplicateId(String memId){
		int count=companyDao.duplicateId(memId);
		
		int result=0;
		if(count>0) {  //이미 존재 => 사용불가
			result=CompanyService.UNUSABLE_ID;
		}else { //사용가능
			result=CompanyService.USABLE_ID;			
		}
		
		return result;
	}
	
	public int insertCompany(CompanyVO vo){
		int cnt=companyDao.insertCompany(vo);
		return cnt;
	}
	
	public String findId(CompanyVO vo) {
		return companyDao.findId(vo);
	}
	public String findPw(CompanyVO vo) {
		return companyDao.findPw(vo);
	}
	public int updatePw(CompanyVO vo) {
		return companyDao.updatePw(vo);
	}
	public int selectAllCount() {
		return companyDao.selectAllCount();
	}
	public int selectRecCount() {
		return companyDao.selectRecCount();
	}
	public int selectConCount() {
		return companyDao.selectConCount();
	}
	public int selectConCountNotEnd() {
		return companyDao.selectConCountNotEnd();
	}
	public int selectConCountEnd() {
		return companyDao.selectConCountEnd();
	}

	@Override
	public List<CompanyVO> selectAll() {
		return companyDao.selectAll();
	}

	@Override
	public int updateCompany(CompanyVO vo) {
		return companyDao.updateCompany(vo);
	}
	public CompanyVO selectByComNo(int memNo) {
		return companyDao.selectByComNo(memNo);
	}

}
