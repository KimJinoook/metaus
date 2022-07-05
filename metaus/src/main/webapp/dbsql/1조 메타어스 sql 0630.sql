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

/* ȸ������ */
DROP TABLE fp_mem 
	CASCADE CONSTRAINTS;

/* īī�� */
DROP TABLE fp_kakao 
	CASCADE CONSTRAINTS;
    
/* ���̹� */
DROP TABLE fp_naver 
	CASCADE CONSTRAINTS;  
    
/* ���̽��� */
DROP TABLE fp_facebook 
	CASCADE CONSTRAINTS;     

/* ������� */
DROP TABLE fp_com 
	CASCADE CONSTRAINTS;

/* �̷¼� */
DROP TABLE fp_resume 
	CASCADE CONSTRAINTS;

/* ��Ʈ������ */
DROP TABLE fp_port 
	CASCADE CONSTRAINTS;

/* �Ƿ����� */
DROP TABLE fp_rec 
	CASCADE CONSTRAINTS;

/* ������Ȳ */
DROP TABLE fp_recpre 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE fp_msg 
	CASCADE CONSTRAINTS;

/* �Խ��� Ÿ�� */
DROP TABLE fp_boardType 
	CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE fp_comment 
	CASCADE CONSTRAINTS;

/* �Խ��� */
DROP TABLE fp_board 
	CASCADE CONSTRAINTS;

/* ÷������ */
DROP TABLE fp_boardatc 
	CASCADE CONSTRAINTS;

/* ��ũ�� */
DROP TABLE fp_scrap 
	CASCADE CONSTRAINTS;

/* ���� Ÿ�� */
DROP TABLE fp_msgtype 
	CASCADE CONSTRAINTS;

/* �Ƿ�÷������ */
DROP TABLE fp_recatc 
	CASCADE CONSTRAINTS;

/* Ŭ���� */
DROP TABLE fp_class 
	CASCADE CONSTRAINTS;

/* Ŭ����ī�װ� */
DROP TABLE fp_classcate 
	CASCADE CONSTRAINTS;

/* Ŭ���������� */
DROP TABLE fp_classcontent 
	CASCADE CONSTRAINTS;

/* �������� */
DROP TABLE fp_pay 
	CASCADE CONSTRAINTS;

/* �Ű�Խ��� */
DROP TABLE fp_report 
	CASCADE CONSTRAINTS;

/* ����Ƿ� */
DROP TABLE fp_contact 
	CASCADE CONSTRAINTS;

/* ���� �ۼ��� */
DROP TABLE fp_msgadd 
	CASCADE CONSTRAINTS;

/* ������ ÷������ */
DROP TABLE fp_classatc 
	CASCADE CONSTRAINTS;

/* ������ */
DROP TABLE fp_manager 
	CASCADE CONSTRAINTS;

/* ����Ŭ���� */
DROP TABLE fp_cscrap 
	CASCADE CONSTRAINTS;

/* ��ٱ��� */
DROP TABLE fp_cart 
	CASCADE CONSTRAINTS;
    
/* �𵨸���ǰ */
DROP TABLE fp_pd 
	CASCADE CONSTRAINTS;

/* �𵨸�ī�װ� */
DROP TABLE fp_cate 
	CASCADE CONSTRAINTS;

/* ���Ż�ǰ */
DROP TABLE fp_buy 
	CASCADE CONSTRAINTS;
    

/* ȸ������ */
CREATE TABLE fp_mem (
	mem_no NUMBER NOT NULL, /* ȸ����ȣ */
	mem_name VARCHAR2(20) NOT NULL, /* �̸� */
	mem_id VARCHAR2(200) NOT NULL, /* IDEmail */
	mem_pw VARCHAR2(50) NOT NULL, /* PW */
	mem_nick VARCHAR2(50), /* �г��� */
	mem_birth VARCHAR2(20), /* ������� */
	mem_tel VARCHAR2(30), /* ��ȭ��ȣ */
	mem_zipcode VARCHAR2(20), /* �����ȣ */
	mem_add CLOB, /* �ּ� */
	mem_add2 VARCHAR2(50), /* ���ּ� */
	mem_pic CLOB, /* �����ʻ��� */
	mem_joindate DATE, /* ������ */
	mem_outdate DATE, /* Ż���� */
	mem_cutdate DATE, /* ������ */
	mem_warncnt NUMBER, /* ���� */
	mem_lock CLOB, /* ��ȣŰ */
	mem_kakao VARCHAR2(6), /* īī������ */
    mem_naver VARCHAR2(6), /* ���̹����� */
    mem_facebook VARCHAR2(6)
);

