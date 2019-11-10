package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**상품후기 목록을 보여주기 위한 DTO
 * @author minhj
 *
 */
@Getter
@Setter
@ToString
public class MemberReviewDTO {

	private int rnum;	//정렬 번호
	private int seq;	//주문detail ID(seq)
	private String payment_code;	//주문번호
	private String userid;	//작성한 유저 ID
	private String p_name;	//상품이름
	private String p_title;	//상품 설명
	private int totalprice;	//주문의 총 주문금액
	private int price;		//주문한 상품의 개별 금액
	private int ea;			//주문한 상품 개수
	
	private String payment_status;	//결제상태
	private String delivery_status;	//배송상태
	
	private String img;		//상품 대표이미지
	private String rdate;	//주문날짜
	private String edate;	//배송완료된경우 배송날짜
	
	private String review_written;	//후기작성여부
	
	/* 상품정보로 이동하기 위한 정보 */
	private int p_seq;	//상품ID
	private String c1_name;	//대분류
	private String c2_name;	//중분류
	private String c3_name;	//소분류
	
	public MemberReviewDTO() { }
	
	/**결제상태와 배송상태에 따른 최종 상태
	 * @return
	 */
	public String getFinal_status() {
		if( null != this.getPayment_status()
			&& "결제완료".equals(this.getPayment_status())) {			
			return this.getDelivery_status();
		}else {
			return this.getPayment_status();
		}
	}
}
