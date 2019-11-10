package com.rhymes.app.companyadmin.service;

import java.util.List;

import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.companyadmin.model.AdminPaymentVbankDTO;
import com.rhymes.app.payment.model.DeliveryDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public interface CompanyAdminPaymentService {
	
	// 주문내역
	public List<PaymentDTO> getOrderSuccessList(AdminPaymentParam param);

	// 주문내역 총 개수
	public List<PaymentDTO> getOrderSuccessCount(AdminPaymentParam param);
	
	// 마켓명
	public String getMarketName(String userid);
	
	// 주문상세내역
	public List<AdminPaymentDetailDTO> getOrderDetail(PaymentDTO dto);
	
	// 무통장입금 관리
	public List<AdminPaymentVbankDTO> getVbankList(String userid);
	
	// 결제완료로 변경
	public boolean paymentfinish(String seq);

	
	
	// 배송
	// 배송 준비 중
	public List<DeliveryDTO> getDeliveryReadyList(String userid);
	
	// 배송 중
	public List<DeliveryDTO> getDeliveryIngList(String userid);
	
	// 배송준비 중 -> 배송 중
	public boolean getDeliveryIngChange(String payment_code);
	
	// 배송중 -> 배송완료
	public boolean getDeliveryFinishChange(String payment_code);

	// 추가 적립금 저장
	public boolean add_point(String userid, String add_point);

}
