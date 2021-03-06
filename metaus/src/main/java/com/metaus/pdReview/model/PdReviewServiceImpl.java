package com.metaus.pdReview.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PdReviewServiceImpl implements PdReviewService{
	private final PdReviewDAO pdReviewDao;
	
	@Override
	public int insertPdReview(PdReviewVO vo) {
		return pdReviewDao.insertPdReview(vo);
	}

	@Override
	public List<PdReviewVO> selectPdReviewByPdNo(int pdNo) {
		return pdReviewDao.selectPdReviewByPdNo(pdNo);
	}

	@Override
	public int deletePdReview(int reviewNo) {
		return pdReviewDao.deletePdReview(reviewNo);
	}

	@Override
	public double selectPdReviewAvg(int pdNo) {
		return pdReviewDao.selectPdReviewAvg(pdNo);
	}

}
