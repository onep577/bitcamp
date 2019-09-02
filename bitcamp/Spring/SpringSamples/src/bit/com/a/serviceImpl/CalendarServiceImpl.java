package bit.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.CalendarDao;
import bit.com.a.model.CalendarDto;
import bit.com.a.model.CalendarParam;
import bit.com.a.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	// CalendarDao를 생성한다
	@Autowired
	private CalendarDao calDao;

	// 일정 전체 list로 가져오기
	@Override
	public List<CalendarDto> getCalendarList(CalendarParam calparam) throws Exception {		
		return calDao.getCalendarList(calparam);
	}

	@Override
	public boolean calwriteAf(CalendarDto dto) throws Exception {
		return calDao.calwriteAf(dto);
	}

}