ALTER TABLE fp_mem
	ADD
		CONSTRAINT PK_fp_mem
		PRIMARY KEY (
			mem_no
		);

/* īī�� */
CREATE TABLE fp_kakao (
	mem_no NUMBER NOT NULL, /* ȸ����ȣ */
	kakao_email VARCHAR2(200), /* �̸��� */
	kakao_name VARCHAR2(20) /* �̸� */
);

ALTER TABLE fp_kakao
	ADD
		CONSTRAINT PK_fp_kakao
		PRIMARY KEY (
			mem_no
		);
        
/* ���̹� */
CREATE TABLE fp_naver (
	mem_no NUMBER NOT NULL, /* ȸ����ȣ */
	naver_email VARCHAR2(200), /* �̸��� */
	naver_name VARCHAR2(20) /* �̸� */
);     

ALTER TABLE fp_naver
	ADD
		CONSTRAINT PK_fp_naver
		PRIMARY KEY (
			mem_no
		);
        
/* ���̽��� */
CREATE TABLE fp_facebook (
	mem_no NUMBER NOT NULL, /* ȸ����ȣ */
	facebook_email VARCHAR2(200), /* �̸��� */
	facebook_name VARCHAR2(20) /* �̸� */
);     

ALTER TABLE fp_facebook
	ADD
		CONSTRAINT PK_fp_facebook
		PRIMARY KEY (
			mem_no
		);        

/* ������� */
CREATE TABLE fp_com (
	com_no NUMBER NOT NULL, /* �����ȣ */
	com_id VARCHAR2(200), /*������̵�*/
	com_pw VARCHAR2(50), /*�����й�ȣ*/
	com_name VARCHAR2(100), /* ����̸� */
	com_preview CLOB, /* ����Ұ� */
	com_pic CLOB, /* ����ΰ� */
	com_ceo VARCHAR2(50), /* ��ǥ�ڸ� */
	com_add CLOB, /* �ּ� */
	com_lati VARCHAR2(50), /* ���� */
	com_longi VARCHAR2(50), /* �浵 */
	com_rrn VARCHAR2(50), /* ����� ��Ϲ�ȣ */
	com_reccnt NUMBER, /* �Ƿ� �� */
	com_tel VARCHAR2(30), /* ��ȭ��ȣ */
	com_joindate DATE, /* ������ */
	com_outdate DATE /* Ż���� */
);

ALTER TABLE fp_com
	ADD
		CONSTRAINT PK_fp_com
		PRIMARY KEY (
			com_no
		);

/* �̷¼� */
CREATE TABLE fp_resume (
	mem_no NUMBER NOT NULL, /* ȸ����ȣ */
	res_title VARCHAR2(50), /* �̷¼� ���� */
	res_content CLOB, /* �̷¼� ���� */
	res_time VARCHAR2(50) /* �������ɽð� */
);

ALTER TABLE fp_resume
	ADD
		CONSTRAINT PK_fp_resume
		PRIMARY KEY (
			mem_no
		);

/* ��Ʈ������ */
CREATE TABLE fp_port (
	port_no NUMBER NOT NULL, /* ��Ʈ������ ��ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	port_title VARCHAR2(50), /* �۾����� */
	port_filename CLOB, /* �۾����� */
	port_originname CLOB, /* �۾��������� */
	port_content CLOB /* �۾����� */
);

ALTER TABLE fp_port
	ADD
		CONSTRAINT PK_fp_port
		PRIMARY KEY (
			port_no
		);

