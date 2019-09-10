package bit.com.a.model;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
DROP TABLE VOTER
CASCADE CONSTRAINTS;

DROP SEQUENCE VOTER_SEQ;

CREATE TABLE VOTER(
	VOTER_SEQ		NUMBER(10)		PRIMARY KEY,	-- 투표자SEQ
	SUBJECT_SEQ		VARCHAR2(50)	NOT NULL,		-- 과목SEQ
	POLLID			VARCHAR2(50)	NOT NULL,		-- 질문SEQ
	ANSWER			VARCHAR2(50)	NOT NULL,		-- 체크한 보기
	ID				VARCHAR2(20)	NOT NULL		-- 누가?
)

CREATE SEQUENCE VOTER_SEQ
START WITH 1
INCREMENT BY 1;
*/

// 투표자
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Voter implements Serializable {
	
	private int voterseq;			// 투표자 sequence
	private int subject_seq;		// 과목 sequence
	private int pollid;				// 질문	좋아하는 과일은?
	private int answer;				// 보기	(사과, 배, 바나나)
	private String id;				// 누가?

	public Voter(int subject_seq, String id) {
		super();
		this.subject_seq = subject_seq;
		this.id = id;
	}

}
