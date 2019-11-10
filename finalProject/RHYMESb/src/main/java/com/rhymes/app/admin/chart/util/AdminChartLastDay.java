package com.rhymes.app.admin.chart.util;

import java.util.Date;

public class AdminChartLastDay {
	
	public int LastDay(int month) {
		int lastDay = ( new Date( 2019, month, 0) ).getDate();
		return lastDay;
	}

}
