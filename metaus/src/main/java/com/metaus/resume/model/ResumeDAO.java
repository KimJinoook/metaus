package com.metaus.resume.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ResumeDAO {
	int insertresume(ResumeVO vo);
	ResumeVO selectBymemNo(int memNo);
	int dupTitle(String resTitle);
	int updateresume(ResumeVO vo);
	int insertPortAtc(PortfolioVO vo);
	List<PortfolioVO> selectmemNo(int memNo);
	PortfolioVO selectportNo(int portNo);
	int deleteport(int portNo);
}
