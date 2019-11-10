package com.rhymes.app.admin.excel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.excel.dao.AdminExcelDAO;
import com.rhymes.app.admin.excel.model.AdminExcelProductDTO;
import com.rhymes.app.admin.excel.service.AdminExcelService;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.payment.model.PaymentDTO;


@Service
public class AdminExcelServiceImpl implements AdminExcelService {

	@Autowired
	AdminExcelDAO AdminExcelDAO;

	// 개인 회원 정보 전부 가져오기
	@Override
	public List<P_MemberDTO> getMemberP_ExcelDown() {
		return AdminExcelDAO.getMemberP_ExcelDown();
	}

    // 사업자 회원 정보 전부 가져오기
	@Override
	public List<SellerDTO> getMemberC_ExcelDown() {
		return AdminExcelDAO.getMemberC_ExcelDown();
	}

	// 결제내역 정보 전부 가져오기
	@Override
	public List<PaymentDTO> getPaymentExcelDown() {
		return AdminExcelDAO.getPaymentExcelDown();
	}
	
	// 상품 정보 전부 가져오기
	@Override
	public List<AdminExcelProductDTO> getProductExcelDown() {
		return AdminExcelDAO.getProductExcelDown();
	}

	// 업체별 상품정보
	@Override
	public List<AdminExcelProductDTO> getComProductExcelDown(String userid) {
		return AdminExcelDAO.getComProductExcelDown(userid);
	}

	// 업체별 결제정보
	@Override
	public List<PaymentDTO> getComPaymentExcelDown(String userid) {
		return AdminExcelDAO.getComPaymentExcelDown(userid);
	}

}
