package com.rhymes.app.store.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.rhymes.app.store.model.BasketDto;
import com.rhymes.app.store.model.BasketListDto;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.RestockNotifyDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.WishlistDto;

public interface PurchaseDao extends Serializable {

	
	// 상품 상세페이지
	public ProductDto getProductDetail(int p_seq) throws Exception;
	// 재고번호별 제품사이즈 가져오기
	public List<StockDto> getSizeList(int p_seq) throws Exception;

	// 일반 장바구니(로그인O)
		// 장바구니 등록
		public boolean insertBasket(BasketDto basket) throws Exception; 
		// 장바구니 체크
		public boolean chkBasket(BasketDto basket) throws Exception;
		// 장바구니 리스트 불러오기
		public List<BasketListDto> getBasketList(String id) throws Exception;
		// 장바구니 삭제
		public void deleteBasket(int b_seq) throws Exception;
		// 장바구니 수량 업데이트
		public int updateBaksetQ(BasketDto basket)throws Exception;
		// 장바구니 전체삭제
		public int deleteBasektAll(BasketDto basket)throws Exception;
	// 세션 장바구니(로그인X)
		public BasketListDto getSessionBasketDto(int stock_seq)throws Exception;
	
	// 위시리스트 등록
	public boolean insertWishlist(WishlistDto wish)throws Exception;
	// 위시리스트 체크
	public boolean chkWishlist(WishlistDto wish)throws Exception;
	// 위시리스트 삭제
	public boolean deleteWishlist(WishlistDto wish)throws Exception;
	
	// 재입고 알림 등록
	public boolean insertRestockN(RestockNotifyDto restock) throws Exception;
	// 재입고 아이디 체크
	public boolean chkRestockN(RestockNotifyDto restock) throws Exception;
	
	// 재고 수량 체크
	public int stockCheck(int stock_seq) throws Exception;
}
