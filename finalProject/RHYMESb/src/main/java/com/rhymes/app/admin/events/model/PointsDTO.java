package com.rhymes.app.admin.events.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**적립금 이력을 조회하기 위한 DTO
  * @author minhj
  */
@Getter
@Setter
@ToString
public class PointsDTO {
	
	private int rnum;	//순서
	private int seq;	//id
	private String id;	//사용자id
	private String comment;	//적립내용
	private String coup_code;	//쿠폰사용한경우 코드
	private int amount;		//적립금액
	private String rdate;	//적립일
	private String expdate;	//만료일
	private String used_date;	//사용일
	private int used_amount;	//총 사용금액
		
	/**잔액을 리턴하는 메소드
	 * @return
	 */
	public int getTotalAmount() {
		return amount - used_amount;
	}

	/**No Args Constr
	 * 
	 */
	public PointsDTO() {}

	/**UPDATE를 위한 생성자
	 * @param seq
	 * @param comment
	 * @param amount
	 * @param used_amount
	 */
	@Builder	
	public PointsDTO(int seq, String comment, int amount, int used_amount) {
		this.seq = seq;
		this.comment = comment;
		this.amount = amount;
		this.used_amount = used_amount;
	}
	
	/**All Args Constr
	 * @param rnum
	 * @param seq
	 * @param id
	 * @param comment
	 * @param coup_code
	 * @param amount
	 * @param rdate
	 * @param expdate
	 * @param used_date
	 * @param used_amount
	 */
	public PointsDTO(int rnum, int seq, String id, String comment, String coup_code, int amount, String rdate,
			String expdate, String used_date, int used_amount) {
		super();
		this.rnum = rnum;
		this.seq = seq;
		this.id = id;
		this.comment = comment;
		this.coup_code = coup_code;
		this.amount = amount;
		this.rdate = rdate;
		this.expdate = expdate;
		this.used_date = used_date;
		this.used_amount = used_amount;
	}

	
	
}
