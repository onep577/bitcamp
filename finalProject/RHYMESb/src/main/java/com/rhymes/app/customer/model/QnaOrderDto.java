package com.rhymes.app.customer.model;

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
public class QnaOrderDto {

	//주문번호 주문일자 상품명 주문금액
	private String payment_code;
	private String userid;
	private int count;
	private String p_name;
	private int totalprice;
	private String rdate;
	
}
