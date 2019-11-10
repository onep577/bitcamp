package com.rhymes.app.store.model;

public class OrderDto {

	private String id;
	private int stock_seq;	// 재고번호
	private int p_quantity; // 수량
	
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
	
	
	
}
