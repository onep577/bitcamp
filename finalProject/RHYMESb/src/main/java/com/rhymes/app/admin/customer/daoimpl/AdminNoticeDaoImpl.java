package com.rhymes.app.admin.customer.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.customer.dao.AdminNoticeDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;

@Repository
public class AdminNoticeDaoImpl implements AdminNoticeDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "AdminNotice.";
	
	//notice list 가져오기
	@Override
	public List<NoticeDto> getNoticeList(CustomerParam param) {
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();

		list = sqlSession.selectList(ns+"getNoticeList", param);
		
		
		return list;
	}

	
	
	//getcount
	@Override
	public int getNoticeCount(CustomerParam param) {
		
		return sqlSession.selectOne(ns+"getNoticeCount", param);
	}




	//detail
	@Override
	public NoticeDto getNoticeDetail(int seq) {
		
		return sqlSession.selectOne(ns+"getNoticeDetail", seq);
	}

	
	//readcount 증가
	@Override
	public boolean NoticeUpRead(int seq) {
		int n = sqlSession.update(ns + "NoticeUpRead", seq);
		return n>0?true:false;
	}


	//notice 업로드
	@Override
	public boolean NoticeUpload(NoticeDto dto) {
		
		int n = sqlSession.insert(ns+"NoticeUpload", dto);
		
		return n>0?true:false;
	}

	//notice 수정
	@Override
	public boolean NoticeUpdateAf(NoticeDto dto) {
		
		int n = sqlSession.update(ns+"NoticeUpdateAf", dto);
		
		return n>0?true:false; 
	}

	
	//notice 파일명가져오기
	@Override
	public String getfilename(int seq) {
	
		return sqlSession.selectOne(ns+"NoticeFilename", seq);
	}


	//notice 삭제
	@Override
	public boolean NoticeDelete(int seq) {
		int n = sqlSession.delete(ns+"NoticeDelete", seq);
		
		return n>0?true:false;
	}
	
}
