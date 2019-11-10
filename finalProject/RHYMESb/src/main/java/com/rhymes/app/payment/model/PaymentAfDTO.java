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
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PaymentAfDTO implements Serializable {
	private String payment_code;			// 결제번호
	private String stock_seq;				// 재고번호
	private String quantity;				// 수량	
	private int stock_quantity;				// 상품 종류가 몇개인지

	private int basket_del;					// 장바구니에서 구매했다면 장바구니 내역 지울 수 있는 변수
	private String receipt_url;				// 매출전표
	
	// 무통장입금
	private String vbank_name;				// 은행명
	private String vbank_num;				// 계좌번호
	private String vbank_holder;			// 예금주
	private String vbank_date;				// 입금기한
	
	// 카드
	private String card_apply_num;			// 카드승인번호

	// 주문한 후 상품 수량 차감할 때 필요
	public PaymentAfDTO(String stock_seq, String quantity) {
		super();
		this.stock_seq = stock_seq;
		this.quantity = quantity;
	}
}
