package bit.com.a.util;

import java.util.Date;

public class FUpUtil {
	
	// f = myfile.txt => f.indexOf('.') -> 6
	// f.substring( 6 ) => .txt
	// f.substring( 0, 6 ) => myfile
	
	// myfile.txt ---> 23123213.txt
	public static String getNewFileName(String f) {
		// 들어오는 것은 myfil.txt 나가는 것은 23123213.txt
		String filename = "";
		String fpost = "";
		
		if(f.indexOf('.') >= 0) {
			// .txt 확장자명이 나온다
			fpost = f.substring(f.indexOf('.'));
			// 시간.txt	// 434535.txt
			filename = new Date().getTime() + fpost;

		}else {
			// 확장자명이 없을 때
			filename = new Date().getTime() + ".back";
		}
		return filename;
	}




}
