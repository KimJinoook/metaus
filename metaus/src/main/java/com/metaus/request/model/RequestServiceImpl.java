package com.metaus.request.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RequestServiceImpl implements RequestService {
	private final RequestDAO requestDao;
	
	public int insertRequest(RequestVO vo) {
		int cnt= requestDao.insertRequest(vo);
		
		return cnt;
	}
}
