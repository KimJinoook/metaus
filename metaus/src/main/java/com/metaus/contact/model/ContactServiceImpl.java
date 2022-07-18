package com.metaus.contact.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ContactServiceImpl implements ContactService {
	
	private final ContactDAO contactDao;
	
	public List<ContactVO> selectContactByMemNo(int memNo){
		return contactDao.selectContactByMemNo(memNo);
	}

	@Override
	public Map<String, Object> selectRecpreByRecNoMemNo(Map<String, Integer> map) {
		return contactDao.selectRecpreByRecNoMemNo(map);
	}
	
	

}
