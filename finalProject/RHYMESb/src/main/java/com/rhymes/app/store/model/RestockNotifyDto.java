package com.rhymes.app.store.model;

import java.io.Serializable;

public class RestockNotifyDto implements Serializable {

	private int rn_seq;
	private String id;
	private int stock_seq;
	private String phone;
	public int getRn_seq() {
		return rn_seq;
	}
	public void setRn_seq(int rn_seq) {
		this.rn_seq = rn_seq;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	
}
