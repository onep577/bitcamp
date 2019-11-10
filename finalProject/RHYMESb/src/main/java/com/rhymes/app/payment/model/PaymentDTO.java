package com.rhymes.app.payment.model;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
CREATE TABLE rhy_payment (
	SEQ INT AUTO_INCREMENT PRIMARY KEY,				// 시퀀스
	PAYMENT_CODE VARCHAR(1000) PRIMARY KEY,			// 결제API
	USERID VARCHAR(1000) NOT NULL,					// 구매회원 ID
	
	SEND_NAME VARCHAR(1000) NOT NULL,				// 수취인 이름
	SEND_PHONE VARCHAR(1000) NOT NULL,				// 보내는 이 번호
	SEND_EMAIL VARCHAR(1000) NOT NULL,				// 보내는 이 이메일
	
	RECEIVE_NAME VARCHAR(1000) NOT NULL,			// 받는 이
	RECEIVE_PHONE VARCHAR(1000) NOT NULL,			// 수취인
	RECEIVE_POSTNUM VARCHAR(1000) NOT NULL,			// 수취인 우편번호
	RECEIVE_ADDRESS VARCHAR(1000) NOT NULL,			// 받는 이 주소
	
	PAYMENT_METHOD VARCHAR(1000) NOT NULL,			// 결제수단
	PAYMENT_STATUS VARCHAR(1000) NOT NULL,			// 결제상태	
	DELIVERY_PRICE INT,								// 배송비
	
	COUPON_CODE VARCHAR(1000),						// 쿠폰코드
	DISC_COUPON INT,								// 차감 쿠폰 금액
	
	DISC_POINT INT,									// 차감 적립금 금액
	ADD_POINT INT,									// 적립금
	
	DISC_PRODUCT INT,								// 차감 상품수량
	TOTALPRICE INT NOT NULL,						// 총금액
	RDATE DATETIME NOT NULL							// 주문날짜
)
*/

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO implements Serializable {
	private int seq;								// 시퀀스
	private String payment_code;					// 결제번호
	private String userid;							// 구매회원ID

	private String send_name;						// 보내는 이 이름
	private String send_phone;						// 보내는 이 번호
	private String send_email;						// 보내는 이 이메일
	
	private String receive_name;					// 받는 이 이름
	private String receive_phone;					// 받는 이 번호
	private String receive_postnum;					// 받는 이 우편번호
	private String receive_address;					// 받는 이 주소
	private String receive_address_request;			// 배송시 요청사항
	
	private String payment_method;					// 결제수단
	private String payment_status;					// 결제상태
	private int delivery_price;						// 배송비
	private String coupon_code;						// 쿠폰
	private int disc_coupon;						// 쿠폰 차감액
	private int disc_point;							// 적립금 차감액
	private int disc_product;						// 상품 차감
	private int add_point;							// 추가 적립금
	private int totalprice;							// 결제 총 금액
	private String rdate;							// 결제일
	
}