/* �Ƿ����� */
CREATE TABLE fp_rec (
	rec_no NUMBER NOT NULL, /* �Ƿڹ�ȣ */
	com_no NUMBER, /* �����ȣ */
	rec_title VARCHAR2(50), /* �Ƿ����� */
	rec_content CLOB, /* �Ƿڳ��� */
	rec_pay NUMBER, /* ���� */
	rec_regdate DATE, /* ����� */
	rec_readcount NUMBER /* ��ȸ�� */
);

ALTER TABLE fp_rec
	ADD
		CONSTRAINT PK_fp_rec
		PRIMARY KEY (
			rec_no
		);

/* ������Ȳ */
CREATE TABLE fp_recpre (
	recpre_no NUMBER NOT NULL, /* ������Ȳ��ȣ */
	rec_no NUMBER, /* �Ƿڹ�ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	recpre_date DATE, /* ������ */
	recpre_content CLOB /* �������� */
);

ALTER TABLE fp_recpre
	ADD
		CONSTRAINT PK_fp_recpre
		PRIMARY KEY (
			recpre_no
		);

/* ���� */
CREATE TABLE fp_msg (
	msg_no NUMBER NOT NULL, /* ������ȣ */
	msg_title VARCHAR2(50), /* �������� */
	msgadd_adser VARCHAR2(50), /* ������� */
	msg_content CLOB, /* �������� */
	msgtype_no NUMBER /* Ÿ�� ��ȣ */
);

ALTER TABLE fp_msg
	ADD
		CONSTRAINT PK_fp_msg
		PRIMARY KEY (
			msg_no
		);

/* �Խ��� Ÿ�� */
CREATE TABLE fp_boardType (
	btype_no NUMBER NOT NULL, /* Ÿ�� ��ȣ */
	btype_name VARCHAR2(100), /* Ÿ�� �̸� */
	btype_manager VARCHAR2(6), /* ���������� */
	btype_reply VARCHAR2(6) /* �亯���� */
);

ALTER TABLE fp_boardType
	ADD
		CONSTRAINT PK_fp_boardType
		PRIMARY KEY (
			btype_no
		);

/* ��� */
CREATE TABLE fp_comment (
	cmt_no NUMBER NOT NULL, /* ��� ��ȣ */
	cmt_regdate DATE, /* �ۼ��� */
	cmt_content CLOB, /* ���� */
	board_no NUMBER, /* �� ��ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	cmt_groupNo NUMBER DEFAULT 0, /* �׷��ȣ */
	cmt_step NUMBER DEFAULT 0, /* �� �ܰ� */
	cmt_sortNo NUMBER DEFAULT 0, /* �� ���ļ��� */
	cmt_delFlag CHAR DEFAULT 'N' /* ���� */
);

ALTER TABLE fp_comment
	ADD
		CONSTRAINT PK_fp_comment
		PRIMARY KEY (
			cmt_no
		);

/* �Խ��� */
CREATE TABLE fp_board (
	board_no NUMBER NOT NULL, /* �� ��ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	board_title VARCHAR2(100), /* ���� */
	board_regdate DATE DEFAULT sysdate, /* �ۼ��� */
	board_readcount NUMBER DEFAULT 0, /* ��ȸ�� */
	board_content CLOB, /* ���� */
	board_groupNo NUMBER DEFAULT 0, /* �׷��ȣ */
	board_step NUMBER DEFAULT 0, /* �� �ܰ� */
	board_sortNo NUMBER DEFAULT 0, /* �� ���ļ��� */
	board_delFlag CHAR DEFAULT 'N', /* ���� */
	board_report NUMBER, /* �Ű�� */
	btype_no NUMBER /* Ÿ�� ��ȣ */
);

ALTER TABLE fp_board
	ADD
		CONSTRAINT PK_fp_board
		PRIMARY KEY (
			board_no
		);

