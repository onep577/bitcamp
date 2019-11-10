package com.rhymes.app.store.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class BasketDto {

	private int b_seq;			// 장바구니 seq
	private String id;			// 장바구니를 담은 user
	private int stock_seq;		// 상품 재고번호(색상, 사이즈 구분)
	private int p_quantity;		// 장바구니 상품수량
	private String rdate;		// 장바구니에 담은 날짜
	
	private int quantity;		// 재고 수량
	
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStock_seq() {
		return stock_seq;
	}
	public void setStock_seq(int stock_seq) {
		this.stock_seq = stock_seq;
	}
	public int getP_quantity() {
		return p_quantity;
	}
	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	
}
