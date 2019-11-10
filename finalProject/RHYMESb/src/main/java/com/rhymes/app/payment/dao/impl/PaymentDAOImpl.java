package com.rhymes.app.payment.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.payment.dao.PaymentDAO;
import com.rhymes.app.payment.model.OrderDTO;
import com.rhymes.app.payment.model.PaymentAfDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;
import com.rhymes.app.payment.model.PaymentParamDTO;
import com.rhymes.app.payment.model.PaymentXmlParamDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PaymentDAOImpl implements PaymentDAO {
	
	@Autowired
	private SqlSession SqlSession;
	private String p = "payment.";

	// 결제페이지에서 상품정보 가져오기
	@Override
	public OrderDTO getOrder(OrderDTO dto) {
		return SqlSession.selectOne(p + "getOrder", dto);
	}

	// 결제 전 적립금, 쿠폰 개수 가져오기
	@Override
	public PaymentParamDTO getPointAndCountCoupon(String userid) {

		int point = 0;
		try {
			point = SqlSession.selectOne(p + "getPoint", userid);
		}catch (Exception e) {	}
		
		int countCoupon = 0;
		try {
			countCoupon = SqlSession.selectOne(p + "getCountCoupon", userid);
		}catch(Exception e) {}
		
		PaymentParamDTO dto = new PaymentParamDTO(countCoupon, point);

		return dto;
	}
	

	// 결제페이지에서 쿠폰세부정보 가져오기
	@Override
	public List<MemberCouponDTO> getAllCoupon(String userid) {
		
		List<MemberCouponDTO> coupon = new ArrayList<MemberCouponDTO>();
		MemberCouponDTO dto = new MemberCouponDTO();
		dto.setTitle("쿠폰없음");
		coupon.add(dto);
		
		try {
			coupon = SqlSession.selectList(p + "getAllCoupon", userid);
		}catch(Exception e) {}
		
		return coupon;
	}

	// 회원이면 주문자 정보에 자동 입력하기 위해서
	@Override
	public P_MemberDTO getMemberInfo(String userid) {
		return SqlSession.selectOne(p + "getMemberInfo", userid);
	}
	

	
	

	// 결제완료페이지에서 새로고침하면 DB에 두번 들어가는 것 방지
	@Override
	public boolean check_Payment_code(PaymentDTO dto) {
		String payment_code = SqlSession.selectOne(p + "check_Payment_code", dto);
		if(payment_code == null) {
			return false;
		}else {
			return true;
		}
	}
	
	// 결제한 후 결제 디테일에 넣기위한 상품 개당 가격 가져오기
	@Override
	public int getPrice(int stock_seq) {
		return SqlSession.selectOne(p + "getPrice", stock_seq);
	}

	// 결제한 후 결제 디테일 저장(후기여부는 false)
	@Override
	public boolean payment_detail_save(PaymentDetailsDTO dto) {
		int count = SqlSession.insert(p + "payment_detail_save", dto);
		return count>0?true:false;
	}

	// 결제한 후 상품 수량 차감
	@Override
	public boolean disc_stock_quantity(String stock_seq, String quantity) {		
		PaymentAfDTO dto = new PaymentAfDTO(stock_seq, quantity);		
		int count = SqlSession.update(p + "disc_stock_quantity", dto);		
		return count>0?true:false;
	}

	// 결제한 후 사용 포인트 차감
	@Override
	public boolean disc_point(PaymentDTO dto) {
		int inputDiscPoint = dto.getDisc_point();		
		int count = 0;
		int result = 0;

		while(true) {
			List<PaymentXmlParamDTO> list = new ArrayList<PaymentXmlParamDTO>();
			PaymentXmlParamDTO xmlDTO = new PaymentXmlParamDTO(dto.getUserid(), count, 0, 0);

			// 만료 예정인 유효 적립금 하나를 가져온다
			list = SqlSession.selectList(p + "getPointLastById", xmlDTO);
			xmlDTO.setSeq(list.get(0).getSeq());
			xmlDTO.setPoint(list.get(0).getPoint());
			
			// 사용 적립금에서 빼준다
			inputDiscPoint = inputDiscPoint - xmlDTO.getPoint();

			// 적립금 차감
			// 사용 적립금 1000, 유효 적립금 1400
			// 가장 최신 적립금이 400원 남았다
			if(inputDiscPoint < 0) { xmlDTO.setPoint(inputDiscPoint + xmlDTO.getPoint()); result = SqlSession.update(p + "discPointByid", xmlDTO); log.warn("여기로 왔다1"); break; }
			// 사용 적립금 1000, 유효 적립금 400
			// 사용 적립금 600,  유효 적립금 1500
			// 가장 최신 적립금은 400 전부 사용했고 (used_amount = 400), 그 다음 최신 적립금은 900원 남았다
			else { result = SqlSession.update(p + "discPointByid", xmlDTO); count++; }
		}
		
		return result>0?true:false;
	}

	// 결제 내역 저장
	@Override
	public boolean payment_save(PaymentDTO dto) {
		// 결제상태 한글로 변경
		if(dto.getPayment_status().equals("ready") ) { dto.setPayment_status("미결제"); }
		else if(dto.getPayment_status().equals("paid")) { dto.setPayment_status("결제완료"); }
		else if(dto.getPayment_status().equals("cancelled")) { dto.setPayment_status("결제취소"); }
		
		// 결제수단 한글로 변경
		if(dto.getPayment_method().equals("card")) { dto.setPayment_method("카드"); }
		else if(dto.getPayment_method().equals("trans")) { dto.setPayment_method("실시간 계좌이체"); }
		else if(dto.getPayment_method().equals("vbank")) { dto.setPayment_method("무통장입금"); }
		else if(dto.getPayment_method().equals("phone")) { dto.setPayment_method("휴대전화 소액결제"); }
		else if(dto.getPayment_method().equals("kakaopay")) { dto.setPayment_method("카카오페이"); }
		
		int count = SqlSession.insert(p + "payment_save", dto);
		return count>0?true:false;
	}

	// 결제 애프터 내역 저장
	@Override
	public boolean payment_after(PaymentAfDTO dto) {
		int count = SqlSession.insert(p + "payment_after", dto);
		return count>0?true:false;
	}

	// 결제시 사용한 쿠폰을 사용으로 변환
	@Override
	public boolean update_isused_coupon(PaymentDTO dto) {
		int count = SqlSession.delete(p + "update_isused_coupon", dto);
		return count>0?true:false;
	}

	// 결제 후 배송 내역 저장
	@Override
	public boolean delivery_save(PaymentDTO dto) {		
		int count = SqlSession.insert(p + "delivery_save", dto);
		return count>0?true:false;
	}

	// 결제 후 장바구니 내역 삭제
	@Override
	public boolean delete_basket(String id) {
		int count = SqlSession.delete(p + "delete_basket", id);
		return count>0?true:false;
	}

}
