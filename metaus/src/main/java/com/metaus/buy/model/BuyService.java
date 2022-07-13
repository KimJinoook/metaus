package com.metaus.buy.model;

import java.util.List;

public interface BuyService {
	int insertBuy(BuyVO vo);
	List<BuyVO> selectBuyByMemNo(int memNo);
}
