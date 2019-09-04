package bit.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
DROP TABLE POLL
CASCADE CONSTRAINTS;

DROP SEQUENCE POLL_SEQ;

CREATE TABLE POLL(
	POLLID NUMBER NOT NULL,
	ID VARCHAR2(50) NOT NULL,
	QUESTION VARCHAR2(1000) NOT NULL,
	SDATE DATE NOT NULL,
	EDATE DATE NOT NULL,
	ITEMCOUNT NUMBER NOT NULL,
	POLLTOTAL DATE NOT NULL,
	REGDATE DATE NOT NULL,
	CONSTRAINT PLL_PK PRIMARY KEY(POLLID)
);

CREATE SEQUENCE POLL_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE POLL ADD CONSTRAINT POLL_FK
FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
*/

// 투표 질문
public class PollDto implements Serializable {
	
	private int pollid;			// sequence 1, 2, 3, 4, 5
	private String id;			// 투표 만든 사람의 id
	private String question;	// 질문 -> 좋아하는 과일은?
	private Date sdate;			// 시작일
	private Date edate;			// 종료일
	private int itemcount;		// 보기의 갯수 2 ~ 10
	private int polltotal;		// 이 질문에 투표한 사람 수
	private Date regdate;		// 질문 등록일

	// 투표 했는지 안했는지 투표했으면 pollresult로 투표 안했으면 polldetail로
	private boolean vote;		
	
	public PollDto() {
	}

	public PollDto(String id, String question, int itemcount) {
		super();
		this.id = id;
		this.question = question;
		this.itemcount = itemcount;
	}

	public PollDto(String id, String question, Date sdate, Date edate, int itemcount, int polltotal) {
		super();
		this.id = id;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.itemcount = itemcount;
		this.polltotal = polltotal;
	}

	public PollDto(int pollid, String id, String question, Date sdate, Date edate, int itemcount, int polltotal,
			Date regdate) {
		super();
		this.pollid = pollid;
		this.id = id;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.itemcount = itemcount;
		this.polltotal = polltotal;
		this.regdate = regdate;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}

	public int getPolltotal() {
		return polltotal;
	}

	public void setPolltotal(int polltotal) {
		this.polltotal = polltotal;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	// getter
	public boolean isVote() {
		return vote;
	}

	// setter
	public void setVote(boolean vote) {
		this.vote = vote;
	}

	@Override
	public String toString() {
		return "PollDto [pollid=" + pollid + ", id=" + id + ", question=" + question + ", sdate=" + sdate + ", edate="
				+ edate + ", itemcount=" + itemcount + ", polltotal=" + polltotal + ", regdate=" + regdate + ", vote="
				+ vote + "]";
	}

}
