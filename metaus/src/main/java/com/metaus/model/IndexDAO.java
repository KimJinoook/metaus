package com.metaus.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.common.SearchVO;
import com.metaus.resume.model.PortfolioVO;


@Mapper
public interface IndexDAO {


	IndexVO selectCateCnt() ;
	IndexVO selectFooterCnt();
	List<IndexVO> selectRec();
}
