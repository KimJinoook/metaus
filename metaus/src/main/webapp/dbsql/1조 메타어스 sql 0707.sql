ALTER TABLE fp_kakao
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_kakao
		CASCADE;
        
ALTER TABLE fp_naver
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_naver
		CASCADE;     
        
ALTER TABLE fp_facebook
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_facebook
		CASCADE;         

ALTER TABLE fp_resume
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_resume
		CASCADE;

ALTER TABLE fp_port
	DROP
		CONSTRAINT FK_fp_resume_TO_fp_port
		CASCADE;

ALTER TABLE fp_rec
	DROP
		CONSTRAINT FK_fp_com_TO_fp_rec
		CASCADE;

ALTER TABLE fp_recpre
	DROP
		CONSTRAINT FK_fp_rec_TO_fp_recpre
		CASCADE;

ALTER TABLE fp_recpre
	DROP
		CONSTRAINT FK_fp_resume_TO_fp_recpre
		CASCADE;

ALTER TABLE fp_msg
	DROP
		CONSTRAINT FK_fp_msgtype_TO_fp_msg
		CASCADE;

ALTER TABLE fp_comment
	DROP
		CONSTRAINT FK_fp_board_TO_fp_comment
		CASCADE;

ALTER TABLE fp_comment
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_comment
		CASCADE;

ALTER TABLE fp_board
	DROP
		CONSTRAINT FK_fp_boardType_TO_fp_board
		CASCADE;

ALTER TABLE fp_board
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_board
		CASCADE;

ALTER TABLE fp_boardatc
	DROP
		CONSTRAINT FK_fp_board_TO_fp_boardatc
		CASCADE;

ALTER TABLE fp_scrap
	DROP
		CONSTRAINT FK_fp_resume_TO_fp_scrap
		CASCADE;

ALTER TABLE fp_scrap
	DROP
		CONSTRAINT FK_fp_rec_TO_fp_scrap
		CASCADE;

ALTER TABLE fp_recatc
	DROP
		CONSTRAINT FK_fp_rec_TO_fp_recatc
		CASCADE;

ALTER TABLE fp_class
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_class
		CASCADE;

ALTER TABLE fp_class
	DROP
		CONSTRAINT FK_fp_classcate_TO_fp_class
		CASCADE;

ALTER TABLE fp_classcontent
	DROP
		CONSTRAINT FK_fp_class_TO_fp_classcontent
		CASCADE;

ALTER TABLE fp_pay
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_pay
		CASCADE;

ALTER TABLE fp_report
	DROP
		CONSTRAINT FK_fp_board_TO_fp_report
		CASCADE;

ALTER TABLE fp_report
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_report
		CASCADE;

ALTER TABLE fp_contact
	DROP
		CONSTRAINT FK_fp_resume_TO_fp_contact
		CASCADE;

ALTER TABLE fp_contact
	DROP
		CONSTRAINT FK_fp_rec_TO_fp_contact
		CASCADE;

ALTER TABLE fp_msgadd
	DROP
		CONSTRAINT FK_fp_msg_TO_fp_msgadd
		CASCADE;
        
ALTER TABLE fp_msgatc
	DROP
		CONSTRAINT FK_fp_msg_TO_fp_msgatc
		CASCADE;    
        
ALTER TABLE fp_pdreview
	DROP
		CONSTRAINT FK_fp_pd_TO_fp_pdreview
		CASCADE;
        
ALTER TABLE fp_pdreview
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_pdreview
		CASCADE;

ALTER TABLE fp_classatc
	DROP
		CONSTRAINT FK_fp_classcontent_TO_fp_classatc
		CASCADE;

ALTER TABLE fp_cscrap
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_cscrap
		CASCADE;

ALTER TABLE fp_cscrap
	DROP
		CONSTRAINT FK_fp_class_TO_fp_cscrap
		CASCADE;

ALTER TABLE fp_cart
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_cart
		CASCADE;

ALTER TABLE fp_cart
	DROP
		CONSTRAINT FK_fp_class_TO_fp_cart
		CASCADE;
        
ALTER TABLE fp_cart
	DROP
		CONSTRAINT FK_fp_pd_TO_fp_cart
		CASCADE;
        
ALTER TABLE fp_pd
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_pd
		CASCADE;

ALTER TABLE fp_pd
	DROP
		CONSTRAINT FK_fp_cate_TO_fp_pd
		CASCADE;

ALTER TABLE fp_buy
	DROP
		CONSTRAINT FK_fp_mem_TO_fp_buy
		CASCADE;

ALTER TABLE fp_buy
	DROP
		CONSTRAINT FK_fp_pd_TO_fp_buy
		CASCADE;

ALTER TABLE fp_mem
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_kakao
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;
        
ALTER TABLE fp_naver
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;       

ALTER TABLE fp_facebook
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;          

ALTER TABLE fp_com
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_resume
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_port
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_rec
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_recpre
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_msg
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_boardType
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_comment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_board
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_boardatc
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_scrap
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_msgtype
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;
        
ALTER TABLE fp_msgatc
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;        

ALTER TABLE fp_recatc
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_class
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_classcate
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_classcontent
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_pay
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_report
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_contact
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_msgadd
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_classatc
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_manager
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_cscrap
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_cart
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;
        
        
ALTER TABLE fp_pd
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_cate
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE fp_buy
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;
        
ALTER TABLE fp_visit
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;      
        
ALTER TABLE fp_pdreview
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 회원정보 */
DROP TABLE fp_mem 
	CASCADE CONSTRAINTS;

/* 카카오 */
DROP TABLE fp_kakao 
	CASCADE CONSTRAINTS;
    
/* 네이버 */
DROP TABLE fp_naver 
	CASCADE CONSTRAINTS;  
    
/* 페이스북 */
DROP TABLE fp_facebook 
	CASCADE CONSTRAINTS;     

/* 기업정보 */
DROP TABLE fp_com 
	CASCADE CONSTRAINTS;

/* 이력서 */
DROP TABLE fp_resume 
	CASCADE CONSTRAINTS;

