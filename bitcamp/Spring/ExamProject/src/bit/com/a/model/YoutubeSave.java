package bit.com.a.model;

import java.io.Serializable;

public class YoutubeSave implements Serializable {
	
	private int seq;
	private String vname;
	private String id;
	private String title;
	private String category;
	private String wdate;
	
	public YoutubeSave() {
	}

	public YoutubeSave(String vname, String id, String title, String category) {
		super();
		this.vname = vname;
		this.id = id;
		this.title = title;
		this.category = category;
	}

	public YoutubeSave(String vname, String id, String title, String category, String wdate) {
		super();
		this.vname = vname;
		this.id = id;
		this.title = title;
		this.category = category;
		this.wdate = wdate;
	}

	public YoutubeSave(int seq, String vname, String id, String title, String category, String wdate) {
		super();
		this.seq = seq;
		this.vname = vname;
		this.id = id;
		this.title = title;
		this.category = category;
		this.wdate = wdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "YoutubeSave [seq=" + seq + ", vname=" + vname + ", id=" + id + ", title=" + title + ", category="
				+ category + ", wdate=" + wdate + "]";
	}

}
