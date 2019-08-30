package bit.com.a.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import bit.com.a.service.CalendarService;

@Controller
public class CalendarController {
	
	// Calendar Service 생성
	@Autowired
	CalendarService  calService;
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

}
