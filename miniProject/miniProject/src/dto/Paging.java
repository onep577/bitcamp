package dto;

import java.io.Serializable;

public class Paging implements Serializable {
	
	private int pageNum = 1;	// 현재 페이지(get)
	private int totalCount;		// 전체 글 수(get)
	private int startPage;		// 한 페이지의 시작 페이지
	private int endPage;		// 한 페이지의 마지막 페이지
	private int pageSize = 10;		// 한 페이지당 글의 갯수
	private int displayPage = 5;	// 한 페이지에 들어갈 페이지 수
	
	boolean prev;	// prev 버튼이 보일지 여부
	boolean next;	// next 버튼이 보일지 여부
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		// setTotalCount()를 꼭 호출해야 paging이 되기 때문에 paging() 함수를 setTotalCount()를 호출했을 때 자동으로 호출되게 한다.
		this.totalCount = totalCount;
		paging();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void paging() {
		// prev, next, startPage, endPage 계산
		endPage = ((int) Math.ceil(pageNum/(double)displayPage)) * displayPage;
		System.out.println("endPage : " + endPage);
		
		startPage = endPage - (displayPage - 1);
		System.out.println("startPage : " + startPage);
		
		int totalPage = (int) Math.ceil(totalCount/(double)pageSize);
		
		if(totalPage <= endPage) {
			endPage = totalPage;
			next = false;
		}
		else {
			next = true;
		}
		prev = (startPage == 1)?false:true;		// 시작 페이지가 1이면 안나옴
		
		System.out.println("endPage : " + endPage);
		System.out.println("totalPage : " + totalPage);
	}
	
	
	
	
	

}
