package com.rhymes.app.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.customer.dao.AdminNoticeDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;
import com.rhymes.app.customer.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private AdminNoticeDao noticeDao;
	
	
	//notice list
	@Override
	public List<NoticeDto> getNoticeList(CustomerParam param){
		

		return noticeDao.getNoticeList(param);
	}

	//get count
	@Override
	public int getNoticeCount(CustomerParam param) {
		
		return noticeDao.getNoticeCount(param);
	}

	//notice detail
	@Override
	public NoticeDto getNoticeDetail(int seq) {
		
		return noticeDao.getNoticeDetail(seq);
	}

	//readcount 증가
	@Override
	public boolean NoticeUpRead(int seq) {
		
		return noticeDao.NoticeUpRead(seq);
	}

}
