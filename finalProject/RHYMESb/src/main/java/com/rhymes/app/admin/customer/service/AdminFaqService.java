package com.rhymes.app.admin.customer.service;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;

public interface AdminFaqService {

	//faq list가져오기
	public List<FaqDto> getFaqList(CustomerParam param);
	
	//faq count
	public int getFaqCount(CustomerParam param);
	
	//faq 디테일
	public FaqDto getFaqDetail(int seq);
	
	//faq upload
	public boolean FaqUpload(FaqDto dto);
	
	//faq 수정
	public boolean FaqUpdateAf(FaqDto dto);
		
	//faq 삭제
	public boolean FaqDelete(int seq);
}
