package com.metaus.admin.model;

import java.util.List;

public interface ManagerPdService {
	List<ManagerPdVO> selectPdByCateNo(int cateNo);
	ManagerPdVO selectPdByPdNo(int pdNo);
	ManagerPdVO selectCateByCateNo(int cateNo);
	List<ManagerPdVO> selectPdAll();
	List<ManagerPdVO> selectCateAll();
	List<ManagerPdVO> selectSearch(ManagerPdSearchVO vo);
	int selectBuyCntByMonth(ManagerPdVO vo);
	int selectMaxPrice();
	
}
