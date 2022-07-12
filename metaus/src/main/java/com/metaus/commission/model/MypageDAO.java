package com.metaus.commission.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.common.SearchVO;

@Mapper
public interface MypageDAO {
	List<MypageVO> selectAll(MypageVO vo);
	public int getTotalRecord(int memNo);
}
