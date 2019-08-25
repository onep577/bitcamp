package dao;

import java.util.List;

import dto.CustomerDto;
import dto.AdminChartDto;
import dto.AdminTodayBookingDto;

public interface iAdminDao {	
	// 통계, 회원정보 불러오기(seq), 객실정보 등록(room_number), 수정(room_number), 삭제(room_number)
	// 예약현황 조회 불러오기(seq), 고객의 소리 리스트 불러와서 comments만 수정(seq)
	
	// 월별 통계
	public List<AdminChartDto> chartMonth(int year);
	
	// 일별 통계
	public List<AdminChartDto> chartDaily(String date);
	
	// 지역별 통계
	public List<AdminChartDto> chartArea();
	
	// 연령별 통계
	public List<AdminChartDto> chartAge();
	
	// 회원정보 가져오기
	public List<CustomerDto> getCustomerList(String search, String text);
	
	// 해당날짜 입실, 퇴실 정보 가져오기
	public List<AdminTodayBookingDto> getTodayBooking(String date);

}
