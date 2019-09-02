package bit.com.a.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.a.dao.CalendarDao;
import bit.com.a.model.CalendarDto;
import bit.com.a.model.CalendarParam;
import bit.com.a.model.MemberDto;
import bit.com.a.service.CalendarService;
import bit.com.a.util.Util;

@Controller
public class CalendarController {
	
	// Calendar Service 생성
	@Autowired
	CalendarService calService;
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	Util util = new Util();
	
	// 일정관리 페이지로 이동만
	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest req, String syear, String smonth) throws Exception {
		
		model.addAttribute("doc_title", "일정관리");
		
		// 년도, 월, 아이디
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		// 오늘의 달, 1일
		
		//String syear = req.getParameter("year");
		//String smonth = req.getParameter("month");
		
		int nyear = cal.get(Calendar.YEAR);
		int nmonth = cal.get(Calendar.MONTH) + 1; // 0부터 시작한다 원하는 값을 얻기 위해서는 +1 해야한다
		
		// 파라미터가 넘어 왔을 때 넘어온 값을 형변환하고 넘어온 값이 없으면 오늘 날짜를 넣는다
		if(util.nvl(syear) == false){
			nyear = Integer.parseInt(syear);
		}

		// 파라미터가 넘어 왔을 때 넘어온 값을 형변환하고 넘어온 값이 없으면 오늘 날짜를 넣는다
		if(util.nvl(smonth) == false){
			nmonth = Integer.parseInt(smonth);
		}
		
		// 넘어온 월이 12월일 때 즉, 2019년 1월에서 왼쪽 화살표를 클릭했을 때
		if(nmonth < 1){
			nmonth = 12;
			nyear--;
		}

		// 넘어온 월이 1월일 때 즉, 2018년 12월에서 오른쪽 화살표를 클릭했을 때
		if(nmonth > 12){
			nmonth = 1;
			nyear++;
		}
		
		
		
		// 년월일 셋팅 완료
		cal.set(nyear, nmonth-1, 1);
				
		// 요일
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		// <<		year--
		String pp = String.format("<a href='%s?year=%d&month=%d'><img src='image/lleft.png'></a>",
								"calendar.do", nyear-1, nmonth);
		// <		month--
		String p = String.format("<a href='%s?year=%d&month=%d'><img src='image/left.png'></a>",
								"calendar.do", nyear, nmonth-1);
		// >		month++
		String n = String.format("<a href='%s?year=%d&month=%d'><img src='image/right.png'></a>",
								"calendar.do", nyear, nmonth+1);
		// >>		year++
		String nn = String.format("<a href='%s?year=%d&month=%d'><img src='image/rright.png'></a>",
								"calendar.do", nyear+1, nmonth);

		String userId = (String)req.getSession().getAttribute("userId");
		
		CalendarParam calparam = new CalendarParam(userId, nyear + util.two(nmonth + ""));
		//logger.info("1" + calparam.toString());
		List<CalendarDto> list = calService.getCalendarList(calparam);
		logger.info("list.size() : " + list.size());
		
		
		model.addAttribute("pp", pp);
		model.addAttribute("p", p);
		model.addAttribute("n", n);
		model.addAttribute("nn", nn);
		
		model.addAttribute("month", nmonth);
		model.addAttribute("year", nyear);
		model.addAttribute("dayOfWeek", dayOfWeek);
		model.addAttribute("cal", cal);
		
		model.addAttribute("list", list);

		return "calendar.tiles";
	}
	
	// 일정쓰기 이동만
	@RequestMapping(value = "calwrite.do", method = RequestMethod.GET)
	public String calwrite(Model model, String date, HttpServletRequest req) throws Exception {
		model.addAttribute("doc_title", "일정쓰기");
		Calendar cal = Calendar.getInstance();
		
		String year, month, day, hour, minute;
		// 일정쓰기를 클릭한 경우 date는 null값이 들어온다 오늘 날짜를 넣어준다
		if(date == null) {
			year = "" + cal.get(Calendar.YEAR);
			month = util.two((cal.get(Calendar.MONTH) +1)+"");
			day = util.two(cal.get(Calendar.DATE)+"");
			hour = cal.get(Calendar.HOUR)+"";
			minute = cal.get(Calendar.MINUTE)+"";
			date = year + month + day + hour + minute;
		}
		
		String lastday = ""+cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		model.addAttribute("lastday", lastday);
		model.addAttribute("date", date);
		
		return "calwrite.tiles";
	}
	
	// 일정쓰기
	@RequestMapping(value = "calwriteAf.do", method = RequestMethod.GET)
	public String calwriteAf(Model model, CalendarDto dto) throws Exception {
		model.addAttribute("doc_title", "일정쓰기");
		
		boolean b = calService.calwriteAf(dto);
		
		if(b) {
			logger.info("일정 추가 성공");
		}else {
			logger.info("일정 추가 실패");
		}
		
		return "calwriteAf.tiles";
	}
	
	// 하루 일정 전체 보기
	@RequestMapping(value = "caldetail.do", method = RequestMethod.GET)
	public String calDetail(Model model, String date) throws Exception {
		logger.info("date : " + date);
		model.addAttribute("date", date);
		
		return "caldetail.tiles";
	}
	

}

