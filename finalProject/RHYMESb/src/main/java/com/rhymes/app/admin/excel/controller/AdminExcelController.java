package com.rhymes.app.admin.excel.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.rhymes.app.admin.excel.model.AdminExcelProductDTO;
import com.rhymes.app.admin.excel.service.AdminExcelService;
import com.rhymes.app.admin.excel.util.listMemberExcelDownload;
import com.rhymes.app.admin.excel.util.listPaymentExcelDownload;
import com.rhymes.app.admin.excel.util.listProductExcelDownload;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.payment.model.PaymentDTO;

@RequestMapping("/admin/excel")
@Controller
public class AdminExcelController {
	
	@Autowired
	AdminExcelService excelService;
	
	// 엑셀 다운로드 페이지로 이동
	@RequestMapping("/move")
	public String excel() throws Exception {
		return "excel";
	}
	
	// 회원 정보 다운로드
	@GetMapping("/member")
	public View member(Model model) throws Exception {
		// 개인 회원 정보 전부 가져오기
	    List<P_MemberDTO> mem_p_list = excelService.getMemberP_ExcelDown();
	    model.addAttribute("mem_p_list", mem_p_list);		
	    // 사업자 회원 정보 전부 가져오기
	    List<SellerDTO> mem_c_list = excelService.getMemberC_ExcelDown();
	    model.addAttribute("mem_c_list", mem_c_list);		
		return new listMemberExcelDownload();
	}
	
	// 결제내역 정보 전부 가져오기
	@GetMapping("/payment")
	public View payment(Model model) throws Exception {		
	    List<PaymentDTO> payment_list = excelService.getPaymentExcelDown();
	    model.addAttribute("payment_list", payment_list);	    
		return new listPaymentExcelDownload();
	}
	
	// 상품 정보 전부 가져오기
	@GetMapping("/product")
	public View product(Model model) throws Exception {		
	    List<AdminExcelProductDTO> product_list = excelService.getProductExcelDown();
	    model.addAttribute("product_list", product_list);
		return new listProductExcelDownload();
	}
	
	// 업체별 상품정보
	@GetMapping("/company/product")
	public View companyproduct(Model model, Principal pcp) throws Exception {
		List<AdminExcelProductDTO> product_list = excelService.getComProductExcelDown(pcp.getName());
	    model.addAttribute("product_list", product_list);
		return new listProductExcelDownload();
	}
	
	// 업체별 결제정보
	@GetMapping("/company/payment")
	public View companypayment(Model model, Principal pcp) throws Exception {
		List<PaymentDTO> payment_list = excelService.getComPaymentExcelDown(pcp.getName());
	    model.addAttribute("payment_list", payment_list);
		return new listPaymentExcelDownload();
	}
	
}


