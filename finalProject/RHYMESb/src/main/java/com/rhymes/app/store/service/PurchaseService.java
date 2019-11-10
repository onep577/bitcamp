package com.rhymes.app.store.service;

import java.util.List;

import com.rhymes.app.store.model.BasketDto;
import com.rhymes.app.store.model.BasketListDto;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.RestockNotifyDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.WishlistDto;

public interface PurchaseService {

	// 상품 상세정보 GET
	public ProductDto getProductDetail(int p_seq) throws Exception;
	// 상품 사이즈 모두 GET
	public List<StockDto> getSizeList(int p_seq) throws Exception;
	// 회원 장바구니 상품 등록
	public boolean insertBasket(BasketDto basket) throws Exception;
	// 회원 장바구니 상품 중복체크
	public boolean chkBasket(BasketDto basket) throws Exception;
	// 회원 장바구니 리스트 GET
	public List<BasketListDto> getBasketList(String id) throws Exception;
	// 회원 장바구니 삭제
	public void deleteBasket(int b_seq) throws Exception;
	// 회원 장바구니 수량 변경
	public int updateBaksetQ(BasketDto basket) throws Exception;
	// 회원 장바구니 전체 삭제
	public int deleteBasektAll(BasketDto basket) throws Exception;
	// 찜 등록
	public boolean insertWishlist(WishlistDto wish) throws Exception;
	// 찜 ID 중복체크
	public boolean chkWishlist(WishlistDto wish) throws Exception;
	// 찜 목록 삭제
	public boolean deleteWishlist(WishlistDto wish) throws Exception;
	// 재입고 알림 신청 등록
	public boolean insertRestockN(RestockNotifyDto restock) throws Exception;
	// 재입고 알림 ID중복 체크
	public boolean chkRestockN(RestockNotifyDto restock) throws Exception;
	// 비회원 장바구니 리스트
	public BasketListDto getSessionBasketDto(int stock_seq)throws Exception;
	
	//재고수량 체크
	public int stockCheck(int stock_seq) throws Exception;
}
