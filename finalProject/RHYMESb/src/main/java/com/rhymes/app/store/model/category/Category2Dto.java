package com.rhymes.app.store.model.category;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@JsonIgnoreProperties(value = {"handler"})
public class Category2Dto {

	private int c2_seq;
	private String c2_name;
	private int c1_seq;
	public int getC2_seq() {
		return c2_seq;
	}
	public void setC2_seq(int c2_seq) {
		this.c2_seq = c2_seq;
	}
	public String getC2_name() {
		return c2_name;
	}
	public void setC2_name(String c2_name) {
		this.c2_name = c2_name;
	}
	public int getC1_seq() {
		return c1_seq;
	}
	public void setC1_seq(int c1_seq) {
		this.c1_seq = c1_seq;
	}
	@Override
	public String toString() {
		return "Category2Dto [c2_seq=" + c2_seq + ", c2_name=" + c2_name + ", c1_seq=" + c1_seq + "]";
	}
	
	
	
	
}









