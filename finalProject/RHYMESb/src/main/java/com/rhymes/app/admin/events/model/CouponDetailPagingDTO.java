package com.rhymes.app.admin.events.model;

import com.rhymes.app.common.model.CommonPagingDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CouponDetailPagingDTO extends CommonPagingDTO {
	private int seq;

	public CouponDetailPagingDTO() {
		super();
	}
	
	public CouponDetailPagingDTO(int seq) {
		super();
		this.seq = seq;
	}
}
