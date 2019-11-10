package com.rhymes.app.admin.used.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.used.dao.AdminUsedDao;
import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.admin.used.model.AdminBlParam;
import com.rhymes.app.admin.used.model.AdminSParam;
import com.rhymes.app.admin.used.service.AdminUsedService;
import com.rhymes.app.used.model.BlacklistDto;
import com.rhymes.app.used.model.ProductsDto;

@Service
public class AdminUsedServiceImpl implements AdminUsedService {

	@Autowired
	AdminUsedDao adminUsedDao;
	
	@Override
	public List<ProductsDto> getAdminUsedlist(AdminBbsParam adparam) {
		// TODO Auto-generated method stub
		return adminUsedDao.getAdminUsedlist(adparam);
	}

	@Override
	public int getAdminBbsCount(AdminBbsParam adparam) {
		// TODO Auto-generated method stub
		return adminUsedDao.getAdminBbsCount(adparam);
	}

	@Override
	public List<BlacklistDto> getAdminBlacklist(AdminBlParam blparam) {
		// TODO Auto-generated method stub
		return adminUsedDao.getAdminBlacklist(blparam);
	}

	@Override
	public int getAdminBlCount(AdminBlParam blparam) {
		// TODO Auto-generated method stub
		return adminUsedDao.getAdminBlCount(blparam);
	}

	@Override
	public boolean AdminBanCount(String string) {
		// TODO Auto-generated method stub
		return adminUsedDao.AdminBanCount(string);
	}

	@Override
	public boolean AdminBanReview(int n) {
		// TODO Auto-generated method stub
		return adminUsedDao.AdminBanReview(n);
	}

	@Override
	public boolean AdminUserBanCancel(int n2) {
		// TODO Auto-generated method stub
		return adminUsedDao.AdminBanCancel(n2);
	}

	@Override
	public int getAdminSellerCount(AdminSParam sparam) {
		// TODO Auto-generated method stub
		return adminUsedDao.getAdminSellerCount(sparam);
	}

	@Override
	public List<BlacklistDto> getAdminSellerlist(AdminSParam sparam) {
		// TODO Auto-generated method stub
		return adminUsedDao.getAdminSellerlist(sparam);
	}

	@Override
	public boolean AdminUserLock(String string) {
		// TODO Auto-generated method stub
		return adminUsedDao.AdminUserLock(string);
	}

	@Override
	public boolean AdminUserUnLock(String string) {
		// TODO Auto-generated method stub
		return adminUsedDao.AdminUserUnLock(string);
	}
	
	
}