/* 포트폴리오 */
DROP TABLE fp_port 
	CASCADE CONSTRAINTS;

/* 의뢰정보 */
DROP TABLE fp_rec 
	CASCADE CONSTRAINTS;

/* 지원현황 */
DROP TABLE fp_recpre 
	CASCADE CONSTRAINTS;

/* 쪽지 */
DROP TABLE fp_msg 
	CASCADE CONSTRAINTS;

/* 게시판 타입 */
DROP TABLE fp_boardType 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE fp_comment 
	CASCADE CONSTRAINTS;

/* 게시판 */
DROP TABLE fp_board 
	CASCADE CONSTRAINTS;

/* 첨부파일 */
DROP TABLE fp_boardatc 
	CASCADE CONSTRAINTS;

/* 스크랩 */
DROP TABLE fp_scrap 
	CASCADE CONSTRAINTS;

/* 쪽지 타입 */
DROP TABLE fp_msgtype 
	CASCADE CONSTRAINTS;

/* 의뢰첨부파일 */
DROP TABLE fp_recatc 
	CASCADE CONSTRAINTS;

/* 클래스 */
DROP TABLE fp_class 
	CASCADE CONSTRAINTS;

/* 클래스카테고리 */
DROP TABLE fp_classcate 
	CASCADE CONSTRAINTS;

/* 클래스컨텐츠 */
DROP TABLE fp_classcontent 
	CASCADE CONSTRAINTS;

/* 결제내역 */
DROP TABLE fp_pay 
	CASCADE CONSTRAINTS;

/* 신고게시판 */
DROP TABLE fp_report 
	CASCADE CONSTRAINTS;

/* 계약의뢰 */
DROP TABLE fp_contact 
	CASCADE CONSTRAINTS;

/* 쪽지 송수신 */
DROP TABLE fp_msgadd 
	CASCADE CONSTRAINTS;
    
/* 쪽지 첨부파일 */
DROP TABLE fp_msgatc 
	CASCADE CONSTRAINTS;    

/* 컨텐츠 첨부파일 */
DROP TABLE fp_classatc 
	CASCADE CONSTRAINTS;

/* 관리자 */
DROP TABLE fp_manager 
	CASCADE CONSTRAINTS;

/* 관심클래스 */
DROP TABLE fp_cscrap 
	CASCADE CONSTRAINTS;

/* 장바구니 */
DROP TABLE fp_cart 
	CASCADE CONSTRAINTS;
    
/* 모델링상품 */
DROP TABLE fp_pd 
	CASCADE CONSTRAINTS;

/* 모델링카테고리 */
DROP TABLE fp_cate 
	CASCADE CONSTRAINTS;

/* 구매상품 */
DROP TABLE fp_buy 
	CASCADE CONSTRAINTS;
    
/* 방문자수 */
DROP TABLE fp_visit 
	CASCADE CONSTRAINTS;    
    
/* 상품리뷰 */
DROP TABLE fp_pdreview 
	CASCADE CONSTRAINTS;
    

/* 회원정보 */
CREATE TABLE fp_mem (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	mem_name VARCHAR2(20) NOT NULL, /* 이름 */
	mem_id VARCHAR2(200) NOT NULL, /* IDEmail */
	mem_pw VARCHAR2(50) NOT NULL, /* PW */
	mem_nick VARCHAR2(50), /* 닉네임 */
	mem_birth VARCHAR2(20), /* 생년월일 */
	mem_tel VARCHAR2(30), /* 전화번호 */
	mem_zipcode VARCHAR2(20), /* 우편번호 */
	mem_add CLOB, /* 주소 */
	mem_add2 VARCHAR2(50), /* 상세주소 */
	mem_pic CLOB, /* 프로필사진 */
	mem_joindate DATE, /* 가입일 */
	mem_outdate DATE, /* 탈퇴일 */
	mem_cutdate DATE, /* 차단일 */
	mem_warncnt NUMBER, /* 경고수 */
	mem_lock CLOB, /* 암호키 */
	mem_kakao VARCHAR2(6), /* 카카오연동 */
    mem_naver VARCHAR2(6), /* 네이버연동 */
    mem_facebook VARCHAR2(6)
);

ALTER TABLE fp_mem
	ADD
		CONSTRAINT PK_fp_mem
		PRIMARY KEY (
			mem_no
		);

/* 카카오 */
CREATE TABLE fp_kakao (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	kakao_email VARCHAR2(200), /* 이메일 */
	kakao_name VARCHAR2(20) /* 이름 */
);

ALTER TABLE fp_kakao
	ADD
		CONSTRAINT PK_fp_kakao
		PRIMARY KEY (
			mem_no
		);
        
/* 네이버 */
CREATE TABLE fp_naver (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	naver_email VARCHAR2(200), /* 이메일 */
	naver_name VARCHAR2(20) /* 이름 */
);     

ALTER TABLE fp_naver
	ADD
		CONSTRAINT PK_fp_naver
		PRIMARY KEY (
			mem_no
		);
        
/* 페이스북 */
CREATE TABLE fp_facebook (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	facebook_email VARCHAR2(200), /* 이메일 */
	facebook_name VARCHAR2(20) /* 이름 */
);     

ALTER TABLE fp_facebook
	ADD
		CONSTRAINT PK_fp_facebook
		PRIMARY KEY (
			mem_no
		);        

/* 기업정보 */
CREATE TABLE fp_com (
	com_no NUMBER NOT NULL, /* 기업번호 */
	com_id VARCHAR2(200), /*기업아이디*/
	com_pw VARCHAR2(50), /*기업비밀번호*/
	com_name VARCHAR2(100), /* 기업이름 */
	com_preview CLOB, /* 기업소개 */
	com_pic CLOB, /* 기업로고 */
	com_ceo VARCHAR2(50), /* 대표자명 */
	com_add CLOB, /* 주소 */
	com_lati VARCHAR2(50), /* 위도 */
	com_longi VARCHAR2(50), /* 경도 */
	com_rrn VARCHAR2(50), /* 사업자 등록번호 */
	com_reccnt NUMBER, /* 의뢰 수 */
	com_tel VARCHAR2(30), /* 전화번호 */
	com_joindate DATE, /* 가입일 */
	com_outdate DATE /* 탈퇴일 */
);

