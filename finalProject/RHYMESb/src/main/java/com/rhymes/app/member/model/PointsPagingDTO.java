package com.rhymes.app.member.model;

import java.io.Serializable;

import com.rhymes.app.common.model.LegacyPagingDTO;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
public class PointsPagingDTO extends LegacyPagingDTO implements Serializable {

	private String userid;
	
	public PointsPagingDTO(int pageNum, int totalSize) {
		super(pageNum, totalSize);
		// TODO Auto-generated constructor stub
	}
	
	public PointsPagingDTO(int pageNum, int totalSize, String userid) {
		super(pageNum, totalSize);
		this.userid = userid;
		// TODO Auto-generated constructor stub
	}
	
	public PointsPagingDTO(int pageNum, int totalSize, int recordCountPerPage, String userid) {
		super(pageNum, totalSize, recordCountPerPage);
		this.setRecordCountPerPage(recordCountPerPage);
		super.setStartSeq(( pageNum - 1 ) * recordCountPerPage);
		super.setEndSeq( super.getStartSeq() + recordCountPerPage - 1 );
		this.userid = userid;
		// TODO Auto-generated constructor stub
	}
	
	public PointsPagingDTO(int cond, String keyword, int pageNum, int totalSize) {
		super(cond, keyword, pageNum, totalSize);
		// TODO Auto-generated constructor stub
	}
	
	public PointsPagingDTO(int pageNum, int recordCountPerPage, int startSeq, int endSeq, int totalPage, int pageSize,
			int firstNavIndex, int lastNavIndex, int totalSize, String userid) {
		super(pageNum, recordCountPerPage, startSeq, endSeq, totalPage, pageSize, firstNavIndex, lastNavIndex, totalSize);
		this.userid = userid;
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {		
		return super.toString().replace(")", "") + " , userid=" + this.userid + ")";
	}
	
	@Override
	public void setRecordCountPerPage(int recordCountPerPage) {
		super.setRecordCountPerPage(recordCountPerPage);		
	}
}
