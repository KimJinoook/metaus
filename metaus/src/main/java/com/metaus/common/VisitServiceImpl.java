package com.metaus.common;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VisitServiceImpl implements VisitService {
	
	private final VisitDAO visitDao;
	
	public int insertVisit() {
		return visitDao.insertVisit();
	}
	public int todayVisit() {
		return visitDao.todayVisit();
	}
	public int totalVisit() {
		return visitDao.totalVisit();
	}
	
	
}
