package com.rhymes.app.payment.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class NoMemOrderCheckDTO implements Serializable {
	private String payment_code;					// 주문번호
	private String send_name;						// 보낸사람 이름
	private String rdate;							// 주문일
	
	private String name;							// 받는사람 이름
	private String delivery_post_code;				// 운송장번호
	private String receive_phone;					// 받는사람 번호
	private String receive_address;					// 받는사람 주소
	private String delivery_request;				// 배송 메세지
	
	private int s_seq;								// 상품 재고번호
	private int ea;									// 상품 수량
	private String size;							// 상품 사이즈
	private String p_color;							// 상품 색상
	private int price;								// 상품 가격
	private String payment_status;
	
	private String payment_method;					// 결제수단
	private int totalprice;							// 총 결제금액

	private String p_name;							// 상품 상품명
	private String p_title;							// 상품 타이틀
	private String photo1_file;						// 상품 이미지 파일명
	
}
