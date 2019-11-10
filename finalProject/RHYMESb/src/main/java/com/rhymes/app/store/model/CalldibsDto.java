package com.rhymes.app.store.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class CalldibsDto {

	private int cd_seq;			// 찜 seq
	private String user_id;		// 찜 행위를 한 user
	private String p_code;		// 상품번호(색깔o, 사이즈x)
	private String rdate;		// 찜 행위를 한 date
	String aa;
	
}
