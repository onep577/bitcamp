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
public class PaymentXmlParamDTO implements Serializable {
	private String userid;					// 구매회원 id
	private int count;						// limit의 변수값
	private int seq;						// getPointLastById에서 받은 seq
	private int point;						// getPointLastById에서 받은 적립금
}
