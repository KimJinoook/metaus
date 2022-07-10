package com.metaus.cart.model;

import java.util.List;
import java.util.Map;

public interface CartService {
	int selectCartCount(CartVO vo);
	int insertCart(CartVO vo);
	List<Map<String, Object>> selectCartList(int memNo);
	int deleteCartByMemNo(int memNo);
}
