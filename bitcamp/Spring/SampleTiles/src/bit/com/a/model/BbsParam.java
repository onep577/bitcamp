package bit.com.a.model;

import java.io.Serializable;

public class BbsParam implements Serializable {
	private String s_category;
	private String keyword;
	private int start;
	private int end;
	
	public BbsParam() {
	}

	public BbsParam(String s_category, String keyword, int start, int end) {
		super();
		this.s_category = s_category;
		this.keyword = keyword;
		this.start = start;
		this.end = end;
	}

	public String getS_category() {
		return s_category;
	}

	public void setS_category(String s_category) {
		this.s_category = s_category;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "BbsParam [s_category=" + s_category + ", keyword=" + keyword + ", start=" + start + ", end=" + end
				+ "]";
	}

}
