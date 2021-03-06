package com.metaus.commission.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommissionServiceImpl implements CommissionService{
	private final CommissionDAO commissionDao;
	
	@Override
	public int selectComNoByComId(String comId) {
		return commissionDao.selectComNoByComId(comId);
	}
	
	@Override
	public List<Map<String, Object>> selectComCommission(Map<String, Object> paramMap) {
		return commissionDao.selectComCommission(paramMap);
	}

	@Override
	public int getApplicantNoByRecNo(int recNo) {
		return commissionDao.getApplicantNoByRecNo(recNo);
	}

	@Override
	public List<Map<String, Object>> selectContractedComCom(int comNo) {
		return commissionDao.selectContractedComCom(comNo);
	}

	@Override
	public int getComCommissionNo(int comNo) {
		return commissionDao.getComCommissionNo(comNo);
	}

	@Override
	public int deleteCommissionByRecNo(int recNo) {
		return commissionDao.deleteCommissionByRecNo(recNo);
	}

	@Override
	public int selectMemNoByRecNo(int recNo) {
		return commissionDao.selectMemNoByRecNo(recNo);
	}

	@Override
	public int insertContractByrecNoMemNo(Map<String, Integer> map) {
		return commissionDao.insertContractByrecNoMemNo(map);
	}

	@Override
	public int updateConDoneDateByRecNo(int recNo) {
		return commissionDao.updateConDoneDateByRecNo(recNo);
	}

	@Override
	public int deleteContractByRecNo(int recNo) {
		return commissionDao.deleteContractByRecNo(recNo);
	}


}
