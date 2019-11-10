package com.rhymes.app.payment.service;

import java.util.List;

import com.rhymes.app.payment.model.DeliveryDTO;
import com.rhymes.app.payment.model.NoMemOrderCheckDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public interface OrdercheckService {
	
	// 주문조회페이지에서 주문번호, 이름 인증
	public boolean confirm(String code, String name);
	
	// 주문내역 조회
	public List<PaymentDTO> getOrdercheck();
	
	// 주문상세내역 조회
	public List<NoMemOrderCheckDTO> getOrdercheckDetail(String payment_code);
	
	// 배송현황 조회
	public List<DeliveryDTO> getOrdercheckDelivery(String payment_code);

}
