package com.metaus.cart.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartDAO {
	int selectCartCount(CartVO vo);
	int insertCart(CartVO vo);
	List<CartVO> selectCartList(int memNo);
	int deleteCartByMemNo(int memNo, int pdNo);
	int totalCartPrice(int memNo);
}
