package com.rhymes.app.companyadmin.service;

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

public interface ProductManageService extends Serializable {

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
	//product총갯수
	public int getProductCnt(ProductManageDto pParam) throws Exception;
	//상품 상세조회(stocklist)
	public List<StockDto> getStockList(StockDto stock) throws Exception;
	public int getc2seq(Category2Dto cate2) throws Exception;
// 3. 상품 수정/삭제/SALE등록
	//3-1.상품 기본정보 수정
	public boolean productBasicInfoUpdate(ProductDto product) throws Exception;
	//3-2.상품 이미지 수정
	public boolean productImgUpdate(ProductDto product) throws Exception;
	//3-3.상품 SALE가격 적용
	public boolean productSalePriceUpdate(ProductDto product) throws Exception;
	//3-3.상품 SALE가격 취소
	public boolean productSalePriceUpdateCancel(ProductDto product) throws Exception;
	//3-4.상품삭제
	public boolean productDelete(ProductDto product) throws Exception;
// 4. 재고관리
	// 4-1. 재고 리스트
	public List<StockDto> stockmanage(StockManageDto stockmanage) throws Exception;
	// 4-2. 재고 총갯수
	public int stockcnt(StockManageDto stockmanage) throws Exception;
	// 4-3. 재고 수정
	public boolean changestockquantity(StockDto stock) throws Exception;
	// 4-4. 재입고 테이블 확인
	public boolean restockcheck(StockDto stock) throws Exception; 
	// 4-5. 재입고 신청 휴대폰번호 리스트
	public List<RestockNotifyDto> getrestockphonenumbers(StockDto stock) throws Exception;
	
	
	
}
