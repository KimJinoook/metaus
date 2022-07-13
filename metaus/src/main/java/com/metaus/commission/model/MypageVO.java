package com.metaus.commission.model;

import java.sql.Timestamp;

import com.metaus.common.SearchVO;

import lombok.Data;

@Data
public class MypageVO {
	private int memNo;
	
	private int comNo;
	private String comId;
	private String comPw;
	private String comName;
	private String comPreview;
	private String comPic;
	private String comCeo;
	private String comAdd;
	private String comLati; /* 주소 위도 */
	private String comLongi; /* 주소 경도 */
	private String comRrn; /* 사업자 등록번호 */
	private int comReccnt; /* 의뢰 수 */
	private String comTel; /* 전화번호 */
	private Timestamp comJoindate; /* 가입일 */
	private Timestamp comOutdate; /* 탈퇴일 */
	
	//의뢰정보
	private int recNo; /* 의뢰번호 */
	private String recTitle; /* 의뢰제목 */
	private String recContent; /* 의뢰내용 */
	private String recContent2;
	private String recContent3;
	private String recWeb;
	private String recTwitter;
	private int recCount;
	private int recPay; /* 페이 */
	private Timestamp recRegdate; /* 등록일 */
	private int recReadcount; /* 조회수 */
	
	//
	private int recpreNo;
	private Timestamp recpreDate;
	private String recpreContent;
	
	//의뢰 완료
	private int conPay;
	private Timestamp conDonedate;
	
	/** 검색조건 */
	private String searchCondition = "";
	
	/** 검색키워드 */
	private String searchKeyword = "";
    
	/** 검색 사용여부 */
	private String searchUseYn = "";
	
	/** 현재 페이지 */
	private int currentPage = 1;
	
	/** 현재 페이지 */
	private int btypeNo = 0;
	
    public int getBtypeNo() {
		return btypeNo;
	}

	public void setBtypeNo(int btypeNo) {
		this.btypeNo = btypeNo;
	}

	/**블럭당 보여질 페이지 수,  페이지 사이즈 */
    private int blockSize; // properties에서 설정
    
    /** 시작 인덱스 */
    private int firstRecordIndex = 1;
    
    /** 끝 인덱스 */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage; 
    
   /**
     * 검색 조건을  설정한다.
     * @param bean 검색조건
     */
    public void setSearchVO(MypageVO bean){
    	this.currentPage = bean.currentPage;
    	this.searchCondition = bean.getSearchCondition();
    	this.searchKeyword = bean.getSearchKeyword();
    	this.searchUseYn = bean.getSearchUseYn();
    	this.blockSize = bean.blockSize;
    	this.firstRecordIndex = bean.firstRecordIndex;
    	this.lastRecordIndex = bean.lastRecordIndex;
    	this.recordCountPerPage = bean.recordCountPerPage;
    }

    public String getSearchCondition() {
    	return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
    	this.searchCondition = searchCondition;
    }

    public String getSearchKeyword() {
    	return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
    	this.searchKeyword = searchKeyword;
    }

    public String getSearchUseYn() {
    	return searchUseYn;
    }

    public void setSearchUseYn(String searchUseYn) {
    	this.searchUseYn = searchUseYn;
    }

    public int getCurrentPage() {
    	return currentPage;
    }

    public void setCurrentPage(int currentPage) {
    	this.currentPage = currentPage;
    }

    public int getBlockSize() {
    	return blockSize;
    }

    public void setBlockSize(int blockSize) {
    	this.blockSize = blockSize;
    }

    public int getFirstRecordIndex() {
    	return firstRecordIndex;
    }

    public void setFirstRecordIndex(int firstRecordIndex) {
    	this.firstRecordIndex = firstRecordIndex;
    }

    public int getLastRecordIndex() {
    	return lastRecordIndex;
    }

    public void setLastRecordIndex(int lastRecordIndex) {
    	this.lastRecordIndex = lastRecordIndex;
    }

    
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
}
