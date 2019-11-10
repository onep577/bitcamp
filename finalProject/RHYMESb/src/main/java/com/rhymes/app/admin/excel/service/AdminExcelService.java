package com.rhymes.app.admin.excel.service;

import java.util.List;

import com.rhymes.app.admin.excel.model.AdminExcelProductDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public interface AdminExcelService {

	// 개인 회원 정보 전부 가져오기
	public List<P_MemberDTO> getMemberP_ExcelDown();

    // 사업자 회원 정보 전부 가져오기
	public List<SellerDTO> getMemberC_ExcelDown();

	// 결제내역 정보 전부 가져오기
	public List<PaymentDTO> getPaymentExcelDown();
	
	// 상품 정보 전부 가져오기
	public List<AdminExcelProductDTO> getProductExcelDown();

	// 업체별 상품정보
	public List<AdminExcelProductDTO> getComProductExcelDown(String userid);

	// 업체별 결제정보
	public List<PaymentDTO> getComPaymentExcelDown(String userid);
	
}
