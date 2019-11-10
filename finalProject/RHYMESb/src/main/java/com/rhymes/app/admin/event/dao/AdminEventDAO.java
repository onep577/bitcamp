package com.rhymes.app.admin.event.dao;

import java.util.List;

import com.rhymes.app.admin.events.model.CouponDTO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;

public interface AdminEventDAO {
	
	// 이벤트 리스트
	public List<EventDTO> getEventList(EventParam param);	
	
	// 리스트 count
	public int getEventCount(EventParam param);
	
	// 쿠폰종류
	public List<CouponDTO> getcouponlist(CouponDTO dto);

	// 이벤트 글 작성
	public void geteventwrite(EventDTO dto);
	
	// 쿠폰리스트
	public List<MemberCouponDTO> getcoupon();
	
	// 파일저장
	public boolean getFileUpload(EventDTO dto);
	
	// 삭제
	public void geteventdel(EventDTO dto);
	
	// 수정
	public EventDTO getEventUpdate(EventDTO dto);
	
	// 수정Af
	public void geteventupdateAf(EventDTO dto);
}
