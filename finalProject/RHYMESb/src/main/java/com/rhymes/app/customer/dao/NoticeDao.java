package com.rhymes.app.customer.dao;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;

public interface NoticeDao {

	//notice list가져오기
	public List<NoticeDto> getNoticeList(CustomerParam param);
	
	//notice count
	public int getNoticeCount(CustomerParam param);
	
	//notice 디테일 가져오기
	public NoticeDto getNoticeDetail(int seq);
	
	//readcount 증가
	public boolean NoticeUpRead(int seq);
	
}
