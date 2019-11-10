package com.rhymes.app.admin.chart.service;

import java.util.List;
import java.util.Map;

import com.google.gson.JsonObject;
import com.rhymes.app.admin.chart.model.AdminChartDTO;
import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;

public interface AdminChartService {

	// 월별 총 매출
	public List<AdminChartDTO> getSalaryPriceMonth(AdminChartSearchDTO dto);

	// 월별 총 판매 상품 개수
	public List<AdminChartDTO> getSalaryNumMonth(AdminChartSearchDTO dto);
	
	// 일별 총 매출
	public List<AdminChartDTO> getSalaryDay(AdminChartSearchDTO dto);

}
