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
	rec_title VARCHAR2(50), /* 의뢰제목 */
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
	msg_title VARCHAR2(50), /* 쪽지제목 */
	msgadd_adser VARCHAR2(50), /* 보낸사람 */
	msg_content CLOB, /* 쪽지내용 */
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
	cmt_content CLOB, /* 내용 */
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
	pay_date DATE /* 결제일 */
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
	msg_no NUMBER, /* 쪽지번호 */
	msgadd_adsee VARCHAR2(50), /* 받는사람 */
	msgadd_date DATE /* 읽은시간 */
);

ALTER TABLE fp_msgadd
	ADD
		CONSTRAINT PK_fp_msgadd
		PRIMARY KEY (
			msgadd_no
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
	pd_buycnt NUMBER /* 구매수 */
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
	pd_no NUMBER /* 모델번호 */
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
		)on delete cascade;




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
		);

        
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


select * from fp_com;
insert into fp_mem
values(fp_mem_seq.nextval,'테스터','test@naver.com','1234','닉네임1','941215','01030843045','15151','서울시영등포구시흥대로','상세주소','프사경로',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'김진욱','kimjin0132@naver.com','1234','닉네임1','941215','01030843045','15151','서울시영등포구시흥대로','상세주소','1.jpg',sysdate,null,null,null,null,null,null,null);

insert into fp_com
values(fp_com_seq.nextval,'testcom','1234','테스트기업','기업프리뷰','기업사진경로','기업대표','기업주소','기업위도','기업경도','사업자등록번호',1,'기업전화번호',sysdate,null);

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


insert into fp_resume
values(2,'1','1','1');

insert into fp_port
values(FP_PORT_SEQ.nextval,2,'1','2.zip','1','1');
insert into fp_port
values(FP_PORT_SEQ.nextval,2,'1','1.zip','1','1');
insert into fp_port
values(FP_PORT_SEQ.nextval,2,'1','2.zip','1','1');
insert into fp_port
values(FP_PORT_SEQ.nextval,2,'1','1.zip','1','1');

insert into fp_manager
values(fp_manager_seq.nextval,'test','김진욱','1234',sysdate,'1.jpg','01030843045');

commit;
select * from fp_mem where mem_id like 'kimjin0132%';

select * from fp_manager;