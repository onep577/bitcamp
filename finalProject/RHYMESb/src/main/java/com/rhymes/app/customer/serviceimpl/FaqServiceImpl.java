package com.rhymes.app.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.customer.dao.FaqDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;
import com.rhymes.app.customer.service.FaqService;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDao faqDao;


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

}
