package com.rhymes.app.member.model.mypage;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@ToString
public class MemberReviewPagingDTO {
	
	private String userid;
	
	private String review_written;
	
	/** 검색조건. 0=전체기간, 1=1년 2=2년 ...*/
    private int cond;    
     
    /** 쿼리에 보낼 검색조건 문자열  */
    private String condquery = "";
     
    /** 검색어 */
    private String keyword;
     
    /** 현재페이지 */
    private int pageNum = 1;
     
    /** 페이지에 보여줄 데이터 갯수 */
    private int recordCountPerPage = 3;
        
    /** 현재 페이지의 시작 seq     */
    private int startSeq = 1;
     
    /** 현재 페이지의 끝 seq */
    private int endSeq = 10;
        
    /**총 페이지 수 */
    private int totalPage = 1;
     
    /** 현재 페이지 네비게이션 사이즈 */
    private int pageNavSize = 5;
     
    /** 최대 페이지 네비게이션 사이즈 */
    private int maxNavSize = 10;
     
    /** 페이지 네비게이션 첫 인덱스 */
    private int firstNavIndex = 1;
     
    /** 페이지 네비게이션 마지막 인덱스 */
    private int lastNavIndex = 1; 
    
    /** 총 게시물의 수 */
    private int totalSize = 10;
    
    /**매개변수 없는 생성자.
	 * 최초접속에 쓰임
	 */
	public MemberReviewPagingDTO() {	}
	
	public MemberReviewPagingDTO(String userid, int pageNum, String review_written) {
		this.userid = userid;
		this.pageNum = pageNum;
		this.review_written = review_written;
		this.setPageNum(pageNum);
	}
	    
    public void setPageNum(int pageNum) {
    	this.startSeq = ( ( pageNum - 1 ) * this.getRecordCountPerPage() ) ;
    	this.endSeq = startSeq + this.getRecordCountPerPage() - 1;
    	this.setNav(this.totalSize);
    }
    
    public void setTotalSize(int totalSize) {
    	this.totalSize = totalSize;
    	this.setNav(totalSize);
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
