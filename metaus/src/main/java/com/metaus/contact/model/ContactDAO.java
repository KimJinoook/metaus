package com.metaus.contact.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ContactDAO {
	public List<ContactVO> selectContactByMemNo(int memNo);

}
