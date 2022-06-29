package com.metaus.pd.model;

import java.util.List;

public interface PdService {
	int insertPd(PdVO vo);
	PdVO selectPdByNo(int pdNo);
	List<PdVO> selectByCategory(int cateNo);
	int deletePd(int pdNo);
	List<PdVO> selectPdByMemNo(int memNo);
}
