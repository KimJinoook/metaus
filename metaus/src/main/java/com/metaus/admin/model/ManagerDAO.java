package com.metaus.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ManagerDAO {
	public int insertManager(ManagerVO vo);
	String selectPwd(String managerId);
	ManagerVO selectByUserid(String managerId) ;
	public int duplicateId(String managerId);
	List<ManagerVO> selectAll();
}
