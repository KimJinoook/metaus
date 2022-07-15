package com.metaus.model;

import java.util.List;

import com.metaus.common.SearchVO;
import com.metaus.resume.model.PortfolioVO;

public interface IndexService {
	IndexVO selectCateCnt() ;
	IndexVO selectFooterCnt();
	List<IndexVO> selectRec();
}
