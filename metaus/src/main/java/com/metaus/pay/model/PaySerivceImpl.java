package com.metaus.pay.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PaySerivceImpl implements PayService{
	private static PayDAO payDao;

	@Override
	public int insertPay(PayVO vo) {
		return payDao.insertPay(vo);
	}
	
}
