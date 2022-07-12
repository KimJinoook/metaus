package com.metaus.common;

public interface ConstUtil {
	//게시판 페이징 관련 상수
	public static final int RECORD_COUNT=2;
	int BLOCKSIZE=5;
	
	//메세지 페이징 관련 상수
	int MESSEAGE_RECORD_COUNT=15;

	//파일 업로드 관련 상수
	String FILE_UPLOAD_TYPE="test";   //테스트시
	//String FILE_UPLOAD_TYPE="deploy"; //배포시
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1;  //자료실 업로드
	int UPLOAD_IMAGE_FLAG=2; //상품 등록시 이미지 업로드
	int UPLOAD_MESSAGE_FLAG=3; //메세지 전송시 파일 저장
	int UPLOAD_MEMBER_PROFILE_FLAG=4; //일반회원 프로필 사진
	int UPLOAD_COMPANY_PROFILE_FLAG=5; //기업회원 기업 로고
	int UPLOAD_PORTFOLIO_FLAG=6; //포트폴리오 첨부파일
	int UPLOAD_RECRUIT_FLAG=7; //기업 의뢰 첨부파일
	int UPLOAD_PRODUCT_FLAG=8; //모델링 상품 첨부파일
	int UPLOAD_MANAGER_PROFILE_FLAG=9; //관리자 프로필 첨부파일
	
	
	//자료실 - 파일 저장 경로 - 게시판
	String FILE_UPLOAD_PATH="pds_upload"; 
	String FILE_UPLOAD_PATH_TEST=/*"/img_upload";*/
	  //"C:\\Users\\EZEN\\git\\metaus\\metaus\\src\\main\\resources\\static\\img_upload";
			  //"C:\\Users\\USER\\Documents\\GitHub\\metaus\\metaus\\src\\main\\resources\\static\\img_upload";
			  "src/main/resources/static/img_upload";

	 
	//메세지 - 첨부파일 저장 경로
	String ATTACHMENT_FILE_UPLOAD_PATH="message_attachment";
	//String ATTACHMENT_FILE_UPLOAD_PATH_TEST="C:\\Users\\hanym\\git\\metaus\\metaus\\src\\main\\resources\\static\\message_attachment";
	String ATTACHMENT_FILE_UPLOAD_PATH_TEST="src/main/resources/static/message_attachment";
	
	//일반회원 프로필사진
	String MEMBER_FILE_UPLOAD_PATH="mem_profile";
	String MEMBER_FILE_UPLOAD_PATH_TEST="src/main/resources/static/mem_profile";
	
	//기업회원 로고
	String COMPANY_FILE_UPLOAD_PATH="com_profile";
	String COMPANY_FILE_UPLOAD_PATH_TEST="src/main/resources/static/com_profile";
	
	//포트폴리오 첨부파일
	String PORTFOLIO_FILE_UPLOAD_PATH="portfolio";
	String PORTFOLIO_FILE_UPLOAD_PATH_TEST="src/main/resources/static/gltfmodel";
	
	//기업의뢰 첨부파일
	String RECRUIT_FILE_UPLOAD_PATH="recruit";
	String RECRUIT_FILE_UPLOAD_PATH_TEST="src/main/resources/static/recruit";
	
	//모델링 상품 첨부파일
	String PRODUCT_FILE_UPLOAD_PATH="product";
	String PRODUCT_FILE_UPLOAD_PATH_TEST="src/main/resources/static/product";

	//관리자 프로필사진
	String MANAGER_FILE_UPLOAD_PATH="manager_profile";
	String MANAGER_FILE_UPLOAD_PATH_TEST="src/main/resources/static/manager_profile";
		
		
	//관리자 페이지 - 상품 등록시 상품 이미지 저장 경로
	/*
	 * String IMAGE_FILE_UPLOAD_PATH="pd_images"; String
	 * IMAGE_FILE_UPLOAD_PATH_TEST=
	 * "C:\\lecture\\workspace_list\\spboot_ws\\springherb\\src\\main\\resources\\static\\pd_images";
	 */
	
	///
	
	
	 
	
	
}
