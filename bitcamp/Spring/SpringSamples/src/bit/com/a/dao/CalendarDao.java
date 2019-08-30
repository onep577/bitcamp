package bit.com.a.dao;

import java.util.List;

import bit.com.a.model.CalendarDto;
import bit.com.a.model.CalendarParam;

public interface CalendarDao {
	
	public List<CalendarDto> getCalendarList(CalendarParam calparam) throws Exception;

}
