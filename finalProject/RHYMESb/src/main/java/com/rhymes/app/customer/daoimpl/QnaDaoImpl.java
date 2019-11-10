package com.rhymes.app.customer.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.customer.dao.QnaDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.model.QnaOrderDto;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Qna.";
	
	//qna list가져오기
	@Override
	public List<QnaDto> getQnaList(CustomerParam param) {
		
		List<QnaDto> list = new ArrayList<QnaDto>();
		list = sqlSession.selectList(ns +"getQnaList", param);
		
		return list;
	}
	
	//qna count가져오기
	@Override
	public int getQnaCount(CustomerParam param) {
		
		return sqlSession.selectOne(ns+"getQnaCount", param);
	}

	//qna orderlist 가져오기
	@Override
	public List<QnaOrderDto> getQnaOrderList(String id) {
		List<QnaOrderDto> list = new ArrayList<QnaOrderDto>();
		list = sqlSession.selectList(ns +"getQnaOrderList", id);
		
		return list;
	}

	//qna detail
	@Override
	public QnaDto getQnaDetail(int seq) {
		
		return sqlSession.selectOne(ns+"getQnaDetail", seq);
	}

	//qna 업로드
	@Override
	public boolean QnaUpload(QnaDto dto) {
		
		int n = sqlSession.insert(ns+"QnaUpload", dto);
		
		return n>0?true:false;
	}

	//qna 수정
	@Override
	public boolean QnaUpdateAf(QnaDto dto) {

		int n = sqlSession.update(ns+"QnaUpdateAf", dto);
		
		return n>0?true:false;
	}

	//qna 파일명 가져오기
	@Override
	public String getfilename(int seq) {
		
		return sqlSession.selectOne(ns+"QnaFilename", seq);
	}

	//qna 삭제
	@Override
	public boolean QnaDelete(int seq) {
		
		int n = sqlSession.delete(ns+"QnaDelete", seq);
		
		return n>0?true:false;
	}
	
	//부모글 자식글 삭제
	@Override
	public boolean QnaParentDelete(int ref) {
	
		int n = sqlSession.delete(ns+"QnaParentDelete", ref);
		return n>0?true:false;
	}

	
}
