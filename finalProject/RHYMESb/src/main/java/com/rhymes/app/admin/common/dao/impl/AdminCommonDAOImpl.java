package com.rhymes.app.admin.common.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.common.dao.AdminCommonDAO;
import com.rhymes.app.common.dao.CommonDAO;

@Repository
public class AdminCommonDAOImpl implements AdminCommonDAO {


	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "admincommon.";

	// 회원 전체 count
	@Override
	public int getAllMemberList() {
		return sqlSession.selectOne(ns+"getAllMemberList");
	}

	//오늘 가입한 회원 count
	@Override
	public int getNewMemCount(String mTime) {
		return sqlSession.selectOne(ns+"getNewMemCount", mTime);
	}


}
