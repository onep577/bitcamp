package com.rhymes.app.admin.payment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.payment.dao.AdminPaymentDAO;
import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.admin.payment.service.AdminPaymentService;
import com.rhymes.app.payment.model.PaymentDTO;

@Service
public class AdminPaymentServiceImpl implements AdminPaymentService {
	
	@Autowired
	AdminPaymentDAO AdminPaymentDAO;

	// 관리자페이지 결제내역조회
	@Override
	public List<PaymentDTO> getOrderSuccessList(AdminPaymentParam param) {
		return AdminPaymentDAO.getOrderSuccessList(param);
	}

	// 관리자페이지 결제내역 총 개수
	@Override
	public List<PaymentDTO> getOrderSuccessCount(AdminPaymentParam param) {
		return AdminPaymentDAO.getOrderSuccessCount(param);
	}

	// 관리자페이지 결제상상세내역조회
	@Override
	public List<AdminPaymentDetailDTO> getOrderDetail(PaymentDTO dto) {
		return AdminPaymentDAO.getOrderDetail(dto);
	}

}
