package com.metaus.buy.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BuyVO {
	private int buyNo; /* 구매번호 */
	private int memNo; /* 회원번호 */
	private int pdNo; /* 모델번호 */
    private Timestamp buyDate; /* 구매 날짜 */
}
