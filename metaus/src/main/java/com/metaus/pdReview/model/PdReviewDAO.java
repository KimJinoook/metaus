package com.metaus.pdReview.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PdReviewDAO {
	int insertPdReview(PdReviewVO vo);
	List<PdReviewVO> selectPdReviewByPdNo(int pdNo);
	int deletePdReview(int reviewNo);
	double selectPdReviewAvg(int pdNo);
}
