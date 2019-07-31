package dao;

import java.util.List;

import dto.CalendarDto;

public interface iCalendar {
	
	public List<CalendarDto> getCalendarList(String id, String yyyymm);
	
	public boolean addCalendar(CalendarDto dto);
	
	public CalendarDto getOneCalendar(int seq);
	
	public boolean delCalendar(int seq);
	
	public boolean updateCalendar(CalendarDto dto);
	
	public List<CalendarDto> getcallist(String rdate);

}
