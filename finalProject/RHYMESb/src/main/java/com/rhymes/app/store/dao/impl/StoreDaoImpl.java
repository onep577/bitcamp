package com.rhymes.app.store.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.store.dao.StoreDao;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.category.Category1Dto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;

@Repository
public class StoreDaoImpl implements StoreDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "store.";
	
	@Override
	public List<String> getCompanyList() throws Exception {
		return sqlSession.selectList(ns + "getCompanyList");
	}

	@Override
	public List<Category2Dto> getCate2List(Category2Dto dto) throws Exception {
		return sqlSession.selectList(ns + "getCompanyList", dto );
	}

	@Override
	public List<ProductDto> getProductList(ProductParam param) throws Exception {
		return sqlSession.selectList(ns + "getProductList", param);
	}

	@Override
	public int getProductCnt(ProductParam param) throws Exception {
		int cnt = sqlSession.selectOne(ns + "productCnt", param);
		return cnt;
	}

	@Override
	public List<Category1Dto> getkCate1List(ProductParam param) throws Exception {
		return sqlSession.selectList(ns + "kCate1list", param);
	}

	@Override
	public List<Category2Dto> getkCate2List(ProductParam param) throws Exception {
		return sqlSession.selectList(ns + "kCate2list", param);
	}

	@Override
	public List<Category3Dto> getkCate3List(ProductParam param) throws Exception {
		return sqlSession.selectList(ns + "kCate3list", param);
	}

	

}