/* ÷������ */
CREATE TABLE fp_boardatc (
	bfile_no NUMBER NOT NULL, /* ���Ϲ�ȣ */
	board_no NUMBER, /* �� ��ȣ */
	bfile_filename CLOB, /* ���ϸ� */
	bfile_originname CLOB, /* �������ϸ� */
	bfile_filesize number /* ���ϻ����� */
);

ALTER TABLE fp_boardatc
	ADD
		CONSTRAINT PK_fp_boardatc
		PRIMARY KEY (
			bfile_no
		);

/* ��ũ�� */
CREATE TABLE fp_scrap (
	scrap_no NUMBER NOT NULL, /* ��ũ����ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	rec_no NUMBER /* �Ƿڹ�ȣ */
);

ALTER TABLE fp_scrap
	ADD
		CONSTRAINT PK_fp_scrap
		PRIMARY KEY (
			scrap_no
		);

/* ���� Ÿ�� */
CREATE TABLE fp_msgtype (
	msgtype_no NUMBER NOT NULL, /* Ÿ�� ��ȣ */
	msgtype_name VARCHAR2(50) /* Ÿ�� �̸� */
);

ALTER TABLE fp_msgtype
	ADD
		CONSTRAINT PK_fp_msgtype
		PRIMARY KEY (
			msgtype_no
		);

/* �Ƿ�÷������ */
CREATE TABLE fp_recatc (
	recfile_no NUMBER NOT NULL, /* �Ƿ�÷�ι�ȣ */
	rec_no NUMBER, /* �Ƿڹ�ȣ */
	recfile_filename CLOB, /* ���ϸ� */
	recfile_originname CLOB /* �������ϸ� */
);

ALTER TABLE fp_recatc
	ADD
		CONSTRAINT PK_fp_recatc
		PRIMARY KEY (
			recfile_no
		);


/* �������� */
CREATE TABLE fp_pay (
	pay_no NUMBER NOT NULL, /* ������ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	pay_kind VARCHAR2(50), /* ���� ���� */
	pay_price NUMBER, /* ���� �ݾ� */
	pay_date DATE /* ������ */
);

ALTER TABLE fp_pay
	ADD
		CONSTRAINT PK_fp_pay
		PRIMARY KEY (
			pay_no
		);

/* �Ű�Խ��� */
CREATE TABLE fp_report (
	report_no NUMBER NOT NULL, /* �Ű� ��ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	board_no NUMBER, /* �� ��ȣ */
	report_date DATE /* ó������ */
);

ALTER TABLE fp_report
	ADD
		CONSTRAINT PK_fp_report
		PRIMARY KEY (
			report_no
		);

/* ����Ƿ� */
CREATE TABLE fp_contact (
	rec_no NUMBER NOT NULL, /* �Ƿڹ�ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	con_pay NUMBER, /* ������� */
	con_donedate DATE /* �Ϸ��� */
);

ALTER TABLE fp_contact
	ADD
		CONSTRAINT PK_fp_contact
		PRIMARY KEY (
			rec_no
		);

/* ���� �ۼ��� */
CREATE TABLE fp_msgadd (
	msgadd_no NUMBER NOT NULL, /* �ۼ��Ź�ȣ */
	msg_no NUMBER, /* ������ȣ */
	msgadd_adsee VARCHAR2(50), /* �޴»�� */
	msgadd_date DATE /* �����ð� */
);

ALTER TABLE fp_msgadd
	ADD
		CONSTRAINT PK_fp_msgadd
		PRIMARY KEY (
			msgadd_no
		);



/* ������ */
CREATE TABLE fp_manager (
	manager_no NUMBER NOT NULL, /* �����ڹ�ȣ */
	manager_id VARCHAR2(50), /* ���̵� */
	manager_name VARCHAR2(20), /* �̸� */
	manager_pwd VARCHAR2(50), /* ��й�ȣ */
	manager_regdate DATE, /* ����� */
    manager_pic CLOB,
    manager_tel VARCHAR2(30)
);

ALTER TABLE fp_manager
	ADD
		CONSTRAINT PK_fp_manager
		PRIMARY KEY (
			manager_no
		);


