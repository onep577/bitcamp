package com.rhymes.app.admin.event.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.event.dao.AdminEventDAO;
import com.rhymes.app.admin.event.service.AdminEventService;
import com.rhymes.app.admin.events.model.CouponDTO;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminEventDAO adminEventDAO;

	// 이벤트 리스트
	@Override
	public List<EventDTO> getEventList(EventParam param) {
		return adminEventDAO.getEventList(param);
	}

	// 이벤트 count
	@Override
	public int getEventCount(EventParam param) {
		return adminEventDAO.getEventCount(param);
	}
	
	// 쿠폰종류
	@Override
	public List<CouponDTO> getcouponlist(CouponDTO dto) {
		return adminEventDAO.getcouponlist(dto);
	}

	@Override
	public void geteventwrite(EventDTO dto) {
		adminEventDAO.geteventwrite(dto);
	}

	@Override
	public List<MemberCouponDTO> getcoupon() {
		return adminEventDAO.getcoupon();
	}

	@Override
	public boolean getFileUpload(EventDTO dto) {
		return adminEventDAO.getFileUpload(dto);
	}

	// 삭제
	@Override
	public void geteventdel(EventDTO dto) {
		
		for (int i = 0; i < dto.getChecklen(); i++) {
			if(dto.getCheckseq() != null || dto.getCheckseq() != "") {
				String check[] = dto.getCheckseq().split(",");
				dto.setSeq(Integer.parseInt(check[i]));
				
				adminEventDAO.geteventdel(dto);
			}
		}
		
	}

	// 수정
	@Override
	public EventDTO getEventUpdate(EventDTO dto) {
		return adminEventDAO.getEventUpdate(dto);
	}

	// 수정Af
	@Override
	public void geteventupdateAf(EventDTO dto) {
		adminEventDAO.geteventupdateAf(dto);
		
	}

	
	
	
	
	
}
