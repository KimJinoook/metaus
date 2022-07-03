package com.metaus.common;

public interface VisitService {
	
	public int insertVisit();
	public int todayVisit();
	public int totalVisit();
	public int selectVisitByDate(String date);

}
