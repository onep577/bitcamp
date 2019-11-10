package com.rhymes.app.store.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.store.dao.PurchaseDao;
import com.rhymes.app.store.model.BasketDto;
import com.rhymes.app.store.model.BasketListDto;
import com.rhymes.app.store.model.ProductDto;
import com.rhymes.app.store.model.RestockNotifyDto;
import com.rhymes.app.store.model.StockDto;
import com.rhymes.app.store.model.WishlistDto;

@Repository
public class PurchaseDaoImpl implements PurchaseDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "purchase.";

	@Override
	public ProductDto getProductDetail(int p_seq) throws Exception {
		return sqlSession.selectOne(ns + "getProductDetail", p_seq);
	}

	@Override
	public List<StockDto> getSizeList(int p_seq) throws Exception {
		return sqlSession.selectList(ns + "getSizeList", p_seq);
	}

	@Override
	public boolean insertBasket(BasketDto basket) throws Exception {
		int n = sqlSession.insert(ns + "insertBakset", basket);
		return n>0?true:false;
	}

	@Override
	public boolean chkBasket(BasketDto basket) throws Exception {
		int n = sqlSession.selectOne(ns + "chkBasket", basket);
		return n>0?true:false;
	}

	@Override
	public List<BasketListDto> getBasketList(String id) throws Exception {
		return sqlSession.selectList(ns + "getBasketList", id);
	}

	@Override
	public void deleteBasket(int b_seq) throws Exception {
		sqlSession.delete(ns + "deleteBasket", b_seq);
	}

	@Override
	public int updateBaksetQ(BasketDto basket) throws Exception {
		int n = sqlSession.update(ns + "updateBasketQ", basket);
		return n;
	}

	@Override
	public int deleteBasektAll(BasketDto basket) throws Exception {
		int n = sqlSession.delete(ns + "deleteBasketAll", basket);
		return n;
	}

	@Override
	public boolean insertWishlist(WishlistDto wish) throws Exception {
		int n = sqlSession.insert(ns + "insertWishlist", wish);
		return n>0?true:false;
	}

	@Override
	public boolean chkWishlist(WishlistDto wish) throws Exception {
		int n = sqlSession.selectOne(ns + "chkWishlist", wish);
		return n>0?true:false;
	}

	@Override
	public boolean deleteWishlist(WishlistDto wish) throws Exception {
		int n = sqlSession.delete(ns + "deleteWishlist", wish);
		return n>0?true:false;
	}

	@Override
	public boolean insertRestockN(RestockNotifyDto restock) throws Exception {
		int n = sqlSession.insert(ns + "rn_insert", restock);
		return n>0?true:false;
	}

	@Override
	public boolean chkRestockN(RestockNotifyDto restock) throws Exception {
		int n = sqlSession.selectOne(ns + "chkRestockN", restock);
		return n>0?true:false;
	}

	@Override
	public BasketListDto getSessionBasketDto(int stock_seq) throws Exception {
		BasketListDto basketlistDto = new BasketListDto();
		basketlistDto = sqlSession.selectOne(ns + "getSessionBasketDto", stock_seq);
		return basketlistDto;
	}

	@Override
	public int stockCheck(int stock_seq) throws Exception {
		int stock_quantity = sqlSession.selectOne(ns+"stockCheck", stock_seq); 
		return stock_quantity;
	}

	



	



	
	
	
	
}
