package com.rhymes.app.member.model.mypage;

import java.io.Serializable;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Setter
@Getter
@ToString
public class MemberPointDTO implements Serializable {

	private int rnum;
	private int seq;
	private String userid;
	private String comment;
	private int amount;
	private String rdate;
	private String edate;
	private String isExpired;
	
	private String coup_code;
	
	private String tdate;	// 출석체크 적립금 용
	
	public String getAmountStr() {
		String s = "";
		try {
			if( this.amount >= 0 ) {
				s += "+";
			}
			s += amount;
		}catch (Exception e) {
			s = "0";
		}
		return s;
	}
	
	@Builder
	public MemberPointDTO () { }
	
	/**for insert new point
	 * @param userid
	 * @param comment
	 * @param amount
	 */
	@Builder
	public MemberPointDTO(String userid, String comment, int amount) {
		this.userid = userid;
		this.comment = comment;
		this.amount = amount;
	}
	
	/**for insert new point by coupon
	 * @param userid
	 * @param comment
	 * @param amount
	 */
	@Builder
	public MemberPointDTO(String userid, String comment, int amount, String coup_code) {
		this.userid = userid;
		this.comment = comment;
		this.amount = amount;
		this.coup_code = coup_code;
	}

	@Builder
	public MemberPointDTO(int rnum, int seq, String userid, String comment, int amount, String rdate, String edate,
			String isExpired) {
		super();
		this.rnum = rnum;
		this.seq = seq;
		this.userid = userid;
		this.comment = comment;
		this.amount = amount;
		this.rdate = rdate;
		this.edate = edate;
		this.isExpired = isExpired;
	}

	
	
}
