package com.rhymes.app.admin.chart.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
//매출 통계 낼 때 검색된 날짜 받는다
public class AdminChartSearchDTO implements Serializable {
	private String year;
	private String _year;
	private String month;
	private String _month;
}
