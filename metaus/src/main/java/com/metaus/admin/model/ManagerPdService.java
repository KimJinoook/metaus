package com.metaus.admin.model;

import java.util.List;

public interface ManagerPdService {
	List<ManagerPdVO> selectPdByCateNo(int cateNo);
	ManagerPdVO selectCateByCateNo(int cateNo);
	List<ManagerPdVO> selectPdAll();
	List<ManagerPdVO> selectCateAll();
	
}
