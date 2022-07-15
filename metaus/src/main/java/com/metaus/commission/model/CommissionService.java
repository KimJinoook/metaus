package com.metaus.commission.model;

import java.util.List;
import java.util.Map;

public interface CommissionService {
	int selectComNoByComId(String comId);
	List<Map<String, Object>> selectComCommission(Map<String, Object> paramMap);
	int getApplicantNoByRecNo(int recNo);
	List<Map<String, Object>> selectContractedComCom(int comNo);
	int getComCommissionNo(int comNo);
	int deleteCommissionByRecNo(int recNo);
	int selectMemNoByRecNo(int recNo);
	int insertContractByrecNoMemNo(Map<String, Integer> map);
	int updateConDoneDateByRecNo(int recNo);
	int deleteContractByRecNo(int recNo);
}
