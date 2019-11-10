package com.rhymes.app.store.model;

public class BasketListDto {

	private String photo1_file;
	private String c_name;
	private String p_name;
	private int p_price;
	private String size;
	private int stock_seq;
	private int p_quantity;	// 장바구니 수량
	private String rdate;
	private int b_seq;
	private int p_seq;
	private int quantity;	// 재고 수량
	
	//가공 변수
	private String p_price2;
	private String total_price;
	
	private int total_price2;
	
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public int getTotal_price2() {
		return total_price2;
	}

	public void setTotal_price2(int total_price2) {
		this.total_price2 = total_price2;
	}

	public String getC_name() {
		return c_name;
	}
	
	public BasketListDto() {
	}
	
	public int getB_seq() {
		return b_seq;
	}

	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}

	public int getStock_seq() {
		return stock_seq;
	}

	public void setStock_seq(int stock_seq) {
		this.stock_seq = stock_seq;
	}

	public String getTotal_price() {
		return total_price;
	}

	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}

	public String getP_price2() {
		return p_price2;
	}

	public void setP_price2(String p_price2) {
		this.p_price2 = p_price2;
	}

	public String getPhoto1_file() {
		return photo1_file;
	}

	public void setPhoto1_file(String photo1_file) {
		this.photo1_file = photo1_file;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
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

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	
	
	
	
}
