package com.metaus.contact.model;

import java.util.List;
import java.util.Map;

public interface ContactService {

	public List<ContactVO> selectContactByMemNo(int memNo);
	Map<String, Object> selectRecpreByRecNoMemNo(Map<String, Integer> map);
}
