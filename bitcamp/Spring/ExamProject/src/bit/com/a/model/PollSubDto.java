package bit.com.a.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
DROP TABLE POLLSUB
CASCADE CONSTRAINTS;

DROP SEQUENCE POLLSUB_SEQ;

CREATE TABLE POLLSUB(
	SUBJECT_SEQ		NUMBER(10)		NOT NULL,		-- 과목코드
	EXAM_SEQ		NUMBER(10)		NOT NULL,		-- 시험코드
	QUESTION		VARCHAR2(50)	NOT NULL,		-- 질문
	QUESTION_SUB	VARCHAR2(20),					-- 상세 질문
	ANSWER			VARCHAR2(10)	NOT NULL,		-- 답
	POLLSUB1		VARCHAR2(20)	NOT NULL,		-- 보기1
	POLLSUB2		VARCHAR2(20)	NOT NULL,		-- 보기2
	POLLSUB3		VARCHAR2(20)	NOT NULL,		-- 보기3
	POLLSUB4		VARCHAR2(20)	NOT NULL,		-- 보기4
	POLLSUBTOTAL1	NUMBER(10)		NOT NULL,		-- 1번 투표한 사람 수
	POLLSUBTOTAL2	NUMBER(10)		NOT NULL,		-- 2번 투표한 사람 수
	POLLSUBTOTAL3	NUMBER(10)		NOT NULL,		-- 3번 투표한 사람 수
	POLLSUBTOTAL4	NUMBER(10)		NOT NULL		-- 4번 투표한 사람 수
);

CREATE SEQUENCE POLLSUB_SEQ
START WITH 1
INCREMENT BY 1;
*/

// 보기들
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PollSubDto implements Serializable {
	private int subject_seq;		// 과목코드
	private int exam_seq;			// 시험코드
	private String question;		// 질문
	private String question_sub;	// 상세 질문
	private String answer_sub;		// 답
	
	private int pollsub1;			// 보기1
	private int pollsub2;			// 보기2
	private int pollsub3;			// 보기3
	private int pollsub4;			// 보기4
	private int pollsubtotal1;		// 1번 투표한 사람 수
	private int pollsubtotal2;		// 2번 투표한 사람 수
	private int pollsubtotal3;		// 3번 투표한 사람 수
	private int pollsubtotal4;		// 4번 투표한 사람 수

}
