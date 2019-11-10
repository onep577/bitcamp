package com.rhymes.app.member.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class SellerBean implements Serializable {
	
	// 공통정보
	private int seq;
	private String userid;
	private String userpw;
	
	private String isAccountNonExpired;
	private String isAccountNonLock;
	private String isCredentialsIsNonExpired;	
	private String enabled;
	private List<AuthoritiesDTO> authList;
	private Date rdate;
	
	// 추가정보
//	private String id;				// 아이디
	private String c_name;			// 상호
	private String c_num;			// 사업자등록번호
	private String p_name;			// 대표자명
	private String c_postcode;		// 회사우편번호
	private String c_address;		// 회사 주소
	private String c_detailAddress;	// 회사 상세주소
	private String c_cond;			// 업태
	private String c_type;			// 종목
	private String ic_name;			// 담당자이름
	private String to;				// 담당자번호
	private String ic_phone;				// 담당자번호
	private String ic_email;		// 담당자이메일
	private String s_postcode;		// 출고지 우편번호
	private String s_address;		// 출고지 주소
	private String s_detailAddress;	// 출고지 상세주소		
	private String r_postcode;		// 반품/교환 우편번호
	private String r_address;		// 반품/교환 주소
	private String r_detailAddress;	// 반품/교환 상세주소
	private int c_code;				// 고유번호(seq)

	// AuthoritiesDto
	private String authority;	// 권한
	
	// 사업자 번호
	private String crnum1;
	private String crnum2;
	private String crnum3;
	

	// 이메일 합치기
	private String ic_email1;
	private String ic_email2;


	public String cnum() {	
		c_num = crnum1+"-"+crnum2+"-"+crnum3;		
		System.out.println("SellerBeanDTO   c_num: " + c_num);
		return c_num;
	}
	
	public String Memail() {
		ic_email = ic_email1+"@"+ic_email2;
		System.out.println("SellerBeanDTO   ic_email: " + ic_email);
		return ic_email; 
	}


	
	public SellerBean(int seq, String userid, String userpw, String isAccountNonExpired, String isAccountNonLock,
			String isCredentialsIsNonExpired, String enabled, List<AuthoritiesDTO> authList, Date rdate) {
		super();
		this.seq = seq;
		this.userid = userid;
		this.userpw = userpw;
		this.isAccountNonExpired = isAccountNonExpired;
		this.isAccountNonLock = isAccountNonLock;
		this.isCredentialsIsNonExpired = isCredentialsIsNonExpired;
		this.enabled = enabled;
		this.authList = authList;
		this.rdate = rdate;
	}



	





	
	
	
	
	
	
}
