package com.rhymes.app.admin.customer.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.customer.dao.AdminNoticeDao;
import com.rhymes.app.admin.customer.service.AdminNoticeService;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

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


		//notice 글쓰기
		@Override
		public boolean NoticeUpload(NoticeDto dto) {
			
			
			return noticeDao.NoticeUpload(dto);
		}


		//notice 수정
		@Override
		public boolean NoticeUpdateAf(NoticeDto dto) {
			
			return noticeDao.NoticeUpdateAf(dto);
		}


		//파일명 가져오기
		@Override
		public String getfilename(int seq) {
			
			return noticeDao.getfilename(seq);
		}


		//notice 삭제
		@Override
		public boolean NoticeDelete(int seq) {
		
			return noticeDao.NoticeDelete(seq);
		}
		
		
		
}
