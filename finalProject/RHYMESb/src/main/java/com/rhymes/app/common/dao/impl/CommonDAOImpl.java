package com.rhymes.app.common.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.common.dao.CommonDAO;

@Repository
public class CommonDAOImpl implements CommonDAO {


	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "common.";


}
