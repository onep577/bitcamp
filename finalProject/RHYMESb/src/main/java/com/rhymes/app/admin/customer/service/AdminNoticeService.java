package com.rhymes.app.admin.customer.service;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;

public interface AdminNoticeService {

	//notice list가져오기
	public List<NoticeDto> getNoticeList(CustomerParam param);
	
	//notice count
	public int getNoticeCount(CustomerParam param);
		
	//readcount 증가
	public boolean NoticeUpRead(int seq);
	
	//notice 디테일
	public NoticeDto getNoticeDetail(int seq);
	
	//notice upload
	public boolean NoticeUpload(NoticeDto dto);
	
	//notice 수정
	public boolean NoticeUpdateAf(NoticeDto dto);

	//notice 파일명가져오기
	public String getfilename(int seq);
	
	//notice 삭제하기
	public boolean NoticeDelete(int seq);	
		
}
