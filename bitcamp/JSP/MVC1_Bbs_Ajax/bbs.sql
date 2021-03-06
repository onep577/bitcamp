DROP TABLE BBS
CASCADE CONSTRAINTS;
--무결성도 지우자

DROP SEQUENCE SEQ_BBS;

CREATE TABLE BBS(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	
	REF NUMBER(8) NOT NULL,
	STEP NUMBER(8) NOT NULL,
	DEPTH NUMBER(8) NOT NULL,
	
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	WDATE DATE NOT NULL,
	PARENT NUMBER(8) NOT NULL,
	
	DEL NUMBER(1) NOT NULL,
	READCOUNT NUMBER(8) NOT NULL	
);

CREATE SEQUENCE SEQ_BBS
START WITH 1
INCREMENT BY 1;

ALTER TABLE BBS
ADD CONSTRAINT FK_BBS_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

SELECT * FROM BBS;






SELECT SEQ, ID, REF, STEP, DEPTH,
		TITLE, CONTENT, WDATE, PARENT, 
		DEL, READCOUNT
FROM 
	(SELECT ROW_NUMBER()OVER(ORDER BY REF DESC, STEP ASC) AS RNUM, 
		SEQ, ID, REF, STEP, DEPTH,
		TITLE, CONTENT, WDATE, PARENT,
		DEL, READCOUNT
	FROM BBS
	ORDER BY REF DESC, STEP ASC) A
	
WHERE RNUM >= 1 and RNUM <= 10











