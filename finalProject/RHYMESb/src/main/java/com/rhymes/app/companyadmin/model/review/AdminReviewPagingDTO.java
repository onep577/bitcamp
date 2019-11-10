package com.rhymes.app.companyadmin.model.review;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminReviewPagingDTO {

	private String c_name;			//판매자 이름
	
	private String cond;				// 검색조건. 1=아이디, 2=쿠폰번호 ... 
    private String keyword;			// 검색어
    
    private int pageNum = 1;		// 현재 페이지
    private int recordCountPerPage = 10;	//한 페이지에 보여 줄 데이터 개수
    private int startSeq = 0;		// 현재 페이지의 시작 seq
    private int endSeq = 10;		// 현재 페이지의 끝 seq
    private int totalPage = 1;		// 총 페이지 수
     
    private int pageNavSize = 5;	// 현재 페이지 네비게이션 사이즈
    private int maxNavSize = 10;	// 최대 페이지 네비게이션 사이즈
    private int firstNavIndex = 1;	// 페이지 네비게이션 첫 인덱스
    private int lastNavIndex = 1;	//  페이지 네비게이션 마지막 인덱스 
    
    private int totalSize = 10;		// 총 게시물의 수 
    
    /**매개변수 없는 생성자.
	 * 최초접속에 쓰임
	 */
	public AdminReviewPagingDTO() {	}
		
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	   	this.startSeq = ( ( pageNum - 1 ) * this.getRecordCountPerPage() ) ;
	   	this.endSeq = startSeq + this.getRecordCountPerPage() - 1;
	   	this.setNav(this.totalSize);
	}
	    
	public void setTotalSize(int totalSize) {
	   	this.totalSize = totalSize;
	   	this.setRecordCountPerPage(this.recordCountPerPage);
	}
	
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
		this.setPageNum(this.pageNum);
	}

    /**네비게이션 바 설정
     * 12345 : 1 ~ 5
     * 678910 : 6 ~ 10
     * (7/5)*5 +1
     * (3/5)*5 +1
     */
	public void setNav(int totalSize) {
		//페이지 네비게이션의 최대 사이즈
	    this.maxNavSize = (totalSize % recordCountPerPage == 0) ? (totalSize / recordCountPerPage) : (totalSize / recordCountPerPage) + 1;
	    this.firstNavIndex = (this.pageNum / pageNavSize) * pageNavSize + 1;
	    //마지막 네비게이션 바 인덱스. 전체 글 수가 한 페이지 당 글 수로 나누어 떨어지면 -0 아니면 -1
	    int temp = this.firstNavIndex + pageNavSize - 1 ;
	    this.lastNavIndex = (temp > maxNavSize) ? maxNavSize : temp ;
	}
}
