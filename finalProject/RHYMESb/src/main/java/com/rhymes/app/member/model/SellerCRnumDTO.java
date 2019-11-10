package com.rhymes.app.member.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
public class SellerCRnumDTO implements Serializable{

	private int crnum1;	// 사업자등록번호
	private int crnum2;
	private int crnum3;
	private String crname;	// 상호명
	
	private String cnum;
	
	public SellerCRnumDTO() {}

	public SellerCRnumDTO(int crnum1, int crnum2, int crnum3, String crname, String cnum) {
		super();
		this.crnum1 = crnum1;
		this.crnum2 = crnum2;
		this.crnum3 = crnum3;
		this.crname = crname;
		this.cnum = cnum;
	}

	@Override
	public String toString() {
		return "SellerCRnumDTO [crnum1=" + crnum1 + ", crnum2=" + crnum2 + ", crnum3=" + crnum3 + ", crname=" + crname
				+ ", cnum=" + cnum + "]";
	}


	
	
}
