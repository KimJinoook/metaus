package com.metaus.request.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.metaus.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RequestServiceImpl implements RequestService {
	private final RequestDAO requestDao;
	
	public int insertRequest(RequestVO vo) {
		int cnt= requestDao.insertRequest(vo);
		
		return cnt;
	}

	@Override
	public List<RequestVO> selectAll(SearchVO searchVo) {
		return requestDao.selectAll(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return requestDao.getTotalRecord(searchVo);
	}
	
	
}
