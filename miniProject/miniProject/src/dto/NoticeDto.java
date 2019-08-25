package dto;

import java.io.Serializable;

/*
CREATE TABLE NOTICE(
	SEQ				NUMBER(10)	 PRIMARY KEY,
	ID				VARCHAR2(20) NOT NULL,
	TITLE			VARCHAR2(50) NOT NULL,
	CONTENT			VARCHAR2(90) NOT NULL,
	WDATE			DATE		 NOT NULL,
	DEL				NUMBER(1)	 NOT NULL,
	READCOUNT		NUMBER(10)	 NOT NULL,
	FILENAME		VARCHAR2(20) NOT NULL,
	DOWNCOUNT		NUMBER(20)	 NOT NULL
);
*/

public class NoticeDto implements Serializable {
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private int del;
	private int readcount;
	private String filename;
	private int downcount;
	
	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	public NoticeDto(int seq, String id, String title, String content, String wdate, int del, int readcount,
			String filename, int downcount) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
		this.filename = filename;
		this.downcount = downcount;
	}
	
	public NoticeDto(String id, String title, String content, String filename, String wdate) {
		
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.wdate = wdate;
	}
	
	public NoticeDto(int seq, String id, String title, String content, String filename, String wdate) {
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.wdate = wdate;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}



	@Override
	public String toString() {
		return "NoticeDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", del=" + del + ", readcount=" + readcount + ", filename=" + filename + ", downcount=" + downcount
				+ "]";
	}
	
	
	

}
