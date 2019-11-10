package com.rhymes.app.companyadmin.model.review;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**판매자가 리뷰를 확인하기 위한 DTO
 * @author minhj
 *
 */
@Getter
@Setter
@ToString
public class AdminReviewDTO {

	/* 리뷰정보 */
	private int seq;	//리뷰 고유 ID(seq)
	private int pd_seq;	//주문디테일 seq(RHY_PAYMENT_DETAILS)
	private String userid;	//리뷰작성자 ID
	private String title;	//리뷰제목
	private String content;	//리뷰내용
	private String img;		//리뷰이미지. JSON String
	private int likes_cnt;	//좋아요 수
	private String rdate;	//등록일시
	
	/* 리뷰대상 상품정보 */
	private String c_name;	//판매자이름(아이디아님)
	private String p_name;	//상품이름
	private String p_title;	//상품타이틀
	private String cp_code;	//상품코드
	private String p_color;	//상품색상
	private String size;	//상품사이즈
	private int	ea;			//상품 구매 수량
	private int quantity;	//현재 잔여 재고 수량
	
	/**NoArgs
	 * 
	 */
	@Builder
	public AdminReviewDTO() { }
	
	/**AllArgs
	 * @param seq
	 * @param pd_seq
	 * @param userid
	 * @param title
	 * @param content
	 * @param img
	 * @param likes_cnt
	 * @param rdate
	 * @param c_name
	 * @param p_name
	 * @param p_title
	 * @param cp_code
	 * @param p_color
	 * @param siez
	 * @param ea
	 * @param quantity
	 */
	@Builder
	public AdminReviewDTO(int seq, int pd_seq, String userid, String title, String content, String img, int likes_cnt,
			String rdate, String c_name, String p_name, String p_title, String cp_code, String p_color, String size,
			int ea, int quantity) {
		this.seq = seq;
		this.pd_seq = pd_seq;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.img = img;
		this.likes_cnt = likes_cnt;
		this.rdate = rdate;
		this.c_name = c_name;
		this.p_name = p_name;
		this.p_title = p_title;
		this.cp_code = cp_code;
		this.p_color = p_color;
		this.size = size;
		this.ea = ea;
		this.quantity = quantity;
	}
	
	
}