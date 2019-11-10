package com.rhymes.app.event.dao;

import java.util.List;

import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;

public interface EventDAO {
	
	// 이벤트 리스트
	public List<EventDTO> geteventlist(EventParam param);
	// 글의 총 수
	public int getEventCount(EventParam param);
	
	// detail
	public EventDTO geteventdetail(EventDTO dto);
	
	// 이미 발급받은 쿠폰인지 확인
	public boolean geteventduplicate(MemberCouponDetailDTO dto);

	// 쿠폰 insert
	public boolean eventcoupon(MemberCouponDetailDTO dto);
	
	// 종료된 이벤트
	public List<EventDTO> geteventEndlist(EventParam param);
	// 종료된 이벤트 count
	public int getEvenEndtCount(EventParam param);
	
	// 진행중인 이벤트
	public List<EventDTO> geteventInglist(EventParam param);
	// 종료된 이벤트 count
	public int getEvenIngtCount(EventParam param);
	
	// 출석체크 적립금 확인
	public boolean geteventduplicate_check(MemberPointDTO dto);
	// 쿠폰금액 뽑기
	public MemberCouponDTO getcouponamount(MemberPointDTO dto);
	// 출석체크 적립금 등록
	public void eventcoupon_check(MemberPointDTO dto);
}
