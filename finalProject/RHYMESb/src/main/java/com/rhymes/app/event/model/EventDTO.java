package com.rhymes.app.event.model;

import java.io.File;
import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class EventDTO implements Serializable {
	
	private int seq;
	private String title;				// 제목
	private String type;				// 종류
	private String content;				// 내용
	private int coupon_seq1;				// 쿠폰번호
	private int coupon_seq2;				// 쿠폰번호
	private String coupon_title1;		// 쿠폰이름
	private String coupon_title2;		// 쿠폰이름
	private String photo_banner;		// 배너 이미지
	private String photo_content;		// 파일
	private Date rdate;					// 작성일
	private String sdate;				// 시작일
	private String edate;				// 종료일
	private int visible;
	
	// 시작일
	private int syear;
	private int smonth;
	private int sday;
	private int shour;
	private int sminute;
	
	// 종료일
	private int eyear;
	private int emonth;
	private int eday;
	private int ehour;
	private int eminute;
	
	// 삭제
	private String checkseq;		// 체크된 회원 아이디
	private int checklen;		// 체크 수
	
	
	// 1:1 -> 01:01 만들기
	public String sdate(int syear, int smonth, int sday) {
//		String sh = shour+"";
//		String sm = sminute+"";
//		
//		if(shour<10) {
//			sh = "0"+shour;
//		}
//		if(sminute<10) {
//			sm = "0"+sminute;
//		}
		
		sdate = syear+"-"+smonth+"-"+sday;
		return sdate;
		
	}
	
	public String edate(int eyear, int emonth, int eday) {
		
		edate = eyear+"-"+emonth+"-"+eday;

		return edate;
		
	}

	//seq만 갖는 생성자
	public EventDTO(int seq) {
		this.seq = seq;
	}
}
