package com.metaus.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ManagerPdDAO {
	List<ManagerPdVO> selectPdByCateNo(int cateNo);
	ManagerPdVO selectPdByPdNo(int pdNo);
	ManagerPdVO selectCateByCateNo(int cateNo);
	List<ManagerPdVO> selectPdAll();
	List<ManagerPdVO> selectCateAll();
	int selectBuyCntByMonth(ManagerPdVO vo);
}
