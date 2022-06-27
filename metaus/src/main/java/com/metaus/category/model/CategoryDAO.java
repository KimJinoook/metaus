package com.metaus.category.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryDAO {
	List<CategoryVO> selectCategory();
}
