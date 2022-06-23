package com.metaus.request.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.common.SearchVO;

@Mapper
public interface RequestDAO {
	public int insertRequest(RequestVO vo);
	public List<RequestVO> selectAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
}
