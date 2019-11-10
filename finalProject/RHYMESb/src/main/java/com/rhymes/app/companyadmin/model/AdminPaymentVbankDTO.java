package com.rhymes.app.companyadmin.model;

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
public class AdminPaymentVbankDTO implements Serializable {
	private int seq;							// rhy_payment의 seq
	private String payment_code;				// 주문번호
	private String userid;						// 주문한 사람 아이디
	private String send_name;					// 주문한 사람 이름
	private String payment_status;				// 결제상태
	private int add_point;						// 추가 적립금
	private int totalprice;						// 총 결제금액
	private String rdate;						// 주문일
	private String vbank_num;					// 무통장 계좌번호
	private String vbank_date;					// 입금기한
}