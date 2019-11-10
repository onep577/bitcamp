package com.rhymes.app.store.model;

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
public class PqnaDto {

	private int seq;
	private String id;
	private int p_seq;
	private String wdate;
	private int secret;
	private int ref;
	private int step;
	private int depth;
	private String title;
	private String content;
	private int feedback;
	private String p_name;

}
