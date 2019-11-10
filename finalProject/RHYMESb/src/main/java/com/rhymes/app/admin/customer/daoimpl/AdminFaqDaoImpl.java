package com.rhymes.app.admin.customer.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.customer.dao.AdminFaqDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;

@Repository
public class AdminFaqDaoImpl implements AdminFaqDao {


	@Autowired
	SqlSession sqlSession;
	String ns = "AdminFaq.";
	
	//faq list 가져오기
	@Override
	public List<FaqDto> getFaqList(CustomerParam param) {
		
		List<FaqDto> list = new ArrayList<FaqDto>();
		list = sqlSession.selectList(ns +"getFaqList", param);
		
		return list;
	}
	
	//faq count가져오기
	@Override
	public int getFaqCount(CustomerParam param) {
		
		return sqlSession.selectOne(ns+"getFaqCount", param);
	}

	//faq detail가져오기
	@Override
	public FaqDto getFaqDetail(int seq) {
		
		return sqlSession.selectOne(ns+"getFaqDetail", seq);
	}

	//faq upload올리기
	@Override
	public boolean FaqUpload(FaqDto dto) {
		int n = sqlSession.insert(ns+"FaqUpload", dto);
		return n>0?true:false;
	}

	//faq 수정
	@Override
	public boolean FaqUpdateAf(FaqDto dto) {
		int n = sqlSession.update(ns+"FaqUpdateAf", dto);
		
		return n>0?true:false;
	}

	//faq 삭제
	@Override
	public boolean FaqDelete(int seq) {
		int n = sqlSession.delete(ns+"FaqDelete", seq);
		
		return n>0?true:false;
	}
	
}
