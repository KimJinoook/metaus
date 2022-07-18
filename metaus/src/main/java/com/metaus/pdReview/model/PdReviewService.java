package com.metaus.pdReview.model;

import java.util.List;

public interface PdReviewService {
	int insertPdReview(PdReviewVO vo);
	List<PdReviewVO> selectPdReviewByPdNo(int pdNo);
	int deletePdReview(int reviewNo);
	double selectPdReviewAvg(int pdNo);
}
