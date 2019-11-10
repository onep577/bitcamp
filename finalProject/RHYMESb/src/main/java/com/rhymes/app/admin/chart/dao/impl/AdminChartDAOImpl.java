package com.rhymes.app.admin.chart.dao.impl;

import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.chart.dao.AdminChartDAO;
import com.rhymes.app.admin.chart.model.AdminChartSearchDTO;
import com.rhymes.app.admin.chart.util.AdminChartplus0;
import com.rhymes.app.payment.model.PaymentDTO;
import com.rhymes.app.payment.model.PaymentDetailsDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AdminChartDAOImpl implements AdminChartDAO {
	
	@Autowired
	private SqlSession SqlSession;
	private String ns = "adminChartMapper.";

	// 월별 총 매출
	@Override
	public List<PaymentDTO> getSalaryPriceMonth(AdminChartSearchDTO dto) {
		// 검색된 날짜가 없었을 때 즉, 처음 들어왔을 때
		if (dto.getYear() == null || dto.getYear().equals("")) {
			Calendar cal = Calendar.getInstance();
			dto.setYear( cal.get(Calendar.YEAR) + "" );
		}

		dto.set_year(Integer.parseInt(dto.getYear())+1+"");
		List<PaymentDTO> month_chart = SqlSession.selectList(ns + "getSalaryPriceMonth", dto);
		return month_chart;
	}
	
	// 월별 총 판매 상품 개수
	@Override
	public List<PaymentDetailsDTO> getSalaryNumMonth(AdminChartSearchDTO dto) {
		// 검색된 날짜가 없었을 때 즉, 처음 들어왔을 때
		if (dto.getYear() == null || dto.getYear().equals("")) {
			Calendar cal = Calendar.getInstance();
			dto.setYear( cal.get(Calendar.YEAR) + "" );
		}

		dto.set_year(Integer.parseInt(dto.getYear())+1+"");
		List<PaymentDetailsDTO> month_chart = SqlSession.selectList(ns + "getSalaryNumMonth", dto);
		
		return month_chart;
	}

	// 일별 총 매출
	@Override
	public List<PaymentDTO> getSalaryDay(AdminChartSearchDTO dto) {
		// 검색된 날짜가 없었을 때 즉, 처음 들어왔을 때
		Calendar cal = Calendar.getInstance();
		if(dto.getYear() == null || dto.getYear().equals("")) {
			dto.setYear(cal.get(Calendar.YEAR) + "");
		}
		if(dto.getMonth() == null || dto.getMonth().equals("")) {
			dto.setMonth(cal.get(Calendar.MONTH) + 1 + "");
		}
		
		dto.set_year(Integer.parseInt(dto.getYear())+1+"");

		// 12월일 때
		if(dto.getMonth().length() == 2 && dto.getMonth().substring(1).equals("2")) {
			dto.set_year(Integer.parseInt(dto.getYear())+1+"");
			dto.set_month("01");
		}else {
			String str1 = Integer.parseInt(dto.getMonth())+1+"";
			String str2 = new AdminChartplus0().plus0( str1 );
			dto.set_month( str2 );
		}

		List<PaymentDTO> day_chart = SqlSession.selectList(ns + "getSalaryDay", dto);
		return day_chart;
	}

}
