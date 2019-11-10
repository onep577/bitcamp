package com.rhymes.app.store.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
public class BasketOrderDto implements Serializable{

	private String id;
	private int stock_seq;
	private int p_quantity;
		
	
	
}
