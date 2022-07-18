package com.metaus.contact.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ContactDAO {
	List<ContactVO> selectContactByMemNo(int memNo);
	Map<String, Object> selectRecpreByRecNoMemNo(Map<String, Integer> map);
}
