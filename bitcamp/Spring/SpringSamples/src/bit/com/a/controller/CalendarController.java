package bit.com.a.controller;

import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.a.service.CalendarService;
import bit.com.a.util.Util;

@Controller
public class CalendarController {
	
	// Calendar Service 생성
	@Autowired
	CalendarService calService;
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	// 일정관리 페이지로 이동만
	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendar(Model model) {
		
		Util util = new Util();
		model.addAttribute("doc_title", "일정관리");
		
		// 년도, 월, 아이디
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		// 오늘의 달, 1일                                                                                                                                                                                                                                                                                                                                              
		
		return "calendar.tiles";
	}
	
	
	

}

