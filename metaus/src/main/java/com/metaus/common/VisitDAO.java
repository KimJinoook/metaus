package com.metaus.common;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface VisitDAO {
	public int insertVisit();
	public int totalVisit();
	public int todayVisit();
	public int selectVisitByDate(String date);

}
