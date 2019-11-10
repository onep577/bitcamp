package com.rhymes.app.companyadmin.dao;

import java.io.Serializable;
import java.util.List;

import com.rhymes.app.companyadmin.model.ProductManageDto;
import com.rhymes.app.companyadmin.model.StockManageDto;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.ProductParam;
import com.rhymes.app.store.model.RestockNotifyDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.category.Category2Dto;
import com.rhymes.app.store.model.category.Category3Dto;

public interface ProductManageDao extends Serializable {

// 1.상품등록
	public List<Category2Dto> getCate2List(int c1_seq) throws Exception;
	public List<Category3Dto> getCate3List(int c2_seq) throws Exception;
	public int getPseq() throws Exception;
	public boolean insertProduct(ProductDto product) throws Exception;
	public boolean insertStock(StockDto stock) throws Exception;
	public String getSizeunit(int c2_seq) throws Exception;
	public SellerDTO getCname(SellerDTO seller) throws Exception;
	
// 2.상품조회
	public List<ProductDto> getProductList(ProductManageDto pParam) throws Exception;
	// 상품총갯수
	public int getProductCnt(ProductManageDto pParam) throws Exception;
	// 상품 상세조회(stocklist)
	public List<StockDto> getStockList(StockDto stock) throws Exception;
	public int getc2seq(Category2Dto cate2) throws Exception;

// 3. 상품 수정/삭제
	// 상품기본정보 수정
	public boolean productBasicInfoUpdate(ProductDto product) throws Exception;
	// 상품이미지 수정
	public boolean productImgUpdate(ProductDto product) throws Exception;
	// 상품SALE 적용
	public boolean productSalePriceUpdate(ProductDto product) throws Exception;
	// 상품SALE 적용취소
	public boolean productSalePriceUpdateCancel(ProductDto product) throws Exception;
	// 상품삭제
	public boolean productDelete(ProductDto product) throws Exception;
// 4.재고관리
	//stock list
	public List<StockDto> stockmanage(StockManageDto stockmanage)throws Exception;
	//stock cnt
	public int stockcnt(StockManageDto stockmanage)throws Exception;
	//quantity update
	public boolean changestockquantity(StockDto stock) throws Exception;
	//stockseq check
	public boolean restockcheck(StockDto stock) throws Exception;
	//getting phonenumbers to send msg
	public List<RestockNotifyDto> getrestockphonenumbers(StockDto stock) throws Exception; 
	

}
