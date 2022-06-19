package com.metaus.resume.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeDAO {
	int insertresume(ResumeVO vo);
	ResumeVO selectBymemNo(int memNo);
}
