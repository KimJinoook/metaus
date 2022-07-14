package com.metaus.buy.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyDAO {
	int insertBuy(BuyVO vo);
	List<BuyVO> selectBuyByMemNo(int memNo);
	int insertBuyDetail(BuyVO vo);
}
