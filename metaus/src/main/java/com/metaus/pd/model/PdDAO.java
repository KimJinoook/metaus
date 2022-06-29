package com.metaus.pd.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PdDAO {
	int insertPd(PdVO vo);
	PdVO selectPdByNo(int pdNo);
	List<PdVO> selectByCategory(int cateNo);
	int deletePd(int pdNo);
	List<PdVO> selectPdByMemNo(int memNo);
}
