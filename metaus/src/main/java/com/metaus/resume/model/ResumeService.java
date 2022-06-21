package com.metaus.resume.model;

public interface ResumeService {
	int insertresume(ResumeVO vo);
	ResumeVO selectBymemNo(int memNo);
	int dupTitle(String resTitle);
}
