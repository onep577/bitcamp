package bit.com.a.model;

import java.io.Serializable;
import java.util.Date;

public class CalendarDto implements Serializable {
	private int seq;
	private String id;
	private String title;
	private String content;
	private String rdate;			// 일정 날짜
	private Date wdate;				// 기록한 날짜
	// 7/3일에 7/14 일정을 기록했다면 7/3일이 wdate, 7/14일이 rdate이다
	
	public CalendarDto() {
	}

	public CalendarDto(int seq, String id, String title, String content, String rdate, Date wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.rdate = rdate;
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

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "CalendarDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", rdate="
				+ rdate + ", wdate=" + wdate + "]";
	}

}
