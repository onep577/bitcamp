package com.rhymes.app.event.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.common.util.MypageUtils;
import com.rhymes.app.event.dao.EventDAO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.event.service.EventService;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;

	// 이벤트 리스트
	@Override
	public List<EventDTO> geteventlist(EventParam param) {
		return eventDAO.geteventlist(param);
	}
	
	// 글의 총 수
	@Override
	public int getEventCount(EventParam param) {
		return eventDAO.getEventCount(param);
	}

	// 디테일
	@Override
	public EventDTO geteventdetail(EventDTO dto) {
		return eventDAO.geteventdetail(dto);
	}
	
	// 이미 발급받은 쿠폰인지 확인
	@Override
	public boolean geteventduplicate(MemberCouponDetailDTO dto) {
		return eventDAO.geteventduplicate(dto);
	}

	// 쿠폰 insert
	@Override
	public boolean eventcoupon(MemberCouponDetailDTO dto) {
		
		List<CouponDetailDTO> coupon = MypageUtils.getRandCoupsTimestampList(0,1);
		
		for (CouponDetailDTO cou : coupon) {
			dto.setCoup_code(cou.getCoup_code());
		}
		
		return eventDAO.eventcoupon(dto);
	}

	// 종료된 이벤트
	@Override
	public List<EventDTO> geteventEndlist(EventParam param) {
		return eventDAO.geteventEndlist(param);
	}

	@Override
	public int getEvenEndtCount(EventParam param) {
		return eventDAO.getEvenEndtCount(param);
	}
	
	// 진행중인 이벤트
	@Override
	public List<EventDTO> geteventInglist(EventParam param) {
		return eventDAO.geteventInglist(param);
	}

	@Override
	public int getEvenIngtCount(EventParam param) {
		return eventDAO.getEvenIngtCount(param);
	}

	// 출첵 적립금 확인
	@Override
	public boolean geteventduplicate_check(MemberPointDTO dto) {
		return eventDAO.geteventduplicate_check(dto);
	}
	// 쿠폰 금액뽑기
	@Override
	public MemberCouponDTO getcouponamount(MemberPointDTO dto) {
		return eventDAO.getcouponamount(dto);
	}

	// 출첵 적립금 등록
	@Override
	public void eventcoupon_check(MemberPointDTO dto) {
		eventDAO.eventcoupon_check(dto);
	}





	
}
