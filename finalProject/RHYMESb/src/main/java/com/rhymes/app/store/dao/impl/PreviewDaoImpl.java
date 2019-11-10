package com.rhymes.app.store.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.store.dao.PreviewDao;
import com.rhymes.app.store.model.DetailParam;
import com.rhymes.app.store.model.PreviewDto;

@Repository
public class PreviewDaoImpl implements PreviewDao {

	@Autowired
	SqlSession sqlSession;
	String ns = "Preview.";
	
	//preview list가져오기
	@Override
	public List<PreviewDto> getPreviewList(DetailParam param) {
		List<PreviewDto> list = new ArrayList<PreviewDto>();
		list = sqlSession.selectList(ns +"getPreviewList", param);
		return list;
	}

	@Override
	public int getPreviewCount(DetailParam param) {
		
		return sqlSession.selectOne(ns+"getPreviewCount", param);
	}

	//like 여부
	@Override
	public boolean getlikes(Map<String, Object> map) {
		int count = sqlSession.selectOne(ns + "getlikes", map);
		return count > 0 ? true : false;
	}

	//like 추가
	@Override
	public boolean addlikes(Map<String, Object> map) {
		int count = sqlSession.delete(ns + "addlikes", map);
		return count > 0 ? true : false;
	}

	//like 삭제
	@Override
	public boolean deletelikes(Map<String, Object> map) {
		int count = sqlSession.delete(ns + "deletelikes", map);
		return count > 0 ? true : false;
	}

	//총 like 수 올리기
	@Override
	public boolean uptotalcount(DetailParam param) {
		int count = sqlSession.update(ns + "uptotalcount", param);
		
		return count > 0 ? true : false;
	}

	//총 like 수 내리기
	@Override
	public boolean downtotalcount(DetailParam param) {
		int count = sqlSession.update(ns + "downtotalcount", param);
		
		return count > 0 ? true : false;
	}

	//총 like 수 가져오기
	@Override
	public int liketotalcount(DetailParam param) {
		int num = sqlSession.selectOne(ns + "liketotalcount", param);
		return num;
	}


	
}