ALTER TABLE fp_com
	ADD
		CONSTRAINT PK_fp_com
		PRIMARY KEY (
			com_no
		);

/* 이력서 */
CREATE TABLE fp_resume (
	mem_no NUMBER NOT NULL, /* 회원번호 */
	res_title VARCHAR2(50), /* 이력서 제목 */
	res_content CLOB, /* 이력서 내용 */
	res_time VARCHAR2(50) /* 연락가능시간 */
);

ALTER TABLE fp_resume
	ADD
		CONSTRAINT PK_fp_resume
		PRIMARY KEY (
			mem_no
		);

/* 포트폴리오 */
CREATE TABLE fp_port (
	port_no NUMBER NOT NULL, /* 포트폴리오 번호 */
	mem_no NUMBER, /* 회원번호 */
	port_title VARCHAR2(50), /* 작업제목 */
	port_filename CLOB, /* 작업사진 */
	port_originname CLOB, /* 작업사진원본 */
	port_content CLOB /* 작업내용 */
);

ALTER TABLE fp_port
	ADD
		CONSTRAINT PK_fp_port
		PRIMARY KEY (
			port_no
		);

/* 의뢰정보 */
CREATE TABLE fp_rec (
	rec_no NUMBER NOT NULL, /* 의뢰번호 */
	com_no NUMBER, /* 기업번호 */
	rec_title VARCHAR2(500), /* 의뢰제목 */
	rec_content CLOB, /* 의뢰내용 */
	rec_pay NUMBER, /* 페이 */
	rec_regdate DATE, /* 등록일 */
	rec_readcount NUMBER /* 조회수 */
);

ALTER TABLE fp_rec
	ADD
		CONSTRAINT PK_fp_rec
		PRIMARY KEY (
			rec_no
		);

/* 지원현황 */
CREATE TABLE fp_recpre (
	recpre_no NUMBER NOT NULL, /* 지원현황번호 */
	rec_no NUMBER, /* 의뢰번호 */
	mem_no NUMBER, /* 회원번호 */
	recpre_date DATE, /* 지원일 */
	recpre_content CLOB /* 지원내역 */
);

ALTER TABLE fp_recpre
	ADD
		CONSTRAINT PK_fp_recpre
		PRIMARY KEY (
			recpre_no
		);

/* 쪽지 */
CREATE TABLE fp_msg (
	msg_no NUMBER NOT NULL, /* 쪽지번호 */
	msgadd_adser VARCHAR2(50) NOT NULL, /* 보낸사람 */
	msg_title VARCHAR2(50), /* 쪽지제목 */
	msg_content CLOB, /* 쪽지내용 */
	send_date DATE DEFAULT sysdate NOT NULL, /* 보낸시간 */
	msgtype_no NUMBER /* 타입 번호 */
);

ALTER TABLE fp_msg
	ADD
		CONSTRAINT PK_fp_msg
		PRIMARY KEY (
			msg_no
		);

/* 게시판 타입 */
CREATE TABLE fp_boardType (
	btype_no NUMBER NOT NULL, /* 타입 번호 */
	btype_name VARCHAR2(100), /* 타입 이름 */
	btype_manager VARCHAR2(6), /* 관리자전용 */
	btype_reply VARCHAR2(6) /* 답변가능 */
);

ALTER TABLE fp_boardType
	ADD
		CONSTRAINT PK_fp_boardType
		PRIMARY KEY (
			btype_no
		);

/* 댓글 */
CREATE TABLE fp_comment (
	cmt_no NUMBER NOT NULL, /* 댓글 번호 */
	cmt_regdate DATE, /* 작성일 */
	cmt_content VARCHAR2(2000), /* 내용 */
	board_no NUMBER, /* 글 번호 */
	mem_no NUMBER, /* 회원번호 */
	cmt_groupNo NUMBER DEFAULT 0, /* 그룹번호 */
	cmt_step NUMBER DEFAULT 0, /* 글 단계 */
	cmt_sortNo NUMBER DEFAULT 0, /* 글 정렬순서 */
	cmt_delFlag CHAR DEFAULT 'N' /* 삭제 */
);

ALTER TABLE fp_comment
	ADD
		CONSTRAINT PK_fp_comment
		PRIMARY KEY (
			cmt_no
		);

/* 게시판 */
CREATE TABLE fp_board (
	board_no NUMBER NOT NULL, /* 글 번호 */
	mem_no NUMBER, /* 회원번호 */
	board_title VARCHAR2(100), /* 제목 */
	board_regdate DATE DEFAULT sysdate, /* 작성일 */
	board_readcount NUMBER DEFAULT 0, /* 조회수 */
	board_content CLOB, /* 내용 */
	board_groupNo NUMBER DEFAULT 0, /* 그룹번호 */
	board_step NUMBER DEFAULT 0, /* 글 단계 */
	board_sortNo NUMBER DEFAULT 0, /* 글 정렬순서 */
	board_delFlag CHAR DEFAULT 'N', /* 삭제 */
	board_report NUMBER, /* 신고수 */
	btype_no NUMBER /* 타입 번호 */
);

ALTER TABLE fp_board
	ADD
		CONSTRAINT PK_fp_board
		PRIMARY KEY (
			board_no
		);

/* 첨부파일 */
CREATE TABLE fp_boardatc (
	bfile_no NUMBER NOT NULL, /* 파일번호 */
	board_no NUMBER, /* 글 번호 */
	bfile_filename CLOB, /* 파일명 */
	bfile_originname CLOB, /* 원본파일명 */
	bfile_filesize number /* 파일사이즈 */
);

ALTER TABLE fp_boardatc
	ADD
		CONSTRAINT PK_fp_boardatc
		PRIMARY KEY (
			bfile_no
		);

