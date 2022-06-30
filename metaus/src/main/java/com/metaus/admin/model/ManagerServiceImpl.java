package com.metaus.admin.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerServiceImpl implements ManagerService {
	
	private final ManagerDAO managerDao;
	
	public int insertMember(ManagerVO vo){
		int cnt=managerDao.insertManager(vo);
		return cnt;
	}
	
	public int checkLogin(String userid, String pwd) {
		String dbPwd = managerDao.selectPwd(userid);
		
		int result=0;
		if(dbPwd !=null && !dbPwd.isEmpty()) {
			if(dbPwd.equals(pwd)) {
				result=ManagerService.LOGIN_OK;
			}else {
				result=ManagerService.DISAGREE_PWD;				
			}
		}else {
			result=ManagerService.NONE_USERID;
		}
		
		return result;
	}
	
	public ManagerVO selectByUserid(String managerId) {
		return managerDao.selectByUserid(managerId);
	}
	
	public int duplicateId(String memId){
		int count=managerDao.duplicateId(memId);
		
		int result=0;
		if(count>0) {  //이미 존재 => 사용불가
			result=ManagerService.UNUSABLE_ID;
		}else { //사용가능
			result=ManagerService.USABLE_ID;			
		}
		
		return result;
	}
}
