package com.rhymes.app.customer.util;

import java.util.Date;

public class FUpUtil {

	
	public static String getNewFileName(String f) {
		String filename = "";
		String fpost = "";
		if(f.indexOf('.') >= 0) {
			fpost = f.substring(f.indexOf('.')); 
			filename = new Date().getTime() + fpost;	
		}else { // 
			filename = new Date().getTime() + ".back";
		}
		return filename;
	}
}