/* 스크랩 */
CREATE TABLE fp_scrap (
	scrap_no NUMBER NOT NULL, /* 스크랩번호 */
	mem_no NUMBER, /* 회원번호 */
	rec_no NUMBER /* 의뢰번호 */
);

ALTER TABLE fp_scrap
	ADD
		CONSTRAINT PK_fp_scrap
		PRIMARY KEY (
			scrap_no
		);

/* 쪽지 타입 */
CREATE TABLE fp_msgtype (
	msgtype_no NUMBER NOT NULL, /* 타입 번호 */
	msgtype_name VARCHAR2(50) /* 타입 이름 */
);

ALTER TABLE fp_msgtype
	ADD
		CONSTRAINT PK_fp_msgtype
		PRIMARY KEY (
			msgtype_no
		);

/* 의뢰첨부파일 */
CREATE TABLE fp_recatc (
	recfile_no NUMBER NOT NULL, /* 의뢰첨부번호 */
	rec_no NUMBER, /* 의뢰번호 */
	recfile_filename CLOB, /* 파일명 */
	recfile_originname CLOB /* 원본파일명 */
);

ALTER TABLE fp_recatc
	ADD
		CONSTRAINT PK_fp_recatc
		PRIMARY KEY (
			recfile_no
		);


/* 결제내역 */
CREATE TABLE fp_pay (
	pay_no NUMBER NOT NULL, /* 결제번호 */
	mem_no NUMBER, /* 회원번호 */
	pay_kind VARCHAR2(50), /* 결제 수단 */
	pay_price NUMBER, /* 결제 금액 */
	pay_date DATE default sysdate/* 결제일 */
);

ALTER TABLE fp_pay
	ADD
		CONSTRAINT PK_fp_pay
		PRIMARY KEY (
			pay_no
		);

/* 신고게시판 */
CREATE TABLE fp_report (
	report_no NUMBER NOT NULL, /* 신고 번호 */
	mem_no NUMBER, /* 회원번호 */
	board_no NUMBER, /* 글 번호 */
	report_date DATE /* 처리일자 */
);

ALTER TABLE fp_report
	ADD
		CONSTRAINT PK_fp_report
		PRIMARY KEY (
			report_no
		);

/* 계약의뢰 */
CREATE TABLE fp_contact (
	rec_no NUMBER NOT NULL, /* 의뢰번호 */
	mem_no NUMBER, /* 회원번호 */
	con_pay NUMBER, /* 계약페이 */
	con_donedate DATE /* 완료일 */
);

ALTER TABLE fp_contact
	ADD
		CONSTRAINT PK_fp_contact
		PRIMARY KEY (
			rec_no
		);

/* 쪽지 송수신 */
CREATE TABLE fp_msgadd (
	msgadd_no NUMBER NOT NULL, /* 송수신번호 */
	msg_no NUMBER NOT NULL, /* 쪽지번호 */
	msgadd_adsee VARCHAR2(50) NOT NULL, /* 받는사람 */
	msgadd_date DATE, /* 읽은시간 */
	star_flag VARCHAR2(10) DEFAULT 'N', /* 별표 플래그 */
	temporary_flag VARCHAR2(10) DEFAULT 'N', /* 임시 플래그 */
	spam_flag VARCHAR2(10) DEFAULT 'N', /* 스팸 플래그 */
	trash_flag VARCHAR2(10) DEFAULT 'N' /* 휴지통 플래그 */
);

ALTER TABLE fp_msgadd
	ADD
		CONSTRAINT PK_fp_msgadd
		PRIMARY KEY (
			msgadd_no
		);
        
/* 쪽지 첨부파일 */
CREATE TABLE fp_msgatc (
	mfile_no NUMBER NOT NULL, /* 파일번호 */
	msg_no NUMBER NOT NULL, /* 쪽지번호 */
	mfile_filename CLOB, /* 파일명 */
	mfile_originname CLOB, /* 원본파일명 */
	mfile_filesize CLOB /* 파일사이즈 */
);

ALTER TABLE fp_msgatc
	ADD
		CONSTRAINT PK_fp_msgatc
		PRIMARY KEY (
			mfile_no
		);        



/* 관리자 */
CREATE TABLE fp_manager (
	manager_no NUMBER NOT NULL, /* 관리자번호 */
	manager_id VARCHAR2(50), /* 아이디 */
	manager_name VARCHAR2(20), /* 이름 */
	manager_pwd VARCHAR2(50), /* 비밀번호 */
	manager_regdate DATE, /* 등록일 */
    manager_pic CLOB,
    manager_tel VARCHAR2(30)
);

ALTER TABLE fp_manager
	ADD
		CONSTRAINT PK_fp_manager
		PRIMARY KEY (
			manager_no
		);


/* 장바구니 */
CREATE TABLE fp_cart (
	cart_no NUMBER NOT NULL, /* 장바구니번호 */
	mem_no NUMBER, /* 회원번호 */
	pd_no NUMBER /* 모델번호 */
);

ALTER TABLE fp_cart
	ADD
		CONSTRAINT PK_fp_cart
		PRIMARY KEY (
			cart_no
		);


/* 모델링상품 */
CREATE TABLE fp_pd (
	pd_no NUMBER NOT NULL, /* 모델번호 */
	cate_no NUMBER, /* 카테고리번호 */
	mem_no NUMBER, /* 회원번호 */
	pd_name VARCHAR2(200), /* 모델명 */
	pd_pre CLOB, /* 모델소개 */
	pd_filename CLOB, /* 모델파일명 */
	pd_originname CLOB, /* 모델원본파일명 */
	pd_filesize NUMBER, /* 모델파일사이즈 */
    pd_price number, /* 모델 금액 */
	pd_buycnt NUMBER default 0, /* 구매수 */
    pd_totalreview number default 0 /* 리뷰점수 */
);

ALTER TABLE fp_pd
	ADD
		CONSTRAINT PK_fp_pd
		PRIMARY KEY (
			pd_no
		);

