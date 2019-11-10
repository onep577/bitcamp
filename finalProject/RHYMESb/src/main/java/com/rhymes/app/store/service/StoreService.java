package com.rhymes.app.store.service;

import java.io.Serializable;
import java.util.List;

import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.category.Category1Dto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;

public interface StoreService extends Serializable {
	public List<String> getCompnayList() throws Exception;
	public List<ProductDto> getProductList(ProductParam param) throws Exception;
	public int getProductCnt(ProductParam param) throws Exception;
	public List<Category1Dto> getkCate1List(ProductParam param) throws Exception;
	public List<Category2Dto> getkCate2List(ProductParam param) throws Exception;
	public List<Category3Dto> getkCate3List(ProductParam param) throws Exception;
}
