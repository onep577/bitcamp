package com.rhymes.app.payment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.dao.PaymentDAO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentAfDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;
import com.rhymes.app.payment.model.PaymentParamDTO;
import com.rhymes.app.payment.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	PaymentDAO PaymentDao;

	// 결제페이지에서 상품정보 가져오기
	@Override
	public OrderDTO getOrder(OrderDTO dto, int p_quantity, String userid) {
		
		OrderDTO order = PaymentDao.getOrder(dto);
		
		// db에는 재고수량이 있고 주문수량은 없다 매개변수로 받은 주문수량을 직접 넣는다
		order.setQuantity(p_quantity);

		// 리스트에 구매회원 id를 직접 넣는다
		order.setId(userid);
		
		return order;
	}
	
	// 결제페이지 전 적립금과 쿠폰 개수 가져오기
	@Override
	public PaymentParamDTO getPointAndCountCoupon(String userid, List<OrderDTO> basketList) {
		
		PaymentParamDTO pay_dto = PaymentDao.getPointAndCountCoupon(userid);

		// 총금액 계산
		int product_price = basketList.get(0).getP_price() * basketList.get(0).getQuantity();

		// 총금액이 10,000원 미만이면 배송비 = 3,000원이다
		int delivery_price = 0;
		if(product_price < 10000) {
			delivery_price = 3000;
		}
		
		pay_dto.setProduct_price(product_price);
		pay_dto.setDelivery_price(delivery_price);
		
		return pay_dto;
	}

	// 결제페이지에서 쿠폰 세부사항 가져오기
	@Override
	public List<MemberCouponDTO> getAllCoupon(String userid) {
		return PaymentDao.getAllCoupon(userid);
	}

	// 회원이면 주문자 정보에 자동 입력하기 위해서
	@Override
	public P_MemberDTO getMemberInfo(String userid) {
		return PaymentDao.getMemberInfo(userid);
	}
	
	


	// 결제완료페이지에서 새로고침하면 DB에 두번 들어가는 것 방지
	@Override
	public boolean check_Payment_code(PaymentDTO dto) {
		return PaymentDao.check_Payment_code(dto);
	}
	
	// 결제한 후 결제 디테일에 넣기위한 상품 개당 가격 가져오기
	@Override
	public int getPrice(int stock_seq) {
		return PaymentDao.getPrice(stock_seq);
	}

	// 결제한 후 결제 디테일 저장(후기여부는 false)
	@Override
	public boolean payment_detail_save(PaymentDetailsDTO dto) {
		return PaymentDao.payment_detail_save(dto);
	}

	// 결제한 후 상품 수량 차감
	@Override
	public boolean disc_stock_quantity(String stock_seq, String quantity) {
		return PaymentDao.disc_stock_quantity(stock_seq, quantity);
	}

	// 결제한 후 사용 포인트 차감
	@Override
	public boolean disc_point(PaymentDTO dto) {
		return PaymentDao.disc_point(dto);
	}

	// 결제 내역 저장
	@Override
	public boolean payment_save(PaymentDTO dto) {
		return PaymentDao.payment_save(dto);
	}

	// 결제 애프터 내역 저장
	@Override
	public boolean payment_after(PaymentAfDTO dto) {
		return PaymentDao.payment_after(dto);
	}
	
	// 결제시 사용한 쿠폰을 사용으로 변환
	@Override
	public boolean update_isused_coupon(PaymentDTO dto) {
		return PaymentDao.update_isused_coupon(dto);
	}
	
	// 결제 후 배송 내역 저장
	@Override
	public boolean delivery_save(PaymentDTO dto) {
		return PaymentDao.delivery_save(dto);
	}
	
	// 결제 후 장바구니 내역 삭제
	@Override
	public boolean delete_basket(String id) {
		return PaymentDao.delete_basket(id);
	}

}