/* 모델링카테고리 */
CREATE TABLE fp_cate (
	cate_no NUMBER NOT NULL, /* 카테고리번호 */
	cate_name VARCHAR2(200) /* 카테고리명 */
);

ALTER TABLE fp_cate
	ADD
		CONSTRAINT PK_fp_cate
		PRIMARY KEY (
			cate_no
		);

/* 구매상품 */
CREATE TABLE fp_buy (
    buy_no NUMBER NOT NULL, /* 구매번호 */
	mem_no NUMBER NOT NULL, /* 회원번호 */
	pd_no NUMBER, /* 모델번호 */
    buy_date DATE default sysdate
);

ALTER TABLE fp_buy
	ADD
		CONSTRAINT PK_fp_buy
		PRIMARY KEY (
			buy_no
		);
        
/* 방문자수 */
CREATE TABLE fp_visit (
    visit_no NUMBER NOT NULL, /* 방문번호 */
	visit_date DATE NOT NULL /* 방문일자 */
);

ALTER TABLE fp_visit
	ADD
		CONSTRAINT PK_fp_visit
		PRIMARY KEY (
			visit_no
		);        

/* 상품리뷰 */
CREATE TABLE fp_pdreview (
	review_no NUMBER NOT NULL, /* 리뷰번호 */
	pd_no NUMBER, /* 모델번호 */
	mem_no NUMBER, /* 회원번호 */
	review_content CLOB, /* 리뷰 */
	review_score NUMBER default 0, /* 평점 */
	review_regdate DATE default sysdate /* 등록일 */
);

ALTER TABLE fp_pdreview
	ADD
		CONSTRAINT PK_fp_pdreview
		PRIMARY KEY (
			review_no
		);


ALTER TABLE fp_kakao
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_kakao
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);
        
ALTER TABLE fp_naver
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_naver
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);    
        
ALTER TABLE fp_facebook
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_facebook
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);         

ALTER TABLE fp_resume
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_resume
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);

ALTER TABLE fp_port
	ADD
		CONSTRAINT FK_fp_resume_TO_fp_port
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_resume (
			mem_no
		)on delete cascade;

ALTER TABLE fp_rec
	ADD
		CONSTRAINT FK_fp_com_TO_fp_rec
		FOREIGN KEY (
			com_no
		)
		REFERENCES fp_com (
			com_no
		);

ALTER TABLE fp_recpre
	ADD
		CONSTRAINT FK_fp_rec_TO_fp_recpre
		FOREIGN KEY (
			rec_no
		)
		REFERENCES fp_rec (
			rec_no
		)on delete cascade;

ALTER TABLE fp_recpre
	ADD
		CONSTRAINT FK_fp_resume_TO_fp_recpre
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_resume (
			mem_no
		);

ALTER TABLE fp_msg
	ADD
		CONSTRAINT FK_fp_msgtype_TO_fp_msg
		FOREIGN KEY (
			msgtype_no
		)
		REFERENCES fp_msgtype (
			msgtype_no
		);

ALTER TABLE fp_comment
	ADD
		CONSTRAINT FK_fp_board_TO_fp_comment
		FOREIGN KEY (
			board_no
		)
		REFERENCES fp_board (
			board_no
		)on delete cascade;

ALTER TABLE fp_comment
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_comment
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);

ALTER TABLE fp_board
	ADD
		CONSTRAINT FK_fp_boardType_TO_fp_board
		FOREIGN KEY (
			btype_no
		)
		REFERENCES fp_boardType (
			btype_no
		);

ALTER TABLE fp_board
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_board
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);

ALTER TABLE fp_boardatc
	ADD
		CONSTRAINT FK_fp_board_TO_fp_boardatc
		FOREIGN KEY (
			board_no
		)
		REFERENCES fp_board (
			board_no
		)on delete cascade;

ALTER TABLE fp_scrap
	ADD
		CONSTRAINT FK_fp_resume_TO_fp_scrap
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_resume (
			mem_no
		);

ALTER TABLE fp_scrap
	ADD
		CONSTRAINT FK_fp_rec_TO_fp_scrap
		FOREIGN KEY (
			rec_no
		)
		REFERENCES fp_rec (
			rec_no
		)on delete cascade;

ALTER TABLE fp_recatc
	ADD
		CONSTRAINT FK_fp_rec_TO_fp_recatc
		FOREIGN KEY (
			rec_no
		)
		REFERENCES fp_rec (
			rec_no
		)on delete cascade;



ALTER TABLE fp_pay
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_pay
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);

ALTER TABLE fp_report
	ADD
		CONSTRAINT FK_fp_board_TO_fp_report
		FOREIGN KEY (
			board_no
		)
		REFERENCES fp_board (
			board_no
		)on delete cascade;

ALTER TABLE fp_report
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_report
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);

ALTER TABLE fp_contact
	ADD
		CONSTRAINT FK_fp_resume_TO_fp_contact
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_resume (
			mem_no
		);

ALTER TABLE fp_contact
	ADD
		CONSTRAINT FK_fp_rec_TO_fp_contact
		FOREIGN KEY (
			rec_no
		)
		REFERENCES fp_rec (
			rec_no
		)on delete cascade;

ALTER TABLE fp_msgadd
	ADD
		CONSTRAINT FK_fp_msg_TO_fp_msgadd
		FOREIGN KEY (
			msg_no
		)
		REFERENCES fp_msg (
			msg_no
		);

ALTER TABLE fp_msgatc
	ADD
		CONSTRAINT FK_fp_msg_TO_fp_msgatc
		FOREIGN KEY (
			msg_no
		)
		REFERENCES fp_msg (
			msg_no
		);


ALTER TABLE fp_cart
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_cart
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);

ALTER TABLE fp_cart
	ADD
		CONSTRAINT FK_fp_pd_TO_fp_cart
		FOREIGN KEY (
			pd_no
		)
		REFERENCES fp_pd (
			pd_no
		)on delete cascade;

        
 ALTER TABLE fp_pd
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_pd
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);

