package com.rhymes.app.admin.member.service;

import java.util.List;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;
import com.rhymes.app.member.model.SellerDTO;

public interface AdminMemberService{
	
	// 회원 리스트
	public List<MemBean> getmemlist(MemberParam param);
	
	// 회원 리스트 count
	public int getmemCount(MemberParam param);
	
	// 업체 리스트
	public List<SellerBean> getmem_c_list(MemberParam param);
	
	// 업체 리스트 카운트
	public int getmem_c_Count(MemberParam param);
	
	
	// 수정창으로 회원정보 불러오기
	public P_MemberDTO getAdMem(String id);
	
	// 회원정보 수정
	public void getAdMemAf(P_MemberDTO pmem);
	
	// 회원 정지
	public void getMemLock(MemBean bean);
	
	// 회원 정지 해제
	public void getMemLock_n(MemBean bean);
}
