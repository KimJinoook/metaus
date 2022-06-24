package com.metaus.pd.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PdDAO {
	int insertPd(PdVO vo);
}
