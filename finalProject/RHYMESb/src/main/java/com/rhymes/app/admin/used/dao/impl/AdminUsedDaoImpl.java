package com.rhymes.app.admin.used.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.used.dao.AdminUsedDao;
import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.admin.used.model.AdminBlParam;
import com.rhymes.app.admin.used.model.AdminSParam;
import com.rhymes.app.used.model.BlacklistDto;
import com.rhymes.app.used.model.ProductsDto;

@Repository
public class AdminUsedDaoImpl implements AdminUsedDao {

	@Autowired
	SqlSession sqlSession;

	String ns = "adminUsed.";

	@Override
	public List<ProductsDto> getAdminUsedlist(AdminBbsParam adparam) { // 판매 목록을 가져온다
		List<ProductsDto> ulist = sqlSession.selectList(ns + "getAdminUsedlist", adparam);
		return ulist;
	}

	@Override
	public int getAdminBbsCount(AdminBbsParam adparam) { // 페이징을 위한 조건에 맞는 게시글 개수
		int count = sqlSession.selectOne(ns + "getAdminBbsCount", adparam);

		return count;
	}

	@Override
	public List<BlacklistDto> getAdminBlacklist(AdminBlParam blparam) { // 블랙리스트 목록을 가져온다
		List<BlacklistDto> list = sqlSession.selectList(ns + "getAdminBlacklist", blparam);

		return list;
	}

	@Override
	public int getAdminBlCount(AdminBlParam blparam) { // 페이징을 위한 조건에 맞는 게시글 개수
		int count = sqlSession.selectOne(ns + "getAdminBlCount", blparam);
		return count;
	}

	@Override
	public boolean AdminBanCount(String string) { // 누적 횟수 증가

		int count = sqlSession.update(ns + "AdminBanCount", string);

		return count > 0 ? true : false;
	}

	@Override
	public boolean AdminBanReview(int n) { // 관리자 확인 처리
		System.out.println("n " + n);
		int count = sqlSession.update(ns + "AdminBanReview", n);
		return count > 0 ? true : false;
	}

	@Override
	public boolean AdminBanCancel(int n2) { // 허위 신고로인한 목록 삭제
		int count = sqlSession.delete(ns + "AdminBanCancel", n2);
		return count > 0 ? true : false;
	}

	@Override
	public int getAdminSellerCount(AdminSParam sparam) { // 셀러 목록 조회를 위한 개수
		int count = sqlSession.selectOne(ns + "getAdminSellerCount", sparam);

		return count;
	}

	@Override
	public List<BlacklistDto> getAdminSellerlist(AdminSParam sparam) {
		List<BlacklistDto> list = sqlSession.selectList(ns + "getAdminSellerlist", sparam);

		return list;
	}

	@Override
	public boolean AdminUserLock(String string) {
	
		int n = sqlSession.update(ns + "AdminUserLock", string);

		return n > 0 ? true : false;
	}

	@Override
	public boolean AdminUserUnLock(String string) {
		int n = sqlSession.update(ns + "AdminUserUnLock", string);

		return n > 0 ? true : false;
	}
	
}
