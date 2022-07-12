package com.metaus.cart.model;

import java.util.List;
import java.util.Map;

public interface CartService {
	int insertCart(CartVO vo);
	List<CartVO> selectCartList(int memNo);
}
