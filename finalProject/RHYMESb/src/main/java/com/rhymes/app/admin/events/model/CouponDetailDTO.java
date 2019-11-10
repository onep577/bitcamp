package com.rhymes.app.admin.events.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponDetailDTO {

	//No,쿠폰번호,등록자ID,등록일,만료일,사용여부,사용자ID,사용일
	private int seq;
	private String coup_code;
	private String userid;
	private String gdate;
	private String expdate;
	
	private String isused;
	private String used_id;
	private String used_date;
	
	/**No Args
	 * 
	 */
	public CouponDetailDTO () { }
	
	/**새 쿠폰 발행을 위한 생성자
	 */
	public CouponDetailDTO(int seq, String coup_code) {
		this.seq = seq;
		this.coup_code = coup_code;
	}
	
	/**새 쿠폰 발행을 위한 생성자
	 */
	public CouponDetailDTO(int seq, String userid, String coup_code, String gdate, String expdate) {
		this.seq = seq;
		this.userid = userid;
		this.coup_code = coup_code;
		this.gdate = gdate;
		this.expdate = expdate;
	}
	
	/**All Args
	 * @param seq
	 * @param coup_code
	 * @param userid
	 * @param gdate
	 * @param expdate
	 * @param isused
	 * @param used_id
	 * @param used_date
	 */
	public CouponDetailDTO(int seq, String coup_code, String userid, String gdate, String expdate, String isused, String used_id, String used_date) {
		this.seq = seq;
		this.coup_code = coup_code;
		this.userid = userid;
		this.gdate = gdate;
		this.expdate = expdate;
		this.isused = isused;
		this.used_id = used_id;
		this.used_date = used_date;
	}



	
}
