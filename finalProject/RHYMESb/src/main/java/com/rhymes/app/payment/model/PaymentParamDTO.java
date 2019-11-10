package com.rhymes.app.payment.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PaymentParamDTO implements Serializable {
	private int product_price;					// 상품 총 금액
	private int coupon_count;					// 유효 쿠폰 개수
	private int point_amount;					// 유효 적립금 금액
	private int delivery_price;					// 배송비
	private int basket_del;						// 장바구니로 왔는지 구분자
	
	public PaymentParamDTO(int coupon_count, int point_amount) {
		super();
		this.coupon_count = coupon_count;
		this.point_amount = point_amount;
	}
}
