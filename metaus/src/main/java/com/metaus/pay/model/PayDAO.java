package com.metaus.pay.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PayDAO {
	int insertPay(PayVO vo);
}
