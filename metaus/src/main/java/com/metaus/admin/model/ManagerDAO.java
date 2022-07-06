package com.metaus.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.member.model.MemberVO;


@Mapper
public interface ManagerDAO {
	public int insertManager(ManagerVO vo);
	String selectPwd(String managerId);
	ManagerVO selectByUserid(String managerId) ;
	public int duplicateId(String managerId);
	List<ManagerVO> selectAll();
	public int deleteByManagerNo(int managerNo);
	public String findId(ManagerVO vo);
	public String findPw(ManagerVO vo);
	public int updatePw(ManagerVO vo);
}
