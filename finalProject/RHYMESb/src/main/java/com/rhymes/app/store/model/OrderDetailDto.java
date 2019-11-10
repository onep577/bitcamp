package com.rhymes.app.store.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class OrderDetailDto {

	private int o_seq;			// 주문번호
	private String user_id;		// 주문자
	private String p_code;		// 상품상세 코드
	private int p_quantity;		// 수량
	private String o_date;		// 주문날짜
	private int confirm;		// 구매확정 여부 
	
}
