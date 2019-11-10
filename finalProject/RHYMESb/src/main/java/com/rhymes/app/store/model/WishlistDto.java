package com.rhymes.app.store.model;

import java.io.Serializable;

public class WishlistDto implements Serializable {

	private int w_seq;			// 위시리스트 seq
	private String id;			// 장바구니를 담은 user
	private int p_seq;		// 상품 재고번호(색상, 사이즈 구분)
	private String rdate;		// 장바구니에 담은 날짜
	public int getW_seq() {
		return w_seq;
	}
	public void setW_seq(int w_seq) {
		this.w_seq = w_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
	
	
}
