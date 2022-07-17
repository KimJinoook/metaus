package com.metaus.request.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.metaus.common.SearchVO;
import com.metaus.member.model.CompanyVO;

import lombok.RequiredArgsConstructor;

public interface RequestService {
	int insertRequest(RequestVO vo);
	List<Map<String, Object>> selectAll(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	int insertRequestAtc(RequestAtcVO requestAtcVo);
	List<RequestAtcVO> selectRequestAtc();
	List<RequestVO> selectRequest(SearchVO searchVo);
	List<CompanyVO> selectCom();
	RequestVO selectRequestDetail(int recNo);
	int requestDelete(int recNo);
	RequestVO selectByRequestNo(int recNo);
	RequestAtcVO selectByrecfileNo(int recfileNo);
	int updateRequest(RequestVO vo);
	int updateRequestAtc(RequestAtcVO requestAtcVo);
	int insertScrap(ScrapVO scrapVo);
	int insertRecpre(RecpreVO recpreVo);
	RequestAtcVO selectByrecfileRecNo(int recNo);
	List<ScrapVO> selectScrapBymemNo(int memNo);
	List<RequestVO> selectRequestAll();
}
