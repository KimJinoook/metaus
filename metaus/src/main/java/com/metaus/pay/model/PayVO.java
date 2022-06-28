package com.metaus.pay.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayVO {
	private int payNo; /* 결제번호 */
	private int memNo; /* 회원번호 */
	private String payKind; /* 결제 수단 */
	private int payPrice; /* 결제 금액 */
	private Timestamp payDate; /* 결제일 */
}
