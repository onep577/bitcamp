package com.rhymes.app.member.model.mypage;

import java.io.Serializable;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
public class MemberCouponDTO implements Serializable {
	
	private int rnum;	//페이징 조건에 따른 넘버링 변수
	private int seq;	//seq
	private String title;	//쿠폰설명
	private String sub_title;	//쿠폰 상세설명
	private String app_cate;	//쿠폰 적용 카테고리
	
	private String func;	//적립/할인 구분
	private int func_num;	//적립/할인 숫자 (ex_ 1000)
	private String func_measure;	//적립/할인 단위(ex_ %, 원 등)
	private int func_time_limit;	//만료기간
	
	private String userid;	//쿠폰을 갖고 있는 유저 이름
	private String gdate;	//쿠폰 취득일 get date
	private String expdate;	//쿠폰 만료일 expire date
	private String coup_code;	//쿠폰 고유 코드번호
	private String isused;	//쿠폰 사용 또는 만료여부 (미사용/사용/만료)
	
	
	@Builder
	public MemberCouponDTO() { }

	@Builder
	public MemberCouponDTO(int rnum, String title, String sub_title, String func, String app_cate, int func_num, String func_measure,
			String userid, String gdate, String expdate, String coup_code, String isused) {
		super();
		this.rnum = rnum;
		this.title = title;
		this.sub_title = sub_title;
		this.app_cate = app_cate;
		this.func = func;
		this.func_num = func_num;
		this.func_measure = func_measure;
		this.userid = userid;
		this.gdate = gdate;
		this.expdate = expdate;
		this.coup_code = coup_code;
		this.isused = isused;
	}	
	
}
