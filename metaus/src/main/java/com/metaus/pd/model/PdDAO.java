package com.metaus.pd.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.common.SearchVO;

@Mapper
public interface PdDAO {
	int insertPd(PdVO vo);
	PdVO selectPdByNo(int pdNo);
	List<PdVO> selectByCategory(SearchVO searchVo);
	int deletePd(int pdNo);
	List<PdVO> selectPdByMemNo(int memNo);
	List<PdVO> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	int selectTotalRecord2(SearchVO searchVo);
	List<PdVO> selectByBuyCnt(int pdNo);
	int updateTotalReview(PdVO vo);
}
