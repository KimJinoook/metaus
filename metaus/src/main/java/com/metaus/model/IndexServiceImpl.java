package com.metaus.model;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.metaus.common.SearchVO;
import com.metaus.resume.model.PortfolioVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class IndexServiceImpl implements IndexService {
	
	private final IndexDAO indexDao;
	
	public IndexVO selectCateCnt() {
		return indexDao.selectCateCnt();
	}
	
	public IndexVO selectFooterCnt() {
		return indexDao.selectFooterCnt();
	}

}
