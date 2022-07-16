package com.metaus.cart.model;

import java.util.List;

public interface CartService {
	int insertCart(CartVO vo);
	List<CartVO> selectCartList(int memNo);
	int deleteCartByMemNo(int memNo, int pdNo);
	int deleteCartAllByMemNo(int memNo);
	int selectBuyCount(int memNo, int pdNo);
	int selectCartCountByPdNo(int memNo, int pdNo);
}
