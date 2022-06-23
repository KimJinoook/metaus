package com.metaus.resume.model;

import java.util.List;

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

	@Override
	public int updateresume(ResumeVO vo) {
		return resumeDao.updateresume(vo);
	}

	@Override
	public int insertPortAtc(PortfolioVO vo) {
		return resumeDao.insertPortAtc(vo);
	}

	@Override
	public List<PortfolioVO> selectmemNo(int memNo) {
		return resumeDao.selectmemNo(memNo);
	}

	@Override
	public PortfolioVO selectportNo(int portNo) {
		return resumeDao.selectportNo(portNo);
	}

	@Override
	public int deleteport(int portNo) {
		return resumeDao.deleteport(portNo);
	}

	

	
	
}
