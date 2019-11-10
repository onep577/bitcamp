package com.rhymes.app.admin.chart.dao;

import java.util.List;
import java.util.Map;

import com.rhymes.app.admin.chart.model.AdminChartDTO;
import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;

public interface AdminChartDAO {

	// 월별 총 매출
	public List<PaymentDTO> getSalaryPriceMonth(AdminChartSearchDTO dto);

	// 일별 총 매출
	public List<PaymentDetailsDTO> getSalaryNumMonth(AdminChartSearchDTO dto);
	
	// 일별 총 매출
	public List<PaymentDTO> getSalaryDay(AdminChartSearchDTO dto);

}
