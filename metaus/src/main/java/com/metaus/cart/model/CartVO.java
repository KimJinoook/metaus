package com.metaus.cart.model;

import com.metaus.pd.model.PdVO;

import lombok.Data;

@Data
public class CartVO extends PdVO{
	private int cartNo; /* 장바구니번호 */
	private int memNo; /* 회원번호 */
	private int pdNo; /* 모델번호 */
}
