package com.rhymes.app.admin.excel.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.excel.dao.AdminExcelDAO;
import com.rhymes.app.admin.excel.model.AdminExcelProductDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.payment.model.PaymentDTO;

@Repository
public class AdminExcelDAOImpl implements AdminExcelDAO {
	
	@Autowired
	private SqlSession sqlSession;
	String e = "excel.";

	// 개인 회원 정보 전부 가져오기
	@Override
	public List<P_MemberDTO> getMemberP_ExcelDown() {
		return sqlSession.selectList(e + "getMemberP_ExcelDown");
	}

    // 사업자 회원 정보 전부 가져오기
	@Override
	public List<SellerDTO> getMemberC_ExcelDown() {
		return sqlSession.selectList(e + "getMemberC_ExcelDown");
	}

	// 결제내역 정보 전부 가져오기
	@Override
	public List<PaymentDTO> getPaymentExcelDown() {
		return sqlSession.selectList(e + "getPaymentExcelDown");
	}

	// 상품 정보 전부 가져오기
	@Override
	public List<AdminExcelProductDTO> getProductExcelDown() {
		return sqlSession.selectList(e + "getProductExcelDown");
	}

	// 업체별 상품정보
	@Override
	public List<AdminExcelProductDTO> getComProductExcelDown(String userid) {
		return sqlSession.selectList(e + "getComProductExcelDown", userid);
	}

	// 업체별 결제정보
	@Override
	public List<PaymentDTO> getComPaymentExcelDown(String userid) {
		return sqlSession.selectList(e + "getComPaymentExcelDown", userid);
	}

}
