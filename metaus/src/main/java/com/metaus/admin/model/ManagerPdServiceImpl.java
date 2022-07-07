package com.metaus.admin.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerPdServiceImpl implements ManagerPdService {
	
	private final ManagerPdDAO managerPdDao;
	
	public List<ManagerPdVO> selectPdByCateNo(int cateNo) {
		return managerPdDao.selectPdByCateNo(cateNo);
	}
	
	public ManagerPdVO selectCateByCateNo(int cateNo) {
		return managerPdDao.selectCateByCateNo(cateNo);
	}
	
	public List<ManagerPdVO> selectPdAll() {
		return managerPdDao.selectPdAll();
	}
	
	public List<ManagerPdVO> selectCateAll() {
		return managerPdDao.selectCateAll();
	}
}
