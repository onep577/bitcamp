package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**주문내역 상세내역을 저장하기 위한 클래스
 * @author minhj
 *
 */
@Getter
@Setter
@ToString
public class MemberOrderDetailDTO {

	private int seq;	//디테일ID(seq)
	private int s_seq;	//재고ID(Stock_SEQ)
	private String img;	//대표이미지
	private String p_name;	//상품이름
	private int p_price;	//상품가격
	private int ea;		//구매수량
	private String payment_status;	//결제상태
	private String delivery_status;	//배송상태
	private String delivery_post_code;	//송장번호
	private String review_written;	//리뷰작성여부
	
	/* 상품페이지로 이동하기 위한 정보 */
	///store/productDetail?p_seq=1041&c1_name=MEN&c2_name=OUTER&c3_name=COAT
	private int p_seq;	//상품아이디
	private String c1_name;	//상품대분류
	private String c2_name;	//중분류
	private String c3_name;	//소분류
}