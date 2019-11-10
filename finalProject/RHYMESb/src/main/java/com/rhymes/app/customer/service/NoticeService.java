package com.rhymes.app.customer.service;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;

public interface NoticeService {

	//notice list가져오기
	public List<NoticeDto> getNoticeList(CustomerParam param);
	
	//notice count
	public int getNoticeCount(CustomerParam param);
		
	//readcount 증가
	public boolean NoticeUpRead(int seq);
	
	//notice 디테일
	public NoticeDto getNoticeDetail(int seq);
	
	
}
