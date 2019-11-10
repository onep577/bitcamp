package com.rhymes.app.event.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.event.service.EventService;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/event/*")
public class EventController {

	@Autowired
	private EventService eventService;

	// 이벤트 전체 리스트
	@GetMapping("/eventmain")
	public String eventmain(Model model, EventParam param, HttpServletRequest req) {
		log.warn("eventmain controller");

		model.addAttribute("doc_title", "이벤트&nbsp;&nbsp;&nbsp;");
		model.addAttribute("doc_sub", "다양한 이벤트를 한눈에 확인하세요");

		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
	
		param.setStart(start);
		param.setEnd(end);

		if(param.getCode().equals("ing")) {			// 진행중인 리스트
			// 오늘 날짜를 얻어옴
			Calendar cal = Calendar.getInstance();
			int tyear = cal.get(Calendar.YEAR);
			int tmonth = cal.get(Calendar.MONDAY) +1;
			int tday = cal.get(Calendar.DATE);
			
			param.setNdate(tyear+"-"+tmonth+"-"+tday);
			List<EventDTO> eventlist = eventService.geteventInglist(param);
			//글의 총수
			int totalRecordCount = eventService.getEvenIngtCount(param);
			model.addAttribute("eventlist", eventlist);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			
			model.addAttribute("code", param.getCode());
			
			return "eventList.tiles";
		}
		if(param.getCode().equals("end")) {			// 종료된 리스트
			// 오늘 날짜를 얻어옴
			Calendar cal = Calendar.getInstance();
			int tyear = cal.get(Calendar.YEAR);
			int tmonth = cal.get(Calendar.MONDAY) +1;
			int tday = cal.get(Calendar.DATE);
			
			param.setNdate(tyear+"-"+tmonth+"-"+tday);
			List<EventDTO> eventlist = eventService.geteventEndlist(param);
			//글의 총수
			int totalRecordCount = eventService.getEvenEndtCount(param);
			model.addAttribute("eventlist", eventlist);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			
			model.addAttribute("code", param.getCode());

			return "eventList.tiles";
		}
		else { //전체 리스트
			List<EventDTO> eventlist = eventService.geteventlist(param);
			//글의 총수
			int totalRecordCount = eventService.getEventCount(param);
			model.addAttribute("eventlist", eventlist);
			model.addAttribute("totalRecordCount", totalRecordCount);
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
			
			model.addAttribute("code", param.getCode());
			
			return "eventList.tiles";
			
		}

	}
	// 디테일
	@GetMapping("/eventdetail")
	public String eventdetail(EventDTO dto, Model model) {
		
		EventDTO event = eventService.geteventdetail(dto);
		
		// 오늘 날짜를 얻어옴
		Calendar cal = Calendar.getInstance();
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONDAY) +1;
		int tday = cal.get(Calendar.DATE);
		
		int nowdate = Integer.parseInt(tyear+""+tmonth+""+tday);
		
		String eedate = event.getEdate();
		String edate[] = eedate.split("-");
		String eyear = edate[0];
		String emonth = edate[1];
		String eday = edate[2];
		
		int enddate = Integer.parseInt(eyear+""+emonth+""+eday);
		
		model.addAttribute("nowdate", nowdate);
		model.addAttribute("enddate", enddate);

		model.addAttribute("event", event);

		return "eventdetail.tiles";
	}
	
	// 이벤트 쿠폰 insert
	@ResponseBody
	@RequestMapping(value = "/eventcoupon", method = RequestMethod.GET)
	public String eventcoupon(MemberCouponDetailDTO dto, Principal prc, Model model)throws Exception{
		dto.setUserid(prc.getName());
		
		// 이미 발급받은 쿠폰인지 확인
		boolean a = eventService.geteventduplicate(dto);
		
		String msg = "";
		
		if(a) {
			msg = "no";
		}
		else {
			eventService.eventcoupon(dto);	// 'rhy_mem_coupon_detail' insert
			msg = "ok";			
		}

		return msg;
	}
	
	// 출석체크 쿠폰 insert
	@ResponseBody
	@RequestMapping(value = "/eventcoupon_check", method = RequestMethod.GET)
	public String eventcoupon_check(MemberPointDTO dto, Principal prc, Model model)throws Exception{
		dto.setUserid(prc.getName());
		// 오늘 날짜를 얻어옴
		Calendar cal = Calendar.getInstance();
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONDAY) +1;
		int tday = cal.get(Calendar.DATE);
		
		String nowdate = tyear+"-"+tmonth+"-"+tday;
		dto.setTdate(nowdate);
		
		// 이미 발급받은 쿠폰인지 확인
		boolean a = eventService.geteventduplicate_check(dto);

		String msg = "";
		
		if(a) {
			msg = "no";
		}
		else {
			// 쿠폰 금액을  뽑기위한
			MemberCouponDTO coupondto = eventService.getcouponamount(dto);
			dto.setAmount(coupondto.getFunc_num());
			eventService.eventcoupon_check(dto);	// 'RHY_MEM_POINT' insert
			msg = "ok";			
		}

		return msg;
	}

	
	
	/* 기간제 특별 이벤트 관련 */
	
	//SMS 연동 이벤트
	@GetMapping("/eventdetail/sms")
	public String eventdetailSms(Model model) {
		
		EventDTO event = eventService.geteventdetail(new EventDTO(90));
		
		// 오늘 날짜를 얻어옴
		Calendar cal = Calendar.getInstance();
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONDAY) +1;
		int tday = cal.get(Calendar.DATE);
		
		int nowdate = Integer.parseInt(tyear+""+tmonth+""+tday);
		
		String eedate = event.getEdate();
		String edate[] = eedate.split("-");
		String eyear = edate[0];
		String emonth = edate[1];
		String eday = edate[2];
		
		int enddate = Integer.parseInt(eyear+""+emonth+""+eday);
		
		model.addAttribute("nowdate", nowdate);
		model.addAttribute("enddate", enddate);

		model.addAttribute("event", event);

		return "eventdetail/period/smsspecial";
	}

}