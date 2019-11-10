package com.rhymes.app.admin.payment.model;

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
// 관리자페이지 -> 주문관리 -> 결제내역에서 결제상세내역 보기로 이동할 때 사용
public class AdminPaymentDetailDTO implements Serializable {
	private String photo1_file;						// 상품 이미지 파일명
	private int stock_seq;							// 상품 재고번호
	private int ea;									// 상품 수량
	private int price;								// 상품 단일가격
	private String size;							// 상품 사이즈
	private String p_color;							// 상품 색상
	private String p_name;							// 상품명
	private String c_name;							// 업체명
	
	private String userid;							// 구매회원 id
	private String send_name;						// 주문한사람 이름
	private String send_phone;						// 주문한사람 번호
	private String send_email;						// 주문한사람 이메일
	
	private String receive_name;					// 받는사람 이름
	private String receive_phone;					// 받는사람 번호
	private String receive_postnum;					// 받는사람 우편번호
	private String receive_address;					// 받는사람 주소
	private String delivery_request;				// 받는사람 주소 메세지

	private String payment_code;					// 주문번호
	private String payment_status;					// 결제상태
	private String payment_method;					// 결제수단
	private String vbank_name;						// 은행명
	private String vbank_num;						// 계좌번호
	private String vbank_holder;					// 예금주
	private String vbank_date;						// 입금기한
	private String card_apply_num;					// 카드승인번호
	private String rdate;							// 주문일
	
	private String coupon_code;						// 쿠폰코드
	private String func;							// 쿠폰 적립/할인
	private int func_num;							// 쿠폰 적립액/할인율
	private String func_measure;					// 쿠폰 원/%
	private int disc_coupon;						// 쿠폰차감액
	private int disc_point;							// 포인트차감액
	private int add_point;							// 추가적립금
	private int delivery_price;						// 배송비
	private int totalprice;							// 총 결제금액

}
