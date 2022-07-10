package com.metaus.cart.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceimpl implements CartService{
	
	private final CartDAO cartDao;	
	
	@Override
	public int selectCartCount(CartVO vo) {
		return cartDao.selectCartCount(vo);
	}

	@Override
	public int insertCart(CartVO vo) {
		return cartDao.insertCart(vo);
	}

	@Override
	public List<Map<String, Object>> selectCartList(int memNo) {
		return cartDao.selectCartList(memNo);
	}

	@Override
	public int deleteCartByMemNo(int memNo) {
		return cartDao.deleteCartByMemNo(memNo);
	}

}