/* ��ٱ��� */
CREATE TABLE fp_cart (
	cart_no NUMBER NOT NULL, /* ��ٱ��Ϲ�ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	pd_no NUMBER /* �𵨹�ȣ */
);

ALTER TABLE fp_cart
	ADD
		CONSTRAINT PK_fp_cart
		PRIMARY KEY (
			cart_no
		);


/* �𵨸���ǰ */
CREATE TABLE fp_pd (
	pd_no NUMBER NOT NULL, /* �𵨹�ȣ */
	cate_no NUMBER, /* ī�װ���ȣ */
	mem_no NUMBER, /* ȸ����ȣ */
	pd_name VARCHAR2(200), /* �𵨸� */
	pd_pre CLOB, /* �𵨼Ұ� */
	pd_filename CLOB, /* �����ϸ� */
	pd_originname CLOB, /* �𵨿������ϸ� */
	pd_filesize NUMBER, /* �����ϻ����� */
	pd_buycnt NUMBER /* ���ż� */
);

ALTER TABLE fp_pd
	ADD
		CONSTRAINT PK_fp_pd
		PRIMARY KEY (
			pd_no
		);

/* �𵨸�ī�װ� */
CREATE TABLE fp_cate (
	cate_no NUMBER NOT NULL, /* ī�װ���ȣ */
	cate_name VARCHAR2(200) /* ī�װ��� */
);

ALTER TABLE fp_cate
	ADD
		CONSTRAINT PK_fp_cate
		PRIMARY KEY (
			cate_no
		);

/* ���Ż�ǰ */
CREATE TABLE fp_buy (
    buy_no NUMBER NOT NULL, /* ���Ź�ȣ */
	mem_no NUMBER NOT NULL, /* ȸ����ȣ */
	pd_no NUMBER /* �𵨹�ȣ */
);

ALTER TABLE fp_buy
	ADD
		CONSTRAINT PK_fp_buy
		PRIMARY KEY (
			buy_no
		);
        
