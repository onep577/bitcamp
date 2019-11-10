package com.rhymes.app.customer.service;

import java.util.List;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;

public interface FaqService {

	//faq list가져오기
	public List<FaqDto> getFaqList(CustomerParam param);
	
	//faq count
	public int getFaqCount(CustomerParam param);
	
	//faq 디테일
	public FaqDto getFaqDetail(int seq);
	
}