ALTER TABLE fp_pd
	ADD
		CONSTRAINT FK_fp_cate_TO_fp_pd
		FOREIGN KEY (
			cate_no
		)
		REFERENCES fp_cate (
			cate_no
		);

ALTER TABLE fp_buy
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_buy
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);

ALTER TABLE fp_buy
	ADD
		CONSTRAINT FK_fp_pd_TO_fp_buy
		FOREIGN KEY (
			pd_no
		)
		REFERENCES fp_pd (
			pd_no
		)on delete cascade;       
        
        
ALTER TABLE fp_pdreview
	ADD
		CONSTRAINT FK_fp_pd_TO_fp_pdreview
		FOREIGN KEY (
			pd_no
		)
		REFERENCES fp_pd (
			pd_no
		);

ALTER TABLE fp_pdreview
	ADD
		CONSTRAINT FK_fp_mem_TO_fp_pdreview
		FOREIGN KEY (
			mem_no
		)
		REFERENCES fp_mem (
			mem_no
		);
        



--시퀀스


-- 시퀀스 삭제 생성

--일반회원 시퀀스
drop sequence fp_mem_seq;
create sequence fp_mem_seq
increment by 1
start with 1
nocache;


--포트폴리오 시퀀스
drop sequence fp_port_seq;
create sequence fp_port_seq
increment by 1
start with 1
nocache;


--기업의뢰 스크랩 시퀀스
drop sequence fp_scrap_seq;
create sequence fp_scrap_seq
increment by 1
start with 1
nocache;


--관리자 시퀀스
drop sequence fp_manager_seq;
create sequence fp_manager_seq
increment by 1
start with 1
nocache;


--게시판 타입 시퀀스
drop sequence fp_boardType_seq;
create sequence fp_boardType_seq
increment by 1
start with 1
nocache;


--게시글 시퀀스
drop sequence fp_board_seq;
create sequence fp_board_seq
increment by 1
start with 1
nocache;


--게시판 첨부파일 시퀀스
drop sequence fp_boardatc_seq;
create sequence fp_boardatc_seq
increment by 1
start with 1
nocache;


--신고 시퀀스
drop sequence fp_report_seq;
create sequence fp_report_seq
increment by 1
start with 1
nocache;


--댓글 시퀀스
drop sequence fp_comment_seq;
create sequence fp_comment_seq
increment by 1
start with 1
nocache;



--쪽지 송수신 시퀀스
drop sequence fp_msgadd_seq;
create sequence fp_msgadd_seq
increment by 1
start with 1
nocache;


--쪽지 시퀀스
drop sequence fp_msg_seq;
create sequence fp_msg_seq
increment by 1
start with 1
nocache;


--쪽지 타입 시퀀스
drop sequence fp_msgtype_seq;
create sequence fp_msgtype_seq
increment by 1
start with 1
nocache;

drop sequence fp_msgatc_seq;
create sequence fp_msgatc_seq
increment by 1
start with 1
nocache;


--기업회원 시퀀스
drop sequence fp_com_seq;
create sequence fp_com_seq
increment by 1
start with 1
nocache;



--기업 의뢰 시퀀스
drop sequence fp_rec_seq;
create sequence fp_rec_seq
increment by 1
start with 1
nocache;


--기업의뢰 첨부파일 시퀀스
drop sequence fp_recatc_seq;
create sequence fp_recatc_seq
increment by 1
start with 1
nocache;


--기업 지원현황 시퀀스
drop sequence fp_recpre_seq;
create sequence fp_recpre_seq
increment by 1
start with 1
nocache;


drop sequence fp_class_seq;




drop sequence fp_cscrap_seq;



--장바구니 시퀀스
drop sequence fp_cart_seq;
create sequence fp_cart_seq
increment by 1
start with 1
nocache;



drop sequence fp_classatc_seq;




drop sequence fp_classcontent_seq;




drop sequence fp_classcate_seq;



--결제내역 시퀀스
drop sequence fp_pay_seq;
create sequence fp_pay_seq
increment by 1
start with 1
nocache;


--상품 시퀀스
drop sequence fp_pd_seq;
create sequence fp_pd_seq
increment by 1
start with 1
nocache;

--구매상품 시퀀스
drop sequence fp_buy_seq;
create sequence fp_buy_seq
increment by 1
start with 1
nocache;

--카테고리 시퀀스
drop sequence fp_cate_seq;
create sequence fp_cate_seq
increment by 1
start with 1
nocache;

--방문자수 시퀀스
drop sequence fp_visit_seq;
create sequence fp_visit_seq
increment by 1
start with 1
nocache;


--리뷰 시퀀스
drop sequence fp_pdreview_seq;
create sequence fp_pdreview_seq
increment by 1
start with 1
nocache;


ALTER TABLE fp_rec
   ADD
        rec_content2
      clob;

ALTER TABLE fp_rec
    ADD
        rec_content3
        clob;
        
ALTER TABLE fp_rec
    ADD
        rec_web
        clob;
        
ALTER TABLE fp_rec
    ADD
        rec_twitter
        clob;
        
        commit;




select * from fp_com;

insert into fp_mem
values(0,'관리자','admin','admin','관리자',null,null,null,null,null,null,null,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'테스터','test@naver.com','1234','닉네임1','941215','01030843045','15151','서울시영등포구시흥대로','상세주소','프사경로',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'김진욱','kimjin0132@naver.com','1234','김진욱','941215','01030843045','15151','서울시영등포구시흥대로','상세주소','1.jpg',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'김태연','kimae743@gmail.com','1234','김태연','941215','01012345678','15151','서울시영등포구시흥대로','상세주소','3.png',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'박정환','dlstod789@nate.com','1234','박정환','941215','01012345678','15151','서울시영등포구시흥대로','상세주소','4.jpg',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'오충렬','dhcndduf1234@naver.com','1234','오충렬','941215','01012345678','15151','서울시영등포구시흥대로','상세주소','5.jpg',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'이소망','sky38009@naver.com','1234','이소망','941215','01012345678','15151','서울시영등포구시흥대로','상세주소','6.jpg',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'최재훈','chlwognschlw@naver.com','1234','최재훈','941215','01012345678','15151','서울시영등포구시흥대로','상세주소','7.jpg',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'한용민','hanym9191@gmail.com','1234','한용민','941215','01012345678','15151','서울시영등포구시흥대로','상세주소','8.jpg',sysdate,null,null,null,null,null,null,null);

