package bit.com.a.model;

import java.io.Serializable;
/*
DROP TABLE BBS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BBS;

CREATE TABLE BBS(
	SEQ NUMBER(8) PRIMARY KEY,
	-- +되서 증가되기 때문에 중복 안되고 NULL이 있을 수 없다
	ID VARCHAR2(20) NOT NULL,
	-- 이 테이블에선 외래키이다 어디에 있나? MEMBER 테이블에
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
ADD CONSTRAINT FK_BBS_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
*/

//BBS - Bulletin Board (게시판) System
public class BbsDto implements Serializable {
	private int seq;
	private String id;

	private String title; // 제목
	private String content; // 내용
	
	private String wdate; // 작성한 날짜

	private int del; // delete의 약자
	// 게시판에 글이 삭제 되면 DB에서 삭제될 것 같지만 그렇지 않다
	// 나중에 서버 작업할 때 DB에 있는 글도 지운다
	// 게시판에는 답글과 댓글이 있다. 답글이 있다는 것은 부모글이 있다는 것
	// -- 이 글은 작성자에의해 삭제되었습니다 가 예이다
	// 지워졌는지 알 수 있는 del이 필요하다
	private int readcount; // 몇번 읽었는지

	public BbsDto() {
	}

	public BbsDto(String id, String title, String content) {
		// 글을 추가할 때 사용자가 필요한 것들
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}

}
