package com.metaus.buy.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BuyServiceImpl implements BuyService{
	private final BuyDAO buyDao;

	@Override
	public int insertBuy(BuyVO vo) {
		return buyDao.insertBuy(vo);		
	}

	@Override
	public List<BuyVO> selectBuyByMemNo(int memNo) {
		return buyDao.selectBuyByMemNo(memNo);
	}
}
