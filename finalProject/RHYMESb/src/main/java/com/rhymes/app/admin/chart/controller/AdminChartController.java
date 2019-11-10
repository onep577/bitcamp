package com.rhymes.app.admin.chart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.chart.model.AdminChartDTO;
import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.admin.chart.service.AdminChartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/chart")
public class AdminChartController {
	
	@Autowired
	AdminChartService ChartService;
	
	@GetMapping("/salary")
	public String salary(Model model, AdminChartSearchDTO dto) {
		// 월별 총 매출
		List<AdminChartDTO> monthPriceJson = ChartService.getSalaryPriceMonth(dto);
		// 월별 총 판매 상품 개수
		List<AdminChartDTO> monthNumJson = ChartService.getSalaryNumMonth(dto);
		// 일별 총 매출
		List<AdminChartDTO> dayJson = ChartService.getSalaryDay(dto);
		// 검색된 데이터
		AdminChartSearchDTO search = new AdminChartSearchDTO(dto.getYear()+"", "0", dto.getMonth()+"", "0");
		
		model.addAttribute("monthPriceJson", monthPriceJson);
		model.addAttribute("monthNumJson", monthNumJson);
		model.addAttribute("dayJson", dayJson);
		model.addAttribute("search", search);
		
		return "/chart/salary";
	}

}
