package com.rhymes.app.admin.main.service;

import java.io.Serializable;
import java.util.List;

import com.rhymes.app.admin.main.model.MainResourceDto;
import com.rhymes.app.store.model.ProductDto;

public interface AdminMainService extends Serializable{

	public MainResourceDto getmainresource() throws Exception;
	public boolean updatemainresource(MainResourceDto resource) throws Exception;
	public boolean updatemaintext(MainResourceDto resource) throws Exception;
	public List<ProductDto> getbestitem(ProductDto product) throws Exception;
}
