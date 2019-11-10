package com.rhymes.app.member.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellerDTO implements Serializable {

	private int seq;
	private String id;				// 아이디
	private String c_name;			// 상호명
	private String c_num;			// 사업자등록번호
	private String p_name;			// 대표자명
	private String c_postcode;		// 회사우편번호
	private String c_address;		// 회사 주소
	private String c_detailaddress;	// 회사 상세주소
	private String c_cond;			// 업태
	private String c_type;			// 종목
	private String ic_name;			// 담당자이름
	private String ic_phone;		// 담당자번호
	private String ic_email;		// 담당자이메일
	private String s_postcode;		// 출고지 우편번호
	private String s_address;		// 출고지 주소
	private String s_detailaddress;	// 출고지 상세주소		
	private String r_postcode;		// 반품/교환 우편번호
	private String r_address;		// 반품/교환 주소
	private String r_detailaddress;	// 반품/교환 상세주소
	private int c_code;				// 고유번호(seq)
	
	public SellerDTO() {}



	public SellerDTO(String id, String c_name, String c_num) {
		super();
		this.id = id;
		this.c_name = c_name;
		this.c_num = c_num;
	}



	public SellerDTO(int seq, String id, String c_name, String c_num, String p_name, String c_postcode,
			String c_address, String c_detailaddress, String c_cond, String c_type, String ic_name, String ic_phone,
			String ic_email, String s_postcode, String s_address, String s_detailaddress, String r_postcode,
			String r_address, String r_detailaddress, int c_code) {
		super();
		this.seq = seq;
		this.id = id;
		this.c_name = c_name;
		this.c_num = c_num;
		this.p_name = p_name;
		this.c_postcode = c_postcode;
		this.c_address = c_address;
		this.c_detailaddress = c_detailaddress;
		this.c_cond = c_cond;
		this.c_type = c_type;
		this.ic_name = ic_name;
		this.ic_phone = ic_phone;
		this.ic_email = ic_email;
		this.s_postcode = s_postcode;
		this.s_address = s_address;
		this.s_detailaddress = s_detailaddress;
		this.r_postcode = r_postcode;
		this.r_address = r_address;
		this.r_detailaddress = r_detailaddress;
		this.c_code = c_code;
	}



	@Override
	public String toString() {
		return "SellerDTO [seq=" + seq + ", id=" + id + ", c_name=" + c_name + ", c_num=" + c_num + ", p_name=" + p_name
				+ ", c_postcode=" + c_postcode + ", c_address=" + c_address + ", c_detailaddress=" + c_detailaddress
				+ ", c_cond=" + c_cond + ", c_type=" + c_type + ", ic_name=" + ic_name + ", ic_phone=" + ic_phone
				+ ", ic_email=" + ic_email + ", s_postcode=" + s_postcode + ", s_address=" + s_address
				+ ", s_detailaddress=" + s_detailaddress + ", r_postcode=" + r_postcode + ", r_address=" + r_address
				+ ", r_detailaddress=" + r_detailaddress + ", c_code=" + c_code + "]";
	}



	
	
	
}
