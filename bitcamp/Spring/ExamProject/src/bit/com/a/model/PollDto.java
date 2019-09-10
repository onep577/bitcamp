package bit.com.a.model;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
DROP TABLE POLL
CASCADE CONSTRAINTS;

DROP SEQUENCE POLL_SEQ;

CREATE TABLE POLL(
	SUBJECT_SEQ		NUMBER(10)		PRIMARY KEY,	-- 과목코드
	EXAM_SEQ		NUMBER(10)		NOT NULL,		-- 시험코드
	QUESTION		VARCHAR2(50)	NOT NULL,		-- 질문
	QUESTION_SUB	VARCHAR2(20),					-- 상세 질문
	ANSWER			VARCHAR2(10)	NOT NULL,		-- 답
	POLLTOTAL		NUMBER(10)		NOT NULL,		-- 투표한 사람 수
	TEACHER			VARCHAR2(10)	NOT NULL,		-- 출제자
	SDATE			DATE			NOT NULL,		-- 시작일
	EDATE			DATE			NOT NULL		-- 종료일
)

CREATE SEQUENCE POLL_SEQ
START WITH 1
INCREMENT BY 1;
*/

// 투표 질문
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class PollDto implements Serializable {
	private int subject_seq;		// 과목sequence
	private int exam_seq;			// sequence 1, 2, 3, 4, 5
	private String question;		// 질문 -> 좋아하는 과일은?
	private String question_sub;	// 상세질문
	private String answer;			// 답
	private int polltotal;			// 이 질문에 투표한 사람 수
	private String teacher;			// 투표 만든 사람의 id
	private Date sdate;				// 시작일
	private Date edate;				// 종료일

	// 투표 했는지 안했는지 투표했으면 pollresult로 투표 안했으면 polldetail로
	private boolean vote;

}
