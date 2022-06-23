package com.metaus.vod.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VodDAO {
	VodVO selectVodByNo(int classNo);
}
