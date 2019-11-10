package com.rhymes.app.customer.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class QnaDto {

	private int seq;
	private String id;
	private String category;
	private int ref;
	private int step;
	private int depth;
	private String title;
	private String content;
	private String wdate;
	private String orderno;
	private String filename;
	private int feedback;
	
}
