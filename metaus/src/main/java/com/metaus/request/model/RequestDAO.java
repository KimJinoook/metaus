package com.metaus.request.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RequestDAO {
	public int insertRequest(RequestVO vo);
}
