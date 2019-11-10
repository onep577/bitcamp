package com.rhymes.app.admin.chart.util;

public class AdminChartplus0 {
	
	public String plus0(String str) {
		if(str.length() == 1) {
			return "0" + str;
		}else {
			return str;
		}
	}
	
	public String minus0(String str) {
		if(str.substring(0,1).equals("0")) {
			return str.substring(1);
		}else {
			return str;
		}
	}

}
