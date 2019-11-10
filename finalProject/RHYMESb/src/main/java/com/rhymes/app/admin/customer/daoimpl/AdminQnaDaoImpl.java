package com.rhymes.app.admin.customer.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.customer.dao.AdminQnaDao;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.model.QnaOrderDto;

@Repository
public class AdminQnaDaoImpl implements AdminQnaDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "AdminQna.";
	
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

	//qna 부모글 자식글 삭제
	@Override
	public boolean QnaParentDelete(int ref) {
		int n = sqlSession.delete(ns+"QnaParentDelete", ref);
		return n>0?true:false;
	}

	//답글 작성
	@Override
	public boolean QnaAnswer(QnaDto dto) throws Exception {
		
		QnaDto qnadto = sqlSession.selectOne(ns+"getQnaDetail", dto.getSeq());
		
		sqlSession.update(ns+"QnaAnswer", qnadto);
		
		dto.setRef(qnadto.getRef());
		dto.setStep(qnadto.getStep());
		dto.setDepth(qnadto.getDepth());
		
		int n = sqlSession.insert(ns+"QnaAnswerAf", dto);
		sqlSession.update(ns+ "QnaUpFeedback", dto);
		
		return n>0?true:false;
	}


	
	
}
