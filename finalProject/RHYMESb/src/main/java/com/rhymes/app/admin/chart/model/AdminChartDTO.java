package com.rhymes.app.admin.chart.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AdminChartDTO implements Serializable {
	private String name;
	private int y;
	private String drilldown;
	
	public AdminChartDTO(String name, int y) {
		super();
		this.name = name;
		this.y = y;
	}
}
