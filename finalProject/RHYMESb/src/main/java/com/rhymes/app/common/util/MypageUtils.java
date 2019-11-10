package com.rhymes.app.common.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.rhymes.app.admin.events.model.CouponDetailDTO;

public class MypageUtils {

	/**cnt개수만큼 쿠폰번호 리스트 리턴
	 * @param cnt
	 */
	public static List<CouponDetailDTO> getRandCoupsTimestampList(int seq, int cnt) {
		Random rnd =new Random();
		List<CouponDetailDTO> codeList = new ArrayList();
		
		for(int j = 0 ; j < cnt ; j++ ) {
			StringBuffer buf =new StringBuffer();
			String timeStamp = new Date().getTime() + "";
			buf.append(timeStamp.substring(6, timeStamp.length()) + "-");
			for(int i = 0 ; i < 8 ; i++){
				if(i == 4) {
					buf.append("-");
				}
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+65));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			    
			}
			codeList.add(new CouponDetailDTO(seq, buf.toString()));
		}
		
		return codeList;
	}
	
	/**cnt개수만큼 쿠폰번호 생성
	 * @param cnt
	 */
	public static void printRandCoupsTimestamp(int cnt) {
		Random rnd =new Random();
		
		for(int j = 0 ; j < cnt ; j++ ) {
			StringBuffer buf =new StringBuffer();
			String timeStamp = new Date().getTime() + "";
			buf.append(timeStamp.substring(6, timeStamp.length()) + "-");
			for(int i = 0 ; i < 8 ; i++){
				if(i == 4) {
					buf.append("-");
				}
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+65));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			    
			}
			System.out.println(buf);
		}
	}
	
	/**랜덤 쿠폰번호 쿼리를 콘솔에 출력하는 메소드
	 * 
	 */
	public static void printRandCoupsUpdate(int cnt, int scale, int seq) {
		Random rnd =new Random();
		
		for(int j = 0 ; j < cnt ; j++ ) {
			StringBuffer buf =new StringBuffer();
			buf.append("UPDATE RHY_MEM_COUPON_DETAIL SET COUP_CODE='");
			for(int i = 0 ; i < scale ; i++){
				if(i%4 == 0 && i != 0) {
			    	buf.append("-");
			    }
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+65));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			    
			}
			buf.append("' WHERE SEQ=" + j +  " ;");
			System.out.println(buf);
		}
	}
	
	public static void printRandCoupsInsert(int cnt, int scale, int seq) {
		Random rnd =new Random();
		
		for(int j = 0 ; j < cnt ; j++ ) {
			StringBuffer buf =new StringBuffer();
			buf.append("INSERT RHY_MEM_COUPON_DETAIL (C_SEQ, COUP_CODE ) VALUES( 2, '");
			for(int i = 0 ; i < scale ; i++){
				if(i%4 == 0 && i != 0) {
			    	buf.append("-");
			    }
			    if(rnd.nextBoolean()){
			        buf.append((char)((int)(rnd.nextInt(26))+65));
			    }else{
			        buf.append((rnd.nextInt(10)));
			    }
			    
			}
			buf.append("') ;");
			System.out.println(buf);
		}
	}
}
