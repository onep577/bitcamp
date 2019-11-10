package com.rhymes.app.admin.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.common.dao.AdminCommonDAO;
import com.rhymes.app.admin.common.service.AdminCommonService;
import com.rhymes.app.common.dao.CommonDAO;
import com.rhymes.app.common.service.CommonService;

@Service
public class AdminCommonServiceImpl implements AdminCommonService {
	
	@Autowired
	private AdminCommonDAO adminCommonDAO;

	// 회원 전체 count
	@Override
	public int getAllMemberList() {
		return adminCommonDAO.getAllMemberList();
	}

	// 오늘 가입한 회원 count
	@Override
	public int getNewMemCount(String mTime) {
		return adminCommonDAO.getNewMemCount(mTime);
	}
	
	

	
}
