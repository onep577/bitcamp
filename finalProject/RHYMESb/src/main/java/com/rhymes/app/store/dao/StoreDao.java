package com.rhymes.app.store.dao;

import java.io.Serializable;
import java.util.List;

import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.category.Category1Dto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;

public interface StoreDao extends Serializable {

	public List<String> getCompanyList() throws Exception;
	public List<Category2Dto> getCate2List(Category2Dto dto) throws Exception;
	// 상품 리스트
	public List<ProductDto> getProductList(ProductParam param) throws Exception;
	// 리스트 상품갯수 
	public int getProductCnt(ProductParam param) throws Exception;
	// left-navi(brand-cate1)
	public List<Category1Dto> getkCate1List(ProductParam param) throws Exception;
	public List<Category2Dto> getkCate2List(ProductParam param) throws Exception;
	public List<Category3Dto> getkCate3List(ProductParam param) throws Exception;
}

