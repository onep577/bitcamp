package com.rhymes.app.payment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.payment.dao.OrdercheckDAO;
import com.rhymes.app.payment.model.DeliveryDTO;
import com.rhymes.app.payment.model.NoMemOrderCheckDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.service.OrdercheckService;

@Service
public class OrdercheckServiceImpl implements OrdercheckService {
	
	@Autowired
	OrdercheckDAO OrdercheckDao;

	// 주문조회페이지에서 주문번호, 이름 인증
	@Override
	public boolean confirm(String code, String name) {
		return OrdercheckDao.confirm(code, name);
	}

	// 주문내역 조회
	@Override
	public List<PaymentDTO> getOrdercheck() {
		return OrdercheckDao.getOrdercheck();
	}

	// 주문상세내역 조회
	@Override
	public List<NoMemOrderCheckDTO> getOrdercheckDetail(String payment_code) {
		return OrdercheckDao.getOrdercheckDetail(payment_code);
	}

	// 배송현황 조회
	@Override
	public List<DeliveryDTO> getOrdercheckDelivery(String payment_code) {
		return OrdercheckDao.getOrdercheckDelivery(payment_code);
	}

}
