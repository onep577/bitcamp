package com.rhymes.app.admin.common.service;

public interface AdminCommonService {
	
	// 회원 전체 count
	public int getAllMemberList();
	
	// 오늘 가입한 회원 count
	public int getNewMemCount(String mTime);

}
