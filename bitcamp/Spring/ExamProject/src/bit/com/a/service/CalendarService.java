package bit.com.a.service;

import java.util.List;

import bit.com.a.model.CalendarDto;
import bit.com.a.model.CalendarParam;

public interface CalendarService {
	
	// 모든 일정 전체 list로 가져오기
	public List<CalendarDto> getCalendarList(CalendarParam calparam) throws Exception;
	
	// 일정 쓰기
	public boolean calwriteAf(CalendarDto dto) throws Exception;
	
	// 하루 전체 일정 보기
	public List<CalendarDto> getdayList(String date) throws Exception;
	
	// 하나의 일정보기
	public CalendarDto getdetail(int seq) throws Exception;
	
	// 하나의 일정 삭제
	public boolean delete(int seq) throws Exception;
	
	// 하나의 일정 수정
	public boolean update(CalendarDto dto) throws Exception;

}
