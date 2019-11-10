package com.rhymes.app.common.util;

import java.util.Date;

/**파일업로드를 위한 util 클래스
 * @author minhj
 *
 */
public class FUpUtil {
	// 파일이름을 시간값으로 변경해주는 메소드
	// 예_) myfile.txt -> 231321513.txt
	public static String name(String f) {
		String filename = "";
		String fpost = "";
		
		if( f.indexOf('.') >= 0) {
			fpost = f.substring( f.indexOf('.') );	//확장자명
			filename = new Date().getTime() + fpost;	//ms단위의 시간을 받아옴
			System.out.println("fpost : " + fpost);
			System.out.println("filename : " + filename);
		}else { //확장자명이 없을 때 임의 확장자 이름으로 설정
			filename = new Date().getTime() + ".back";
		}
		
		return filename;
	}
}
