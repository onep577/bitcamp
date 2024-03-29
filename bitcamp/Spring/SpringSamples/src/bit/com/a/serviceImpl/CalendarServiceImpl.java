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

	// 모든 일정 전체 list로 가져오기
	@Override
	public List<CalendarDto> getCalendarList(CalendarParam calparam) throws Exception {		
		return calDao.getCalendarList(calparam);
	}

	// 일정 쓰기
	@Override
	public boolean calwriteAf(CalendarDto dto) throws Exception {
		return calDao.calwriteAf(dto);
	}

	// 하루 전체 일정 보기
	@Override
	public List<CalendarDto> getdayList(String date) throws Exception {
		return calDao.getdayList(date);
	}

	// 하나의 일정보기
	@Override
	public CalendarDto getdetail(int seq) throws Exception {
		return calDao.getdetail(seq);
	}

	// 하나의 일정 삭제
	@Override
	public boolean delete(int seq) throws Exception {
		return calDao.delete(seq);
	}

	// 하나의 일정 수정
	@Override
	public boolean update(CalendarDto dto) throws Exception {
		return calDao.update(dto);
	}

}
