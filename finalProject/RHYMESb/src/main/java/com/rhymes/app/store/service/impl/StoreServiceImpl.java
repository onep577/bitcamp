package com.rhymes.app.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.store.dao.StoreDao;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.category.Category1Dto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;
import com.rhymes.app.store.service.StoreService;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao store;
	
	@Override
	public List<String> getCompnayList() throws Exception {
		return store.getCompanyList();
	}

	@Override
	public List<ProductDto> getProductList(ProductParam param) throws Exception {
		return store.getProductList(param);
	}

	@Override
	public int getProductCnt(ProductParam param) throws Exception {
		return store.getProductCnt(param);
	}

	@Override
	public List<Category1Dto> getkCate1List(ProductParam param) throws Exception {
		return store.getkCate1List(param);
	}

	@Override
	public List<Category2Dto> getkCate2List(ProductParam param) throws Exception {
		return store.getkCate2List(param);
	}

	@Override
	public List<Category3Dto> getkCate3List(ProductParam param) throws Exception {
		return store.getkCate3List(param);
	}

	
}
