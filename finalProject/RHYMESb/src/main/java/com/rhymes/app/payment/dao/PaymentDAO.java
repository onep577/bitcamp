package com.rhymes.app.payment.dao;

import java.util.List;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentAfDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;
import com.rhymes.app.payment.model.PaymentParamDTO;

public interface PaymentDAO {
	
	// 결제페이지 전
	// 결제페이지에서 상품정보 가져오기
	public OrderDTO getOrder(OrderDTO dto);
	
	// 결제 전 적립금, 쿠폰 개수 가져오기
	public PaymentParamDTO getPointAndCountCoupon(String userid);
	
	// 결제페이지에서 쿠폰 세부사항 가져오기
	public List<MemberCouponDTO> getAllCoupon(String userid);

	// 회원이면 주문자 정보에 자동 입력하기 위해서
	public P_MemberDTO getMemberInfo(String userid);
	


	//////////// 결제페이지 후
	// 결제완료페이지에서 새로고침하면 DB에 두번 들어가는 것 방지
	public boolean check_Payment_code(PaymentDTO dto);
	
	// 결제한 후 결제 디테일에 넣기위한 상품 개당 가격 가져오기
	public int getPrice(int stock_seq);
	
	// 결제한 후 결제 디테일 저장(후기여부는 false)
	public boolean payment_detail_save(PaymentDetailsDTO dto);
	
	// 결제한 후 상품 수량 차감
	public boolean disc_stock_quantity(String stock_seq, String quantity);

	// 결제한 후 사용 포인트 차감
	public boolean disc_point(PaymentDTO dto);

	// 결제 내역 저장
	public boolean payment_save(PaymentDTO dto);
	
	// 결제 애프터 내역 저장
	public boolean payment_after(PaymentAfDTO dto);
	
	// 결제시 사용한 쿠폰을 사용으로 변환
	public boolean update_isused_coupon(PaymentDTO dto);
	
	// 결제 후 배송 내역 저장
	public boolean delivery_save(PaymentDTO dto);
	
	// 결제 후 장바구니 내역 삭제
	public boolean delete_basket(String id);
	
	
}
