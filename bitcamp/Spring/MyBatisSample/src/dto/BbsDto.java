package dto;

import java.io.Serializable;

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

	public BbsDto(int seq, String id, String title, String content, String wdate, int del, int readcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "BbsDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", del=" + del + ", readcount=" + readcount + "]";
	}
		
		
}