insert into fp_com
values(fp_com_seq.nextval,'testcom','1234','테스트기업','기업프리뷰','기업사진경로','기업대표','기업주소','기업위도','기업경도','사업자등록번호',1,'기업전화번호',sysdate,null);

insert into fp_com
values(fp_com_seq.nextval,'samsung','1234','삼성','삼성입니다','samsung.png','이재용','경기도 수원시 영통구 삼성로 129','37.255557407733','127.05407180066','12-12-12',0,'02123456',sysdate,null);

insert into fp_com
values(fp_com_seq.nextval,'google','1234','구글코리아','구글 한국지사입니다','google.svg','낸시 워커','서울특별시 강남구 테헤란로 152 22층','37.500087969056','127.03612652131054','12-12-12',0,'02123456',sysdate,null);

insert into fp_com
values(fp_com_seq.nextval,'poom','1234','품어떡','품어떡 신촌점입니다','','품어떡','신촌 목화빌딩','37.55718459027301','126.941700222679','12-12-12',0,'02123456',sysdate,null);

insert into fp_com
values(fp_com_seq.nextval,'bangkok','1234','방콕익스프레스','방콕익스프레스 신촌점입니다','','방콕','신촌 gs앞','37.55716650739785','126.94157291383048','12-12-12',0,'02123456',sysdate,null);

select * from fp_rec;
insert into fp_rec
values(fp_rec_seq.nextval, 2, '갤럭시 s22 3d모델 만들어주실 분 구합니다','갤럭시 s22 출시 홍보를 위해 3d모델 만들려 합니다. 실력있는 크리에이터 모집중입니다',150000,sysdate,0,'','','','');
select * from fp_rec;
insert into fp_rec
values(fp_rec_seq.nextval, 4, '품어떡 메인메뉴 모델 만들어주실 분 구합니다','실력있는 크리에이터 모집중입니다',150000,sysdate,0,'','','','');
insert into fp_rec
values(fp_rec_seq.nextval, 5, '방콕익스프레스 가게 건물 만들어주실 분 구합니다','실력있는 크리에이터 모집중입니다',150000,sysdate,0,'','','','');
insert into fp_rec
values(fp_rec_seq.nextval, 3, '구글 제페토 월드 제작 크리에이터 모집','실력있는 크리에이터 모집중입니다',150000,sysdate,0,'','','','');
insert into fp_rec
values(fp_rec_seq.nextval, 2, '삼성 월드 제작 크리에이터 모집','실력있는 크리에이터 모집중입니다',150000,sysdate,0,'','','','');


select * from fp_contact;
insert into fp_contact
values(1,2,150000,null);
insert into fp_contact
values(4,2,150000,sysdate);
commit;


insert into fp_boardType
values(fp_boardType_seq.nextval,'공지사항','Y','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'FAQ','Y','N');
insert into fp_boardType
values(fp_boardType_seq.nextval,'QNA','N','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'기사','Y','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'질문게시판','N','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'공유정보게시판','N','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'개인의뢰게시판','N','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'자유게시판','N','Y');

insert into fp_cate
values(fp_cate_seq.nextval, '동물');
insert into fp_cate
values(fp_cate_seq.nextval, '인물');
insert into fp_cate
values(fp_cate_seq.nextval, '가구');
insert into fp_cate
values(fp_cate_seq.nextval, '예술');
insert into fp_cate
values(fp_cate_seq.nextval, '탈것');
insert into fp_cate
values(fp_cate_seq.nextval, '캐릭터');
insert into fp_cate
values(fp_cate_seq.nextval, '문화');
insert into fp_cate
values(fp_cate_seq.nextval, '패션');
insert into fp_cate
values(fp_cate_seq.nextval, '음식');
insert into fp_cate
values(fp_cate_seq.nextval, '건물');
insert into fp_cate
values(fp_cate_seq.nextval, '자연');
insert into fp_cate
values(fp_cate_seq.nextval, '소품');
insert into fp_cate
values(fp_cate_seq.nextval, '과학');
insert into fp_cate
values(fp_cate_seq.nextval, '스포츠');

commit;
select * from fp_pd;
insert into fp_pd(pd_no, cate_no, mem_no, pd_name, pd_pre, pd_filename, pd_price, pd_buycnt, pd_totalreview)
values(fp_pd_seq.nextval,1,1,'시바견','시바견입니다','2.zip',3500,30,15);
insert into fp_pd(pd_no, cate_no, mem_no, pd_name, pd_pre, pd_filename, pd_price, pd_buycnt, pd_totalreview)
values(fp_pd_seq.nextval,10,2,'화장실','화장실입니다','1.zip',3500, 40,10);
insert into fp_pd(pd_no, cate_no, mem_no, pd_name, pd_pre, pd_filename, pd_price, pd_buycnt, pd_totalreview)
values(fp_pd_seq.nextval,6,1,'귀여운 소녀','귀여운 소녀입니다','kawai.zip',3500, 278,15);
insert into fp_pd(pd_no, cate_no, mem_no, pd_name, pd_pre, pd_filename, pd_price, pd_buycnt, pd_totalreview)
values(fp_pd_seq.nextval,12,1,'삼지창','들면 멋있음','trident.zip',3500, 40,15);

select * from fp_pdreview;
insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,1, 2,'아주 귀여워요 키우고싶어요.', 5);
insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,1, 3,'저희집 강아지랑 닮아서 기분이 좋아요.', 5);
insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,1, 4,'잘 쓰겠습니다. 다른 댕댕이도 만들어주세요.', 5);

insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,2, 5,'멋집니다. 굿', 5);
insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,2, 6,'여기서 살아도 될것같아요.', 5);

insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,3, 7,'제일 맘에들어요.', 5);
insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,3, 8,'꼬리가 인상적', 5);
insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,3, 6,'아 졸귀탱 키우고싶다ㅠㅠ', 5);

insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,4, 5,'색감이 좋네요.', 5);
insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,4, 6,'떡볶이 찍어먹을때 정말 좋아요.', 5);
insert into fp_pdreview(review_no, pd_no, mem_no, review_content, review_score)
values(fp_pdreview_seq.nextval,4, 2,'아주 멋집니다. 합격', 5);

select * from fp_resume;

insert into fp_resume
values(2,'김진욱 이력서','메타버스 전문 크리에이터 김진욱 입니다. 제페토, 로블록스 모두 가능하며 분야 상관없이 3d 모델 제작 가능합니다. 유니티를 이용해 제작하며 누구보다 저렴하게 원하시는 대로 제작해드리겠습니다','09:00 ~ 18:00');

insert into fp_resume
values(3,'1','1','09:00 ~ 18:00');

insert into fp_resume
values(4,'1','1','09:00 ~ 18:00');

insert into fp_resume
values(5,'1','1','09:00 ~ 18:00');

insert into fp_resume
values(6,'1','1','09:00 ~ 18:00');

insert into fp_resume
values(7,'1','1','09:00 ~ 18:00');

insert into fp_resume
values(8,'1','1','09:00 ~ 18:00');


select * from fp_port;

insert into fp_port
values(FP_PORT_SEQ.nextval,2,'시바견','2.zip','bathroom.zip','시바견 입니다');
insert into fp_port
values(FP_PORT_SEQ.nextval,2,'화장실','1.zip','shiba.zip','화장실 입니다');
insert into fp_port
values(FP_PORT_SEQ.nextval,2,'캐릭터','human_eevee.zip','human_eevee.zip','캐릭터 입니다');
insert into fp_port
values(FP_PORT_SEQ.nextval,2,'삼지창','pirate_ship.zip','lightscale_trident.zip','삼지창 입니다');
insert into fp_port
values(FP_PORT_SEQ.nextval,3,'1','1.zip','1','1');
insert into fp_port
values(FP_PORT_SEQ.nextval,4,'1','1.zip','1','1');
insert into fp_port
values(FP_PORT_SEQ.nextval,5,'1','1.zip','1','1');
insert into fp_port
values(FP_PORT_SEQ.nextval,6,'1','1.zip','1','1');
insert into fp_port
values(FP_PORT_SEQ.nextval,7,'1','1.zip','1','1');
insert into fp_port
values(FP_PORT_SEQ.nextval,8,'1','1.zip','1','1');

insert into fp_manager
values(fp_manager_seq.nextval,'test','김진욱','1234',sysdate,'1.jpg','01030843045');

select * from fp_buy;

--insert into fp_buy
--values(fp_buy_seq.nextval,1,1,sysdate);

--insert into fp_buy
--values(fp_buy_seq.nextval,1,2,'2022-06-06');

--insert into fp_buy
--values(fp_buy_seq.nextval,1,3,sysdate);

commit;
select * from fp_mem where mem_id like 'kimjin0132%';

select * from fp_manager;



--뷰 msgView
create or replace view msgView
as
select a.*, b.msgadd_no, b.msgadd_adsee, b.msgadd_date
, b.star_flag, b.temporary_flag, b.spam_flag, b.trash_flag
from fp_msg a join fp_msgadd b
on a.msg_no=b.msg_no;

--뷰 commissionView
create or replace view commissionView
as
select a.*, b.con_pay, b.con_donedate
from
(
select a.*, b.recpre_no, b.mem_no, b.recpre_date, b.recpre_content
from fp_rec a left join fp_recpre b
on a.rec_no = b.rec_no
) a left join fp_contact b
on a.rec_no = b.rec_no and a.mem_no = b.mem_no;

--뷰 memberViewByRecNo
create or replace view memberViewByRecNo
as
select a.recpre_no, a.rec_no, b.* 
from fp_recpre a join fp_mem b
on a.mem_no = b.mem_no
order by recpre_no;

--프로시져 updateStarFlag
create or replace procedure updateStarFlag
(
    p_empty_flag varchar2,
    p_msgadd_no fp_msgadd.msgadd_no%type
)
is
begin
    --비어있는 별을 눌렀으면
    if p_empty_flag='true' then
        --star_flag 'Y'로 업데이트
        update fp_msgadd
        set star_flag='Y'
        where msgadd_no=p_msgadd_no;
    else --색칠된 별을 눌렀으면
        --star_flag 'N'으로 업데이트
        update fp_msgadd
        set star_flag='N'
        where msgadd_no=p_msgadd_no;
    end if;
end;

--프로시져 updateTrashFlag
create or replace procedure updateTrashFlag
(
    p_trash_flag varchar2,
    p_msgadd_no fp_msgadd.msgadd_no%type
)
is
begin
    if p_trash_flag='N' then
        --trash_flag 'Y'로 업데이트
        update fp_msgadd
        set trash_flag='Y'
        where msgadd_no=p_msgadd_no;
    else 
        --trash_flag 'N'으로 업데이트
        update fp_msgadd
        set trash_flag='N'
        where msgadd_no=p_msgadd_no;
    end if;
end;

--프로시져 updateSpamFlag
create or replace procedure updateSpamFlag
(
    p_spam_flag varchar2,
    p_msgadd_no fp_msgadd.msgadd_no%type
)
is
begin
    if p_spam_flag='N' then
        --spam_flag 'Y'로 업데이트
        update fp_msgadd
        set spam_flag='Y'
        where msgadd_no=p_msgadd_no;
    else 
        --spam_flag 'N'으로 업데이트
        update fp_msgadd
        set spam_flag='N'
        where msgadd_no=p_msgadd_no;
    end if;
end;
commit;