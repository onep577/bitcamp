package com.rhymes.app.admin.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.member.dao.AdminMemberDAO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberParam;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;

@Repository
public class AdminMemberDAOImple implements AdminMemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "admem.";
	
	// 회원 리스트
	@Override
	public List<MemBean> getmemlist(MemberParam param) {
		return sqlSession.selectList(ns+"getmemlist", param);
	}

	// 회원 리스트 count
	@Override
	public int getmemCount(MemberParam param) {
		return sqlSession.selectOne(ns+"getmemCount", param);
	}
	
	// 업체 리스트
	@Override
	public List<SellerBean> getmem_c_list(MemberParam param) {
		return sqlSession.selectList(ns+"getmem_c_list", param);
	}

	// 업체 리스트 count
	@Override
	public int getmem_c_Count(MemberParam param) {
		return sqlSession.selectOne(ns+"getmem_c_Count", param);
	}

	// 수정창으로 회원정보 불러오기
	@Override
	public P_MemberDTO getAdMem(String id) {
		return sqlSession.selectOne(ns+"getAdMem", id);
	}

	// 회원정보 수정
	@Override
	public void getAdMemAf(P_MemberDTO pmem) {
		sqlSession.update(ns+"getAdMemAf", pmem);
	}

	// 회원 정지
	@Override
	public void getMemLock(MemBean mb) {
		sqlSession.update(ns+"getMemLock", mb);
		
	}

	@Override
	public void getMemLock_n(MemBean mb) {
		sqlSession.update(ns+"getMemLock_n", mb);
		
	}


	
}
