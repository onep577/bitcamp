package com.rhymes.app.admin.events.model;

import java.util.Iterator;
import java.util.Map;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponDTO {

	private int rnum;
	private int seq;
	private String title;
	private String sub_title;
	private String app_cate;
	private String func;
	private int func_num;
	private String func_measure;
	private int func_time_limit;
	private String rdate;
	
	//기능 문자열 리턴. ex) 할인 50%
	public String getFunction() {
		return this.func + " " + this.func_num + this.func_measure;
	}
	
	/**No Args
	 * 
	 */
	@Builder
	public CouponDTO() { }
	
	/**새 쿠폰 생성에 활용되는 생성자
	 * @param title
	 * @param sub_title
	 * @param app_cate
	 * @param func
	 * @param func_num
	 * @param func_measure
	 * @param func_time_limit
	 */
	@Builder
	public CouponDTO(String title, String sub_title, String app_cate, String func, int func_num, String func_measure, int func_time_limit) {
		this.title = title;
		this.sub_title = sub_title;
		this.app_cate = app_cate;
		this.func = func;
		this.func_num = func_num;
		this.func_measure = func_measure;
		this.func_time_limit = func_time_limit;
	}
	
	/**새 쿠폰 생성에 활용되는 생성자 - Map을 받아서 생성
	 */
	@Builder
	public CouponDTO(Map<String, String> map) {
		
		Iterator<String> it = map.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next();
			System.out.println("key : " + key + " , value : " + map.get(key));
		}
		
		
		this.title = map.get("title");
		this.sub_title = map.get("sub_title");
		this.app_cate = map.get("app_cate");
		this.func = map.get("func");
		this.func_num = Integer.parseInt( map.get("func_num") + "" );
		this.func_measure = map.get("func_measure");
		this.func_time_limit = Integer.parseInt( map.get("func_time_limit") + "" );
	}
	
	/**All args
	 * @param rnum
	 * @param seq
	 * @param title
	 * @param sub_title
	 * @param app_cate
	 * @param func
	 * @param func_num
	 * @param func_measure
	 * @param func_time_limit
	 * @param rdate
	 */
	@Builder
	public CouponDTO(int rnum, int seq, String title, String sub_title, String app_cate, String func, int func_num,
			String func_measure, int func_time_limit, String rdate) {
		this.rnum = rnum;
		this.seq = seq;
		this.title = title;
		this.sub_title = sub_title;
		this.app_cate = app_cate;
		this.func = func;
		this.func_num = func_num;
		this.func_measure = func_measure;
		this.func_time_limit = func_time_limit;
		this.rdate = rdate;
	}	
}
