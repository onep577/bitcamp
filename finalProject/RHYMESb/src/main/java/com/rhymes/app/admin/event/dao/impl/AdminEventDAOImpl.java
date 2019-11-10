package com.rhymes.app.admin.event.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.event.dao.AdminEventDAO;
import com.rhymes.app.admin.events.model.CouponDTO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;

@Repository
public class AdminEventDAOImpl implements AdminEventDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "adminevent.";

	// 이벤트 리스트
	@Override
	public List<EventDTO> getEventList(EventParam param) {
		return sqlSession.selectList(ns+"getEventList", param);
	}

	// 이벤트 count
	@Override
	public int getEventCount(EventParam param) {
		return sqlSession.selectOne(ns+"getEventCount", param);
	}
	
	// 쿠폰종류
	@Override
	public List<CouponDTO> getcouponlist(CouponDTO dto) {
		return sqlSession.selectList(ns+"getcouponlist", dto);
	}

	// 이벤트 글 작성
	@Override
	public void geteventwrite(EventDTO dto) {
		sqlSession.insert(ns+"geteventwrite", dto);
	}

	@Override
	public List<MemberCouponDTO> getcoupon() {
		return sqlSession.selectList(ns+"getcoupon");
	}

	@Override
	public boolean getFileUpload(EventDTO dto) {
		int count = sqlSession.insert(ns+"getFileUpload", dto);
		return count>0?true:false;
	}

	// 삭제
	@Override
	public void geteventdel(EventDTO dto) {
		sqlSession.update(ns+"geteventdel", dto);
	}

	// 수정
	@Override
	public EventDTO getEventUpdate(EventDTO dto) {
		return sqlSession.selectOne(ns+"getEventUpdate", dto);
	}

	// 수정Af
	@Override
	public void geteventupdateAf(EventDTO dto) {
		sqlSession.update(ns+"geteventupdateAf", dto);
		
	}


}
