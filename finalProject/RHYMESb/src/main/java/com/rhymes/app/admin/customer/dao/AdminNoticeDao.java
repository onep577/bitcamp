package com.rhymes.app.admin.customer.dao;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;

public interface AdminNoticeDao {

	//notice list가져오기
	public List<NoticeDto> getNoticeList(CustomerParam param);
	
	//notice count
	public int getNoticeCount(CustomerParam param);
	
	//notice 디테일 가져오기
	public NoticeDto getNoticeDetail(int seq);
	
	//readcount 증가
	public boolean NoticeUpRead(int seq);
	
	//notice 업로드
	public boolean NoticeUpload(NoticeDto dto);
	
	//notice 수정
	public boolean NoticeUpdateAf(NoticeDto dto);

	//notice 파일이름가져오기
	public String getfilename(int seq);
	
	//notice 삭제
	public boolean NoticeDelete(int seq);
	
}
