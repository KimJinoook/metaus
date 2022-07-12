package com.metaus.commission.model;

import java.util.List;

import com.metaus.common.SearchVO;

public interface MypageService {
	List<MypageVO> selectAll(MypageVO vo);
	public int getTotalRecord(int memNo);
}
