package com.rhymes.app.payment.model;

import java.io.Serializable;

import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
// 주문서. 구매하기 버튼 클릭할 때 가져갈 dto
public class OrderDTO implements Serializable {
	private String id;						// 주문하는 사람 id
	private int stock_seq;					// 재고번호
	private String photo1_file;				// 파일이름
	private String p_name;					// 상품명
	private String p_title;					// 상품 타이틀
	private int quantity; 					// 주문한 수량
	private int p_price;					// 단가
	private String size;					// 사이즈
	private String p_color;					// 색상
}
