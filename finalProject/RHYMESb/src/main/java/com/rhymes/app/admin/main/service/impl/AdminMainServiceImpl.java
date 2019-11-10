package com.rhymes.app.admin.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.main.dao.AdminMainResourceDao;
import com.rhymes.app.admin.main.model.MainResourceDto;
import com.rhymes.app.admin.main.service.AdminMainService;
import com.rhymes.app.store.model.ProductDto;

@Service
public class AdminMainServiceImpl implements AdminMainService {

	@Autowired AdminMainResourceDao resourceDao;
	
	@Override
	public MainResourceDto getmainresource() throws Exception {
		return resourceDao.getmainresource();
	}

	@Override
	public boolean updatemainresource(MainResourceDto resource) throws Exception {
		return resourceDao.updatemainresource(resource);
	}

	@Override
	public boolean updatemaintext(MainResourceDto resource) throws Exception {
		return resourceDao.updatemaintext(resource);
	}

	@Override
	public List<ProductDto> getbestitem(ProductDto product) throws Exception {
		return resourceDao.getbestitem(product);
	}

}
