package dto;

import java.io.Serializable;

public class BbsParam implements Serializable {
	
	private String keyword;		// 검색어
	private String content;
	private String s_category;	// 제목, 내용, 작성자
	
	public BbsParam() {
	}

	public BbsParam(String keyword, String content, String s_category) {
		super();
		this.keyword = keyword;
		this.content = content;
		this.s_category = s_category;
	}

}
