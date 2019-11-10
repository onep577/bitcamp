package com.rhymes.app.payment.model;

import java.io.Serializable;
import java.util.Date;

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
public class PaymentDetailsDTO implements Serializable {
	private int seq;						// 시퀀스
	private int s_seq;						// 상품재고고유번호(FK)
	private int ea;							// 구매개수
	private int price;						// 상품결제가격
	private String payment_code;			// 결제코드
	private String review_written;			// 후기작성여부
	private String rdate;					// 결제일

	// 결제 후 rhy_payment_details 디비에 넣을려고 (후기여부는 false이다)
	public PaymentDetailsDTO(int s_seq, int ea, int price, String payment_code) {
		super();
		this.s_seq = s_seq;
		this.ea = ea;
		this.price = price;
		this.payment_code = payment_code;
	}

}
