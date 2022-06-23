package com.metaus.resume.model;

import java.util.List;

public interface ResumeService {
	int insertresume(ResumeVO vo);
	ResumeVO selectBymemNo(int memNo);
	int dupTitle(String resTitle);
	int updateresume(ResumeVO vo);
	int insertPortAtc(PortfolioVO vo);
	List<PortfolioVO> selectmemNo(int memNo);
	PortfolioVO selectportNo(int portNo);
	int deleteport(int portNo);
}
