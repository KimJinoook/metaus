package com.metaus.commission.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommissionContractVO {
	private int recNo;
	private int memNo;
	private int conPay;
	private Timestamp conDoneDate;
}