/* �湮�ڼ� */
CREATE TABLE fp_visit (
    visit_no NUMBER NOT NULL, /* �湮��ȣ */
	visit_date DATE NOT NULL /* �湮���� */
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
        
        
        
        



--������


-- ������ ���� ����

--�Ϲ�ȸ�� ������
drop sequence fp_mem_seq;
create sequence fp_mem_seq
increment by 1
start with 1
nocache;


--��Ʈ������ ������
drop sequence fp_port_seq;
create sequence fp_port_seq
increment by 1
start with 1
nocache;


--����Ƿ� ��ũ�� ������
drop sequence fp_scrap_seq;
create sequence fp_scrap_seq
increment by 1
start with 1
nocache;


--������ ������
drop sequence fp_manager_seq;
create sequence fp_manager_seq
increment by 1
start with 1
nocache;


--�Խ��� Ÿ�� ������
drop sequence fp_boardType_seq;
create sequence fp_boardType_seq
increment by 1
start with 1
nocache;


--�Խñ� ������
drop sequence fp_board_seq;
create sequence fp_board_seq
increment by 1
start with 1
nocache;


--�Խ��� ÷������ ������
drop sequence fp_boardatc_seq;
create sequence fp_boardatc_seq
increment by 1
start with 1
nocache;


--�Ű� ������
drop sequence fp_report_seq;
create sequence fp_report_seq
increment by 1
start with 1
nocache;


--��� ������
drop sequence fp_comment_seq;
create sequence fp_comment_seq
increment by 1
start with 1
nocache;



--���� �ۼ��� ������
drop sequence fp_msgadd_seq;
create sequence fp_msgadd_seq
increment by 1
start with 1
nocache;


--���� ������
drop sequence fp_msg_seq;
create sequence fp_msg_seq
increment by 1
start with 1
nocache;


--���� Ÿ�� ������
drop sequence fp_msgtype_seq;
create sequence fp_msgtype_seq
increment by 1
start with 1
nocache;


--���ȸ�� ������
drop sequence fp_com_seq;
create sequence fp_com_seq
increment by 1
start with 1
nocache;



--��� �Ƿ� ������
drop sequence fp_rec_seq;
create sequence fp_rec_seq
increment by 1
start with 1
nocache;


--����Ƿ� ÷������ ������
drop sequence fp_recatc_seq;
create sequence fp_recatc_seq
increment by 1
start with 1
nocache;


--��� ������Ȳ ������
drop sequence fp_recpre_seq;
create sequence fp_recpre_seq
increment by 1
start with 1
nocache;


drop sequence fp_class_seq;




drop sequence fp_cscrap_seq;



--��ٱ��� ������
drop sequence fp_cart_seq;
create sequence fp_cart_seq
increment by 1
start with 1
nocache;



drop sequence fp_classatc_seq;




drop sequence fp_classcontent_seq;




drop sequence fp_classcate_seq;



--�������� ������
drop sequence fp_pay_seq;
create sequence fp_pay_seq
increment by 1
start with 1
nocache;


--��ǰ ������
drop sequence fp_pd_seq;
create sequence fp_pd_seq
increment by 1
start with 1
nocache;

--���Ż�ǰ ������
drop sequence fp_buy_seq;
create sequence fp_buy_seq
increment by 1
start with 1
nocache;

--ī�װ� ������
drop sequence fp_cate_seq;
create sequence fp_cate_seq
increment by 1
start with 1
nocache;

--�湮�ڼ� ������
drop sequence fp_visit_seq;
create sequence fp_visit_seq
increment by 1
start with 1
nocache;


select * from fp_com;
insert into fp_mem
values(fp_mem_seq.nextval,'�׽���','test@naver.com','1234','�г���1','941215','01030843045','15151','����ÿ�������������','���ּ�','������',sysdate,null,null,null,null,null,null,null);

insert into fp_mem
values(fp_mem_seq.nextval,'������','kimjin0132@naver.com','1234','�г���1','941215','01030843045','15151','����ÿ�������������','���ּ�','1.jpg',sysdate,null,null,null,null,null,null,null);

insert into fp_com
values(fp_com_seq.nextval,'testcom','1234','�׽�Ʈ���','���������','����������','�����ǥ','����ּ�','�������','����浵','����ڵ�Ϲ�ȣ',1,'�����ȭ��ȣ',sysdate,null);

insert into fp_boardType
values(fp_boardType_seq.nextval,'��������','Y','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'FAQ','Y','N');
insert into fp_boardType
values(fp_boardType_seq.nextval,'QNA','N','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'���','Y','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'�����Խ���','N','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'���������Խ���','N','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'�����ǷڰԽ���','N','Y');
insert into fp_boardType
values(fp_boardType_seq.nextval,'�����Խ���','N','Y');

insert into fp_cate
values(fp_cate_seq.nextval, '����');
insert into fp_cate
values(fp_cate_seq.nextval, '�ι�');
insert into fp_cate
values(fp_cate_seq.nextval, '����');
insert into fp_cate
values(fp_cate_seq.nextval, '����');
insert into fp_cate
values(fp_cate_seq.nextval, 'Ż��');
insert into fp_cate
values(fp_cate_seq.nextval, 'ĳ����');
insert into fp_cate
values(fp_cate_seq.nextval, '��ȭ');
insert into fp_cate
values(fp_cate_seq.nextval, '�м�');
insert into fp_cate
values(fp_cate_seq.nextval, '����');
insert into fp_cate
values(fp_cate_seq.nextval, '�ǹ�');
insert into fp_cate
values(fp_cate_seq.nextval, '�ڿ�');
insert into fp_cate
values(fp_cate_seq.nextval, '��ǰ');
insert into fp_cate
values(fp_cate_seq.nextval, '����');
insert into fp_cate
values(fp_cate_seq.nextval, '������');


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
values(fp_manager_seq.nextval,'test','������','1234',sysdate,'1.jpg','01030843045');

commit;
select * from fp_mem where mem_id like 'kimjin0132%';

select * from fp_manager;