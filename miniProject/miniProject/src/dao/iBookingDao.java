package dao;

import java.util.List;

import dto.AdminChartDto;
import dto.AdminTodayBookingDto;
import dto.BookingCheckDto;
import dto.BookingDto;

public interface iBookingDao {

	//예약내역 데이터베이스에 넣기
	public boolean InsertBook(BookingDto dto);
	
	//마이페이지 내가 예약한 list
	public List<BookingDto> SelectBook(String id);
	
	// 관리자 페이지에서 입실조회관리
	public List<AdminTodayBookingDto> getTodayVisit(String date);
	
	// 관리자 페이지에서 퇴실조회관리  LEAVE_DATE
	public List<AdminTodayBookingDto> getTodayLeave(String date);
	
	// 관리자 페이지에서 입실 퇴실이 아닌 예약중인 방 리스트
	public List<AdminTodayBookingDto> getTodayBooking(String date);
	
	// 관리자 페이지에서 일별통계
	public List<AdminChartDto> chartDaily(String month);
	
	// 예약조회 페이지에서 예약조회하기
	public List<BookingCheckDto> getBookingCheck(String id);
	
	// 예약조회 페이지에서 예약 취소하기
	public boolean delete(int seq);
	
	// 회원탈퇴 후 아이디 null값으로 바꾸기
	public boolean outCustomer(String id);
}
