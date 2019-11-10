package com.rhymes.app.customer.model;

import java.io.Serializable;

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
public class NoticeDto implements Serializable{

	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private int readcount;
	private String filename;
	

}
