package com.rhymes.app.store.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import com.rhymes.app.store.model.DetailParam;


import com.rhymes.app.store.dao.PqnaDao;
import com.rhymes.app.store.model.PqnaDto;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;

@Repository
public class PqnaDaoImpl implements PqnaDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Pqna.";
	
	//pqna list가져오기
	@Override
	public List<PqnaDto> getPqnaList(DetailParam param) {
		List<PqnaDto> list = new ArrayList<PqnaDto>();
		list = sqlSession.selectList(ns +"getPqnaList", param);
		
		return list;
	}

	//pqna 글 수
	@Override
	public int getPqnaCount(DetailParam param) {
		
		return sqlSession.selectOne(ns+"getPqnaCount", param);
	}

	//pqna 글 업로드
	@Override
	public boolean PqnaUpload(PqnaDto dto) {
		int n = sqlSession.insert(ns+"PqnaUpload", dto);
		return n>0?true:false;
	}

	//pqna 디테일
	@Override
	public PqnaDto getPqnaDetail(int seq) {
		return sqlSession.selectOne(ns+"getPqnaDetail", seq);
	}

	//pqna 수정
	@Override
	public boolean PqnaUpdateAf(PqnaDto dto) {
		int n = sqlSession.update(ns+"PqnaUpdateAf", dto);
		
		return n>0?true:false;
	}

	//pqna 삭제
	@Override
	public boolean PqnaDelete(int seq) {
		int n = sqlSession.delete(ns+"PqnaDelete", seq);
		
		return n>0?true:false;
	}

	//pqna 답글
	@Override
	public boolean PqnaAnswer(PqnaDto dto) throws Exception {
		PqnaDto pqnadto = sqlSession.selectOne(ns+"getPqnaDetail", dto.getSeq());
		
		sqlSession.update(ns+"PqnaAnswer", pqnadto);
		
		dto.setRef(pqnadto.getRef());
		dto.setStep(pqnadto.getStep());
		dto.setDepth(pqnadto.getDepth());
		
		int n = sqlSession.insert(ns+"PqnaAnswerAf", dto);
		
		return n>0?true:false;
	}

	


}
