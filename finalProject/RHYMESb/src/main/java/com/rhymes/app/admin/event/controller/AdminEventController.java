package com.rhymes.app.admin.event.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.MultipartBodyBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rhymes.app.admin.event.service.AdminEventService;
import com.rhymes.app.admin.events.model.CouponDTO;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;
import com.rhymes.app.event.model.EventDTO;
import com.rhymes.app.event.model.EventParam;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/event/*")
public class AdminEventController {

	HttpSession session;

	@Autowired
	AdminEventService adminEventService;


	@RequestMapping(value = "/eventlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminlist(Model model, EventParam param){
		
		log.warn("eventlist controller");
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<EventDTO> eventlist = adminEventService.getEventList(param);
		
		//글의 총수
		int totalRecordCount = adminEventService.getEventCount(param);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("eventlist", eventlist);
		
		// 추가
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
		
		// sorting
		model.addAttribute("sorting", param.getSorting());
		
		return "admineventlist.tiles";
	}
	
	// 글쓰기
	@GetMapping("/write")
	public String getEventWrite(Model model) {
		// 오늘 시간을 얻어옴
		Calendar cal = Calendar.getInstance();
		int monthMax = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	//getActualMaximum:해당 달의 마지막 날짜까지 day생성
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONDAY) +1;
		int tday = cal.get(Calendar.DATE);
		
		model.addAttribute("cal", cal);
		model.addAttribute("monthMax", monthMax);
		model.addAttribute("tyear", tyear);
		model.addAttribute("tmonth", tmonth);
		model.addAttribute("tday", tday);
		
		List<MemberCouponDTO> couponlist = adminEventService.getcoupon();	// 쿠폰리스트 불러오기
		
		model.addAttribute("couponlist", couponlist);
		
		return"write.tiles";
	}
	
	// 쿠폰종류
	@ResponseBody
	@RequestMapping(value = "/eventcoupontype", method = RequestMethod.POST)
	public List<CouponDTO> eventcoupontype(CouponDTO dto, Model model, HttpSession session, HttpServletRequest req)throws Exception{
		
		List<CouponDTO> couponlist = adminEventService.getcouponlist(dto);
		
		return couponlist;
		
	}
	
	// event 글 작성
	@RequestMapping(value = "/eventwrite", method = RequestMethod.POST)
	public String eventwrite(EventDTO dto, MultipartHttpServletRequest multi, HttpServletRequest req)throws Exception{

		// 시작시간, 종료시간 합치기
		dto.sdate(dto.getSyear(), dto.getSmonth(), dto.getSday());
		dto.edate(dto.getEyear(), dto.getEmonth(), dto.getEday());		
		
		String banner = (String)req.getSession().getAttribute("photo_banner");
		dto.setPhoto_banner(banner);
		
		String path = req.getServletContext().getRealPath("/upload/event");
		String fileName = "";

		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdir();
		} 

		Iterator<String> files = multi.getFileNames();

		int cnt = 0;
		while(files.hasNext()) {
			String uploadFile = files.next();

			MultipartFile mFile = multi.getFile(uploadFile);
			fileName = mFile.getOriginalFilename();

			String timeFileName = System.currentTimeMillis() + fileName;

			cnt++;

			if(cnt == 1) {
				dto.setPhoto_content(timeFileName);
			}


			try {
				FileOutputStream fs = new FileOutputStream(path + "/" + timeFileName);
				fs.write(mFile.getBytes());
				fs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
		try {
			adminEventService.geteventwrite(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		
	    
		return "redirect:/admin/event/eventlist";
	}

	// 파일 저장
	@ResponseBody
	@RequestMapping(value = "/eventwriteFile", method = RequestMethod.POST)
	public String eventwriteFile(EventDTO dto,  HttpServletRequest req, MultipartHttpServletRequest multi, HttpSession session)throws Exception{

		// List<MultipartFile> list = multi.getFiles("files");
		String path = req.getServletContext().getRealPath("/upload/event");
		String fileName = "";

		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdir();
		} 

		Iterator<String> files = multi.getFileNames();

		int cnt = 0;
		while(files.hasNext()) {
			String uploadFile = files.next();

			MultipartFile mFile = multi.getFile(uploadFile);
			fileName = mFile.getOriginalFilename();

			String timeFileName = System.currentTimeMillis() + fileName;

			cnt++;

			if(cnt == 1) {
				dto.setPhoto_banner(timeFileName);
				req.getSession().setAttribute("photo_banner", dto.getPhoto_banner() );
			}


			try {
				FileOutputStream fs = new FileOutputStream(path + "/" + timeFileName);
				fs.write(mFile.getBytes());
				fs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
		try {
			//	    	  adminEventService.getFileUpload(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}	


		return "ok";
		
	}
	
	// 삭제
	@RequestMapping(value = "/eventdel", method = {RequestMethod.GET, RequestMethod.POST})
	public String eventdel(EventDTO dto, HttpServletRequest req) {
		log.info("show admin eventdel");

		String dd[] = req.getParameterValues("checkseq");
		int checklen = dd.length;
		dto.setChecklen(checklen);
		adminEventService.geteventdel(dto);
		return "redirect:/admin/event/eventlist";
	}
	
	// 수정
	@GetMapping("/eventupdate")
	public String eventupdate(EventDTO dto, Model model, HttpSession session, HttpServletRequest req)throws Exception{

		EventDTO edto = adminEventService.getEventUpdate(dto);
		List<MemberCouponDTO> couponlist = adminEventService.getcoupon();	// 쿠폰리스트 불러오기
		
		model.addAttribute("couponlist", couponlist);
		
		String ssdate = edto.getSdate();
		String sdate[] = ssdate.split("-");
		
		String eedate = edto.getEdate();
		String edate[] = eedate.split("-");
	
		String syear=sdate[0];
		String smonth=sdate[1];
		String sday=sdate[2];

		String eyear=edate[0];
		String emonth=edate[1];
		String eday=edate[2];
	
		model.addAttribute("edto", edto);
		model.addAttribute("syear", syear);
		model.addAttribute("smonth", smonth);
		model.addAttribute("sday", sday);
		model.addAttribute("eyear", eyear);
		model.addAttribute("emonth", emonth);
		model.addAttribute("eday", eday);
		
		// 오늘 시간을 얻어옴
		Calendar cal = Calendar.getInstance();
		int monthMax = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	//getActualMaximum:해당 달의 마지막 날짜까지 day생성
		int tyear = cal.get(Calendar.YEAR);
		int tmonth = cal.get(Calendar.MONDAY) +1;
		int tday = cal.get(Calendar.DATE);
		
		model.addAttribute("cal", cal);
		model.addAttribute("monthMax", monthMax);
		model.addAttribute("tyear", tyear);
		model.addAttribute("tmonth", tmonth);
		model.addAttribute("tday", tday);
		
		return "eventupdate.tiles";
	}
	
	// 수정Af
	@RequestMapping(value = "/eventupdateAf", method = {RequestMethod.GET, RequestMethod.POST})
	public String eventupdateAf(EventDTO dto, HttpServletRequest req, MultipartHttpServletRequest multi, HttpSession session) {
		
		// 시작시간, 종료시간 합치기
		dto.sdate(dto.getSyear(), dto.getSmonth(), dto.getSday());
		dto.edate(dto.getEyear(), dto.getEmonth(), dto.getEday());		
		
		String banner = (String)req.getSession().getAttribute("photo_banner");
		dto.setPhoto_banner(banner);
		
		String path = req.getServletContext().getRealPath("/upload/event");
		String fileName = "";

		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdir();
		} 

		Iterator<String> files = multi.getFileNames();

		int cnt = 0;
		while(files.hasNext()) {
			String uploadFile = files.next();

			MultipartFile mFile = multi.getFile(uploadFile);
			fileName = mFile.getOriginalFilename();

			String timeFileName = System.currentTimeMillis() + fileName;

			cnt++;
			
			if(cnt == 1) {
				dto.setPhoto_content(timeFileName);
			}

			try {
				FileOutputStream fs = new FileOutputStream(path + "/" + timeFileName);
				fs.write(mFile.getBytes());
				fs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}		
		try {
			adminEventService.geteventupdateAf(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/event/eventlist";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
