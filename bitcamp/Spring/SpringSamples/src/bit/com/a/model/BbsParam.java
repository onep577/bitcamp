package bit.com.a.model;

import java.io.Serializable;

public class BbsParam implements Serializable {
	
	// search
	private String s_category;			// 제목, 내용, 작성자
	private String s_keyword;			// 검색어
	
	// paging
	private int pageNumber = 0;				// 현재 페이지 즉, 클릭한 페이지
	private int recordCountPerPage = 10;		// 페이지당 글 수
	
	// [1] -> 1 ~ 10 DB용
	private int start = 1;
	private int end = 10;
	
	public BbsParam() {
	}

	public BbsParam(String s_category, String s_keyword, int pageNumber, int recordCountPerPage, int start, int end) {
		super();
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.pageNumber = pageNumber;
		this.recordCountPerPage = recordCountPerPage;
		this.start = start;
		this.end = end;
	}

	public String getS_category() {
		return s_category;
	}

	public void setS_category(String s_category) {
		this.s_category = s_category;
	}

	public String getS_keyword() {
		return s_keyword;
	}

	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
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
		return "BbsParam [s_category=" + s_category + ", s_keyword=" + s_keyword + ", pageNumber=" + pageNumber
				+ ", recordCountPerPage=" + recordCountPerPage + ", start=" + start + ", end=" + end + "]";
	}

}
