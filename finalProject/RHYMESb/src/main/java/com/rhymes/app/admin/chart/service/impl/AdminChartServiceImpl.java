package com.rhymes.app.admin.chart.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.chart.dao.AdminChartDAO;
import com.rhymes.app.admin.chart.model.AdminChartDTO;
import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.admin.chart.service.AdminChartService;
import com.rhymes.app.admin.chart.util.AdminChartLastDay;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminChartServiceImpl implements AdminChartService {

	@Autowired
	AdminChartDAO AdminChartDAO;

	// 월별 총 매출
	@Override
	public List<AdminChartDTO> getSalaryPriceMonth(AdminChartSearchDTO dto) {
		// 월별 총 매출 (매출이 없는 달은 컬럼이 없다) 1월 ~ 10월 까지만 값이 있고 11월, 12월은 매출이 없다면 list의 size는 10이다
		List<PaymentDTO> month_chart = AdminChartDAO.getSalaryPriceMonth(dto);
		//JsonObject jo = new JsonObject();
		List<AdminChartDTO> chart = new ArrayList<AdminChartDTO>();
		
		String title[] = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };

		// 매출이 없는 달에 값을 0 넣는다. 여기서 list의 size가 무조건 12가 된다
		int i = 0;
		for (int j = 0; j < title.length; j++) {

			// 마지막 데이터 이후에도 날이 계속되는 경우 day_chart.get(i).getRdate()에서 에러난다 왜? i가 없어서
			if (month_chart.size() != i) {
				if (month_chart.get(i).getRdate().equals(title[j])) {
					AdminChartDTO chart_dto = new AdminChartDTO(month_chart.get(i).getRdate(), month_chart.get(i).getTotalprice(), month_chart.get(i).getRdate());
					chart.add(chart_dto);
					//jo.addProperty(month_chart.get(i).getRdate(), month_chart.get(i).getTotalprice());
					i++;
				} else {
					AdminChartDTO chart_dto = new AdminChartDTO(title[j], 0, title[j]);
					chart.add(chart_dto);
					//jo.addProperty(title[j], 0);
				}
			}else {
				while (j < 12) {
					AdminChartDTO chart_dto = new AdminChartDTO(title[j], 0, title[j]);
					chart.add(chart_dto);
					//jo.addProperty(title[j], 0);
					j++;
				}
				return chart;
			}
			
		} // for

		return chart;
	}

	// 월별 총 판매 상품 개수
	@Override
	public List<AdminChartDTO> getSalaryNumMonth(AdminChartSearchDTO dto) {
		// 월별 총 매출 (매출이 없는 달은 컬럼이 없다) 1월 ~ 10월 까지만 값이 있고 11월, 12월은 매출이 없다면 list의 size는 10이다
		List<PaymentDetailsDTO> month_chart = AdminChartDAO.getSalaryNumMonth(dto);
		//JsonObject jo = new JsonObject();
		List<AdminChartDTO> chart = new ArrayList<AdminChartDTO>();
		
		String title[] = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" };

		// 매출이 없는 달에 값을 0 넣는다. 여기서 list의 size가 무조건 12가 된다
		int i = 0;
		for (int j = 0; j < title.length; j++) {

			// 마지막 데이터 이후에도 날이 계속되는 경우 day_chart.get(i).getRdate()에서 에러난다 왜? i가 없어서
			if (month_chart.size() != i) {
				if (month_chart.get(i).getRdate().equals(title[j])) {
					AdminChartDTO chart_dto = new AdminChartDTO(month_chart.get(i).getRdate(), month_chart.get(i).getEa());
					chart.add(chart_dto);
					//jo.addProperty(month_chart.get(i).getRdate(), month_chart.get(i).getTotalprice());
					i++;
				} else {
					AdminChartDTO chart_dto = new AdminChartDTO(title[j], 0);
					chart.add(chart_dto);
					//jo.addProperty(title[j], 0);
				}
			}else {
				while (j < 12) {
					AdminChartDTO chart_dto = new AdminChartDTO(title[j], 0);
					chart.add(chart_dto);
					//jo.addProperty(title[j], 0);
					j++;
				}
				return chart;
			}
			
		} // for

		return chart;
	}

	// 일별 총 매출
	@Override
	public List<AdminChartDTO> getSalaryDay(AdminChartSearchDTO dto) {
		List<PaymentDTO> day_chart = AdminChartDAO.getSalaryDay(dto);
		//JsonObject jo = new JsonObject();
		List<AdminChartDTO> chart = new ArrayList<AdminChartDTO>();
		int lastday = new AdminChartLastDay().LastDay(Integer.parseInt(dto.getMonth()));

		String title[] = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
				"16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31" };

		// 매출이 없는 날에 값을 0 넣는다. 여기서 list의 size가 무조건 그 달의 마지막날과 같아진다		
		int i = 0;
		for (int j = 0; j < lastday; j++) {

			// 마지막 데이터 이후에도 날이 계속되는 경우 day_chart.get(i).getRdate()에서 에러난다 왜? i가 없어서
			if (day_chart.size() != i) {
				if (day_chart.get(i).getRdate().equals(title[j])) {
					AdminChartDTO chart_dto = new AdminChartDTO(day_chart.get(i).getRdate(), day_chart.get(i).getTotalprice());
					chart.add(chart_dto);
					//jo.addProperty(day_chart.get(i).getRdate(), day_chart.get(i).getTotalprice());
					i++;
				} else {
					AdminChartDTO chart_dto = new AdminChartDTO(title[j], 0);
					chart.add(chart_dto);
					//jo.addProperty(title[j], 0);
				}
			}else {
				// 그 달의 마지막날까지만 데이터가 있어야한다
				while (j < lastday) {
					AdminChartDTO chart_dto = new AdminChartDTO(title[j], 0);
					chart.add(chart_dto);
					//jo.addProperty(title[j], 0);
					j++;
				}
				return chart;
			}
			
		} // for

		return chart;
	}

}
