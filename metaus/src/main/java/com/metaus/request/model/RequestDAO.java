package com.metaus.request.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.metaus.board.model.BoardAtcVO;
import com.metaus.board.model.BoardVO;
import com.metaus.common.SearchVO;
import com.metaus.member.model.CompanyVO;

@Mapper
public interface RequestDAO {
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
}
