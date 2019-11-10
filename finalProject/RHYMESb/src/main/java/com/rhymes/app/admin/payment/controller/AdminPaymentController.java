package com.rhymes.app.admin.payment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.payment.model.AdminPaymentDetailDTO;
import com.rhymes.app.admin.payment.model.AdminPaymentParam;
import com.rhymes.app.admin.payment.service.AdminPaymentService;
import com.rhymes.app.payment.model.PaymentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/payment")
public class AdminPaymentController {
	
	@Autowired
	AdminPaymentService adminPaymentService;
	
	// 관리자페이지 결제내역조회
	@GetMapping("/success")
	public String success(Model model, AdminPaymentParam param) {
		//페이징
		// 클릭한 페이지
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11 21
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20 30
		
		param.setStart(start);
		param.setEnd(end);
		
		// list
		List<PaymentDTO> orderSuccessList = adminPaymentService.getOrderSuccessList(param);
		// list 총 개수
		List<PaymentDTO> totalRecordCount = adminPaymentService.getOrderSuccessCount(param);

		// list 총 개수와 클릭한 페이지를 set
		param.setTotalRecordCount(totalRecordCount.size());
		param.setPageNumber(sn);

		model.addAttribute("orderSuccessList", orderSuccessList);
		model.addAttribute("param", param);
		
		return "success";
	} 
	
	// 관리자페이지 결제상상세내역조회
	@GetMapping("/detail")
	public String detail(Model model, PaymentDTO dto) {
		List<AdminPaymentDetailDTO> orderDetail = adminPaymentService.getOrderDetail(dto);
		model.addAttribute("orderDetail",orderDetail);
		return "detail";
	}
	
}
