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
public class FaqDto implements Serializable{

	private int seq;
	private String category;
	private String id;
	private String title;
	private String content;
	
}
