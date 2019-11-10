package com.rhymes.app.admin.payment.dao;

import java.util.List;

import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.payment.model.PaymentDTO;

public interface AdminPaymentDAO {

	// 관리자페이지 결제내역조회
	public List<PaymentDTO> getOrderSuccessList(AdminPaymentParam param);

	// 관리자페이지 결제내역 총 개수
	public List<PaymentDTO> getOrderSuccessCount(AdminPaymentParam param);
	
	// 관리자페이지 결제상상세내역조회
	public List<AdminPaymentDetailDTO> getOrderDetail(PaymentDTO dto);

}
