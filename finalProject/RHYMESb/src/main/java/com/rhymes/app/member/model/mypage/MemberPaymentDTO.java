package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberPaymentDTO {

	/* 결제정보 */
	private int totalprice;		//총 주문 금액
	private int disc_product = 0;	//상품 자체 할인금액
	private String coupon_code;	//사용한 쿠폰 코드
	private int disc_coupon = 0;	//쿠폰으로 할인받은 금액
	private int disc_point = 0;	//적립금 사용 금액
	private int delivery_price;	//배송비
	private int add_point;		//결제완료 후 적립액
	private String payment_method;//결제수단
	private int finalpaymentamount;	//실제 결제금액
	
	/* 주문정보 */
	private String payment_code;	//주문번호
	private String userid;	//결제id
	private String send_name;	//주문자이름
	private String rdate;		//결제일
	private String payment_status;	//결제상태
	private String delivery_status;	//배송상태
	
	/* 배송정보 */
	private String receive_name;	//수취인이름
	private String receive_phone;	//수취인연락처
	private String receive_postnum;	//수취인 우편번호
	private String receive_address;	//수취인 주소
	private String delivery_request;	//배송요청사항
	private String delivery_company;	//배송회사
	private String delivery_post_code;	//송장번호
	
	public int getFinalpaymentamount() {	//실제 결제금액
		return totalprice - disc_point - disc_coupon - disc_product;
	}
}
