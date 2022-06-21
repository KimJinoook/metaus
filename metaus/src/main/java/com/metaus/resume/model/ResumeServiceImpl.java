package com.metaus.resume.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ResumeServiceImpl implements ResumeService{
	public final ResumeDAO resumeDao;
	
	@Override
	public int insertresume(ResumeVO vo) {
		return resumeDao.insertresume(vo);
	}

	@Override
	public ResumeVO selectBymemNo(int memNo) {
		return resumeDao.selectBymemNo(memNo);
	}

	@Override
	public int dupTitle(String resTitle) {
		return resumeDao.dupTitle(resTitle);
	}

	
	
}
