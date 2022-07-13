package com.metaus.commission.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.commission.model.CommissionService;
import com.metaus.common.ConstUtil;
import com.metaus.common.PaginationInfo;
import com.metaus.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/commission")
public class CompanyComController {
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyComController.class);
	
	private final CommissionService commissionService;
	
	public void addModelToComList(HttpSession session
			, String searchKeyword, int currentPage, ModelMap model){
		String comId = (String) session.getAttribute("comId");
		int comNo = commissionService.selectComNoByComId(comId);
		
		//페이징 처리
		Map<String, Object> parmaMap = new HashMap<>();
		parmaMap.put("comNo", comNo);
		
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.COMMISSION_RECORD_COUNT);
		pagingInfo.setCurrentPage(currentPage);

		//[2] map에 페이징 처리 관련 변수 셋팅
		int firstRecordIndex = pagingInfo.getFirstRecordIndex();
		int recordCountPerPage = pagingInfo.getRecordCountPerPage();
		parmaMap.put("firstRecordIndex", firstRecordIndex);
		parmaMap.put("recordCountPerPage", recordCountPerPage);

		//totalRecord개수 구하기
		int totalRecord = commissionService.getComCommissionNo(comNo);
		logger.info("글목록 totalRecord={}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);
		
		//등록한 의뢰 목록
		List<Map<String, Object>> list = commissionService.selectComCommission(parmaMap);
		logger.info("마이페이지 - 기업회원 의뢰 목록 조회 결과, list.size={}", list.size());
		
		//map에 지원자수 삽입, 계약플래그 삽입
		for(Map<String, Object> map : list) {
			int recNo= Integer.parseInt(String.valueOf(map.get("REC_NO")));
			int applicantNo = commissionService.getApplicantNoByRecNo(recNo);
			map.put("applicantNo", applicantNo);
			
			//계약된 의뢰 목록
			List<Map<String, Object>> contractedList = commissionService.selectContractedComCom(comNo);
			
			String conFlag = "recruiting";
			for(Map<String, Object> contractedMap : contractedList) {
				int conRecNo= Integer.parseInt(String.valueOf(contractedMap.get("REC_NO")));
				Timestamp conDoneDate = (Timestamp) contractedMap.get("CON_DONEDATE");
				
				if(recNo == conRecNo) {
					conFlag = "contracted";
					if(conDoneDate != null) {
						conFlag ="done";
						break;
					}
				}
			}
			
			map.put("conFlag", conFlag);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@RequestMapping("/companyComList")
	public String commissionList(HttpSession session
			, @RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "1") int currentPage, ModelMap model) {
		addModelToComList(session, searchKeyword, currentPage, model);
		
		return "/commission/companyComList";
	}
	
	@RequestMapping("/ajaxCompanyComList")
	public String ajaxCompanyComList(HttpSession session
			, @RequestParam(required = false) String searchKeyword
			, @RequestParam(defaultValue = "1") int currentPage, ModelMap model) {
		addModelToComList(session, searchKeyword, currentPage, model);
		
		return "/commission/ajaxCompanyComList";
	}
	
}
