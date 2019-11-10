package com.rhymes.app.admin.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.customer.dao.AdminFaqDao;
import com.rhymes.app.admin.customer.service.AdminFaqService;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;

@Service
public class AdminFaqServiceImpl implements AdminFaqService {

	@Autowired
	private AdminFaqDao faqDao;


	//faq list
	@Override
	public List<FaqDto> getFaqList(CustomerParam param) {
		
		return faqDao.getFaqList(param);
	}

	//faq count
	@Override
	public int getFaqCount(CustomerParam param) {
		
		return faqDao.getFaqCount(param);
	}

	//faq detail 가져오기
	@Override
	public FaqDto getFaqDetail(int seq) {
		
		return faqDao.getFaqDetail(seq);
	}

	//faq upload
	@Override
	public boolean FaqUpload(FaqDto dto) {
		
		return faqDao.FaqUpload(dto);
	}

	//faq 수정
	@Override
	public boolean FaqUpdateAf(FaqDto dto) {
		
		return faqDao.FaqUpdateAf(dto);
	}

	//faq 삭제
	@Override
	public boolean FaqDelete(int seq) {
		
		return faqDao.FaqDelete(seq);
	}
}
