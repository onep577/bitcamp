package bit.com.a.model;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
DROP TABLE SUBJECT
CASCADE CONSTRAINTS;

DROP SEQUENCE SUBJECT_SEQ;

CREATE TABLE SUBJECT(
	SEQ		NUMBER(10)		PRIMARY KEY,	-- 과목코드
	TITLE	VARCHAR2(20)	NOT NULL,		-- 시험명
	WDATE	DATE			NOT NULL,		-- 등록일
	SDATE	VARCHAR2(20)	NOT NULL,		-- 시작일
	EDATE	VARCHAR2(20)	NOT NULL		-- 종료일
);

CREATE SEQUENCE SUBJECT_SEQ
START WITH 1
INCREMENT BY 1;
*/

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Subject implements Serializable {
	private int seq;			// 과목코드
	private String title;		// 시험명
	private int itemcount;		// 질문의 갯수 10, 20
	private Date wdate;			// 등록일
	private Date sdate;			// 시작일
	private Date edate;			// 종료일
	
	public Subject(String title, Date sdate, Date edate) {
		super();
		this.title = title;
		this.sdate = sdate;
		this.edate = edate;
	}
	
}
