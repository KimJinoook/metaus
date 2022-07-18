package com.metaus.cart.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartServiceimpl implements CartService{	
	private final CartDAO cartDao;	
		
	@Override
	public int insertCart(CartVO vo) {
		int count=cartDao.selectCartCount(vo);
		int cnt=0;
		if(count>0) {
			//해당 상품이 장바구니에 이미 존재하면 등록안함			
		}else {
			//존재하지 않으면 입력
			cnt=cartDao.insertCart(vo);
		}
		
		return cnt;
	}

	@Override
	public List<CartVO> selectCartList(int memNo) {
		return cartDao.selectCartList(memNo);
	}

	@Override
	public int deleteCartByMemNo(int memNo, int pdNo) {
		return cartDao.deleteCartByMemNo(memNo, pdNo);
	}

	@Override
	public int deleteCartAllByMemNo(int memNo) {
		return cartDao.deleteCartAllByMemNo(memNo);
	}

	@Override
	public int selectBuyCount(int memNo, int pdNo) {
		return cartDao.selectBuyCount(memNo, pdNo);
	}

}
