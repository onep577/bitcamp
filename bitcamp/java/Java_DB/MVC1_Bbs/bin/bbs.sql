DROP TABLE BBS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BBS;

CREATE TABLE BBS(
	SEQ NUMBER(8) PRIMARY KEY, -- +되서 증가되기 때문에 중복 안되고 NULL이 있을 수 없다
	ID VARCHAR2(20) NOT NULL, -- 이 테이블에선 외래키이다 어디에 있나? MEMBER 테이블에
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	WDATE DATE NOT NULL,
	DEL NUMBER(1) NOT NULL,
	READCOUNT NUMBER(8) NOT NULL	
);

CREATE SEQUENCE SEQ_BBS
START WITH 1
INCREMENT BY 1;

ALTER TABLE BBS
ADD CONSTRAINT FK_BBS_ID FOREIGN KEY(ID) -- 여기서 아이디는 BBS 테이블 ID
REFERENCES MEMBER(ID); -- 여기서 아이디는 MEMBER 테이블 ID이다


TEST_SEQ.NEXTVAL
		.CURRENT

SELECT * FROM BBS;