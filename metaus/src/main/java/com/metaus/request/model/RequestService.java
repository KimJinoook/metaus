package com.metaus.request.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.metaus.common.SearchVO;

import lombok.RequiredArgsConstructor;

public interface RequestService {
	public int insertRequest(RequestVO vo);
	public List<RequestVO> selectAll(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);

}
