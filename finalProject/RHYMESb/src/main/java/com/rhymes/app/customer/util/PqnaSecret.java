package com.rhymes.app.customer.util;

public class PqnaSecret {

private int secret = 0;
	
	
	public void setSecret(int secret) {
		this.secret = secret;
	}
	
	public String getArrow(){
		
		String sc = "<img src='/img/customer-img/wkanfthl.png' width='20px' height='15px' />";
		String ts="";
		
		return secret == 0 ? "" : ts+sc;
	}
	
}
	