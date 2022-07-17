package com.metaus.request.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.metaus.common.SearchVO;
import com.metaus.member.model.CompanyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RequestServiceImpl implements RequestService {
	private final RequestDAO requestDao;
	
	public int insertRequest(RequestVO vo) {
		int cnt= requestDao.insertRequest(vo);
		
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectAll(SearchVO searchVo) {
		return requestDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return requestDao.selectTotalRecord(searchVo);
	}

	@Override
	public int insertRequestAtc(RequestAtcVO requestAtcVo) {
		return requestDao.insertRequestAtc(requestAtcVo);
	}

	@Override
	public List<RequestAtcVO> selectRequestAtc() {
		return requestDao.selectRequestAtc();
	}

	@Override
	public List<RequestVO> selectRequest(SearchVO searchVo) {
		return requestDao.selectRequest(searchVo);
	}

	@Override
	public List<CompanyVO> selectCom() {
		return requestDao.selectCom();
	}

	@Override
	public RequestVO selectRequestDetail(int recNo) {
		return requestDao.selectRequestDetail(recNo);
	}

	@Override
	public int requestDelete(int recNo) {
		return requestDao.requestDelete(recNo);
	}

	@Override
	public RequestVO selectByRequestNo(int recNo) {
		return requestDao.selectByRequestNo(recNo);
	}

	@Override
	public RequestAtcVO selectByrecfileNo(int recfileNo) {
		return requestDao.selectByrecfileNo(recfileNo);
	}

	@Override
	public int updateRequest(RequestVO vo) {
		return requestDao.updateRequest(vo);
	}

	@Override
	public int updateRequestAtc(RequestAtcVO requestAtcVo) {
		return requestDao.updateRequestAtc(requestAtcVo);
	}

	@Override
	public int insertScrap(ScrapVO scrapVo) {
		return requestDao.insertScrap(scrapVo);
	}

	@Override
	public int insertRecpre(RecpreVO recpreVo) {
		return requestDao.insertRecpre(recpreVo);
	}

	@Override
	public RequestAtcVO selectByrecfileRecNo(int recNo) {
		return requestDao.selectByrecfileRecNo(recNo);
	}

	@Override
	public List<ScrapVO> selectScrapBymemNo(int memNo) {
		return requestDao.selectScrapBymemNo(memNo);
	}

	@Override
	public List<RequestVO> selectRequestAll() {
		return requestDao.selectRequestAll();
	}

	
	
	
}
