package com.rhymes.app.payment.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.payment.dao.OrdercheckDAO;
import com.rhymes.app.payment.model.DeliveryDTO;
import com.rhymes.app.payment.model.NoMemOrderCheckDTO;
import com.rhymes.app.payment.model.PaymentDTO;

@Repository
public class OrdercheckDAOImpl implements OrdercheckDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	private String o = "nomem_ordercheck.";

	// 주문조회페이지에서 주문번호, 이름 인증
	@Override
	public boolean confirm(String code, String name) {
		
		PaymentDTO dto = new PaymentDTO();
		dto.setSend_name(name);
		dto.setPayment_code(code);
		
		String _name = sqlsession.selectOne(o + "confirm", dto);
		
		if(_name == null) {
			return false;
		}else {			
			return true;
		}
	}
	
	// 주문내역 조회
	@Override
	public List<PaymentDTO> getOrdercheck() {		
		List<PaymentDTO> ordercheck_list = sqlsession.selectList(o + "getOrdercheck");		
		return ordercheck_list;
	}

	// 주문상세내역 조회
	@Override
	public List<NoMemOrderCheckDTO> getOrdercheckDetail(String payment_code) {		
		List<NoMemOrderCheckDTO> ordercheck_detail_list = sqlsession.selectList(o + "getOrdercheckDetail", payment_code);		
		return ordercheck_detail_list;
	}

	// 배송현황 조회
	@Override
	public List<DeliveryDTO> getOrdercheckDelivery(String payment_code) {		
		List<DeliveryDTO> ordercheck_delivery_list = sqlsession.selectList(o + "getOrdercheckDelivery", payment_code);
		return ordercheck_delivery_list;
	}

}
