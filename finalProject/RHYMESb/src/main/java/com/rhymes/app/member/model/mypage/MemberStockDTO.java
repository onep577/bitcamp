package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberStockDTO {
	private int s_seq;	//재고 고유번호
	private int p_seq;	//상품번호
	private String size;	//재고 사이즈
	private int quantity;	//재고 수량
	
	public MemberStockDTO() { }

	public MemberStockDTO(int s_seq, int p_seq, String size, int quantity) {
		this.s_seq = s_seq;
		this.p_seq = p_seq;
		this.size = size;
		this.quantity = quantity;
	}
}
