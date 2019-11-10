package com.rhymes.app.store.model;


public class StockDto {
	
	private int stock_seq;			// 재고번호(사이즈별 구분)
	private int p_seq;				// 상품 번호
	private String p_size;			// 상품 사이즈
	private int p_quantity;			// 수량
	private String p_quantity2;		
	
	private String size;			
	private int quantity;			
	
	private int salesvolume;		// 재고번호 총 판매수량
	
	private int rnum;				// JOIN
	private String p_name;
	private String c1_name;
	private String c2_name;
	private String c3_name;
	private String cp_code;
	private String p_color;
	private int p_price;
	
	private String isrestock;
	private int cnt;				// restock stock_seq check
	
	public StockDto() {
	}
	public int getStock_seq() {
		return stock_seq;
	}
	public void setStock_seq(int stock_seq) {
		this.stock_seq = stock_seq;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public int getP_quantity() {
		return p_quantity;
	}
	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}
	public String getP_quantity2() {
		return p_quantity2;
	}
	public void setP_quantity2(String p_quantity2) {
		this.p_quantity2 = p_quantity2;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getSalesvolume() {
		return salesvolume;
	}
	public void setSalesvolume(int salesvolume) {
		this.salesvolume = salesvolume;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getC1_name() {
		return c1_name;
	}
	public void setC1_name(String c1_name) {
		this.c1_name = c1_name;
	}
	public String getC2_name() {
		return c2_name;
	}
	public void setC2_name(String c2_name) {
		this.c2_name = c2_name;
	}
	public String getC3_name() {
		return c3_name;
	}
	public void setC3_name(String c3_name) {
		this.c3_name = c3_name;
	}
	public String getCp_code() {
		return cp_code;
	}
	public void setCp_code(String cp_code) {
		this.cp_code = cp_code;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getIsrestock() {
		return isrestock;
	}
	public void setIsrestock(String isrestock) {
		this.isrestock = isrestock;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
}
