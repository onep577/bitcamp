package bit.com.a.service;

import java.util.List;

import bit.com.a.model.CalendarDto;
import bit.com.a.model.CalendarParam;

public interface CalendarService {
	
	// 일정 전체 list로 가져오기
	public List<CalendarDto> getCalendarList(CalendarParam calparam) throws Exception;
	
	// 일정 쓰기
	public boolean calwriteAf(CalendarDto dto) throws Exception;

}
