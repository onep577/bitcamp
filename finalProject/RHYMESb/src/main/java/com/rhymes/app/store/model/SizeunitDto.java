package com.rhymes.app.store.model;

public class SizeunitDto {

	private int c2_seq;
	private String c2_size;
	public SizeunitDto() {
		
	}

	public int getC2_seq() {
		return c2_seq;
	}

	public void setC2_seq(int c2_seq) {
		this.c2_seq = c2_seq;
	}

	public String getC2_size() {
		return c2_size;
	}

	public void setC2_size(String c2_size) {
		this.c2_size = c2_size;
	}

	public SizeunitDto(int c2_seq, String c2_size) {
		super();
		this.c2_seq = c2_seq;
		this.c2_size = c2_size;
	}
	
	
	
	
}
