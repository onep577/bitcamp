package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberOrderDTO {

	private int rnum;		//페이징 순서
	private String payment_code;	//고유 주문번호
	private String userid;		//주문자 id
	private int count;			//해당주문이 갖는 아이템 개수
	private String p_name;		//대표상품 이름
	private int totalprice;		//총 주문 금액
	private String payment_status;	//결제상태
	private String img;			//대표이미지
	private String rdate;		//결제일
	private String review_written; //후기작성여부
	
	/* 상품페이지로 이동하기 위한 정보 */
	///store/productDetail?p_seq=1041&c1_name=MEN&c2_name=OUTER&c3_name=COAT
	private int p_seq;	//상품아이디
	private String c1_name;	//상품대분류
	private String c2_name;	//중분류
	private String c3_name;	//소분류
}
