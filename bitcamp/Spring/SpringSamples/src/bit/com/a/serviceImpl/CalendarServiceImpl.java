package bit.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.CalendarDao;
import bit.com.a.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	// CalendarDao를 생성한다
	@Autowired
	private CalendarDao calDao;

}
