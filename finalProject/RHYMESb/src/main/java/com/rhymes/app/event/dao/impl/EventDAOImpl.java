package com.rhymes.app.event.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.event.dao.EventDAO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "event.";

	// 이벤트 리스트
	@Override
	public List<EventDTO> geteventlist(EventParam param) {
		return sqlSession.selectList(ns+"geteventlist", param);
	}
	// 글의 총 수
	@Override
	public int getEventCount(EventParam param) {
		return sqlSession.selectOne(ns+"getEventCount", param);
	}

	// 디테일
	@Override
	public EventDTO geteventdetail(EventDTO dto) {
		return sqlSession.selectOne(ns+"geteventdetail", dto);
	}
	
	// 이미 발급받은 쿠폰인지 확인
	@Override
	public boolean geteventduplicate(MemberCouponDetailDTO dto) {
		int count = sqlSession.selectOne(ns+"geteventduplicate", dto);
		return count>0?true:false;
	}

	// 쿠폰 insert
	@Override
	public boolean eventcoupon(MemberCouponDetailDTO dto) {
		int count = sqlSession.insert(ns+"eventcoupon", dto);
		return count>0?true:false;
		
	}
	
	// 종료된 이벤트
	@Override
	public List<EventDTO> geteventEndlist(EventParam param) {
		return sqlSession.selectList(ns+"geteventEndlist", param);
	}
	@Override
	public int getEvenEndtCount(EventParam param) {
		return sqlSession.selectOne(ns+"getEvenEndtCount", param);
	}

	// 진행중인 이벤트
	@Override
	public List<EventDTO> geteventInglist(EventParam param) {
		return sqlSession.selectList(ns+"geteventInglist", param);
	}
	@Override
	public int getEvenIngtCount(EventParam param) {
		return sqlSession.selectOne(ns+"getEvenIngtCount", param);
	}
	
	// 출첵 적립금 확인
	@Override
	public boolean geteventduplicate_check(MemberPointDTO dto) {
		int count = sqlSession.selectOne(ns+"geteventduplicate_check", dto);
		return count>0?true:false;
	}
	// 쿠폰금액뽑기
	@Override
	public MemberCouponDTO getcouponamount(MemberPointDTO dto) {
		return sqlSession.selectOne(ns+"getcouponamount", dto);
	}
	// 출첵 적립금 등록
	@Override
	public void eventcoupon_check(MemberPointDTO dto) {
		sqlSession.insert(ns+"eventcoupon_check", dto);
	}
	

	
	
	
}
