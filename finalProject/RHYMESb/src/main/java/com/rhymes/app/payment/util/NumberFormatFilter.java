package com.rhymes.app.payment.util;

import java.text.DecimalFormat;

public class NumberFormatFilter {
	public static String commaFormat(int num) {
		DecimalFormat df = new DecimalFormat("#,###");
		return df.format(num);
	}
}

	

