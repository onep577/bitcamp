package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CustomerDto;
import dto.AdminChartDto;
import dto.AdminTodayBookingDto;

public class AdminDao implements iAdminDao {	
	// 통계, 회원정보 불러오기(seq), 객실정보 등록(room_number), 수정(room_number), 삭제(room_number)
	// 예약현황 조회 불러오기(seq), 고객의 소리 리스트 불러와서 comments만 수정(seq)
	
	public static AdminDao dao = new AdminDao();
	
	private AdminDao() {
		//DBConnection.initConnection();
		DBConnection.initConnect();
	}
	
	public static AdminDao getInstance() {
		return dao;
	}
	
	// 월별 통계
	@Override
	public List<AdminChartDto> chartMonth(int year) {
		String sql =  " SELECT NVL(e.total, '0') "
					+ " FROM ( SELECT SUM(TOTAL_PRICE) as total , SUBSTR(VISIT_DATE,0,6) as visit "
					+ " 		FROM (	SELECT * FROM BOOKING WHERE SUBSTR(VISIT_DATE,0,4) = '"+year+"' ) "
					+ " 		GROUP BY SUBSTR(VISIT_DATE,0,6) "
					+ " 		ORDER BY SUBSTR(VISIT_DATE,0,6) ASC ) e FULL OUTER JOIN ( SELECT 0, '"+year+"01' + (ROWNUM - 1) dt "
					+ " 																	FROM dual "
					+ " 																	CONNECT BY LEVEL <= 12 "
					+ "																	) d "
					+ " 																 ON e.visit = d.dt "
					+ " ORDER BY DT ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AdminChartDto> list = new ArrayList<AdminChartDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("chartYear 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("chartYear 2/6 success !!");
			
			//psmt.setInt(1, year);
			System.out.println("chartYear 3/6 success !!");
			
			rs = psmt.executeQuery();
			System.out.println("chartYear 4/6 success !!");

			int month = 1;
			while(rs.next()) {
				AdminChartDto dto = new AdminChartDto( month+"" ,rs.getInt(1));
				System.out.println("dao에서 while문 : " + dto.getStr() + ", " + dto.getNum());
				
				month++;
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("chartYear fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}

	// 일별 통계
	@Override
	public List<AdminChartDto> chartDaily(String date) {
		/*
		String sql =  " SELECT SUM(TOTAL_PRICE) "
					+ " FROM (	SELECT * "
					+ " 		FROM BOOKING "
					+ " 		WHERE SUBSTR(VISIT_DATE,0,6) = ?) "
					+ " GROUP BY VISIT_DATE "
					+ " ORDER BY VISIT_DATE ASC ";
		*/

		int next_month = Integer.parseInt(date);
		
		if(date.subSequence(4, 6).equals("12")) {
			next_month += 89;
		}else {
			next_month += 1;
		}
		
		String sql =  " SELECT NVL(e.total, '0') "
					+ " FROM (SELECT SUM(TOTAL_PRICE) as total , TO_DATE(VISIT_DATE,'yyyymmdd') as visit "
					+ " FROM (	SELECT * FROM BOOKING WHERE SUBSTR(VISIT_DATE,0,6) = ?) "
					+ " GROUP BY VISIT_DATE "
					+ " ORDER BY VISIT_DATE ASC) e FULL OUTER JOIN ( SELECT 0, TO_DATE('"+date+"01','yyyymmdd') + (ROWNUM - 1) dt "
																+ " FROM dual "
																+ " CONNECT BY LEVEL <= TO_DATE('"+next_month+"01','yyyymmdd') - TO_DATE('"+date+"01','yyyymmdd') ) d "
																+ " ON e.visit = d.dt "
					+ " ORDER BY DT ";
		
		System.out.println("sql = " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AdminChartDto> list = new ArrayList<AdminChartDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("chartDaily 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("chartDaily 2/6 success !!");
			
			psmt.setString(1, date.trim());
			System.out.println("chartDaily 3/6 success !!");
			
			rs = psmt.executeQuery();
			System.out.println("chartDaily 4/6 success !!");

			int month = 1;
			while(rs.next()) {
				AdminChartDto dto = new AdminChartDto( ""+month, rs.getInt(1));
				list.add(dto);
				month++;
			}
			System.out.println("chartDaily 4/6 success !!");
			
		} catch (SQLException e) {
			System.out.println("chartDaily fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}		
		
		return list;
	} // chartDaily 함수


	// 지역별 통계
	@Override
	public List<AdminChartDto> chartArea() {
		
		String sql = " SELECT SUBSTR(ADDRESS, 1, 2), SUM(BOOKING_COUNT) " 
				   + " FROM CUSTOMER " 
				   + " GROUP BY SUBSTR(ADDRESS, 1, 2) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AdminChartDto> list = new ArrayList<AdminChartDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getCityList suc");
			
			psmt = conn.prepareStatement(sql);
			
			System.out.println("2/6 getCityList suc");
			System.out.println("getCityList sql : " + sql);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getCityList suc");
			
			while(rs.next()) {
				AdminChartDto dto = new AdminChartDto(rs.getString(1),
										  			rs.getInt(2));
				
				list.add(dto);
			}
			System.out.println("4/6 getCityList suc");
			
		} catch (SQLException e) {
			System.out.println("getCityList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
		
	} // chartArea 함수

	// 연령별 통계
	@Override
	public List<AdminChartDto> chartAge() {
		String sql =  " SELECT SUM(BOOKING_COUNT) "
					+ " FROM CUSTOMER	 "
					+ " GROUP BY SUBSTR(( TO_CHAR(SYSDATE,'YYYY') - SUBSTR(BIRTHDAY,1,4) +1 ), 1, 1) "
					+ " ORDER BY SUBSTR(( TO_CHAR(SYSDATE,'YYYY') - SUBSTR(BIRTHDAY,1,4) +1 ), 1, 1) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AdminChartDto> list = new ArrayList<AdminChartDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("chartAge 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("chartAge 2/6 success !!");
			
			rs = psmt.executeQuery();
			System.out.println("chartAge 3/6 success !!");

			int age = 20;
			while(rs.next()) {
				AdminChartDto dto = new AdminChartDto(age, rs.getInt(1));
				age += 10;
				list.add(dto);
			}
			System.out.println("chartAge 4/6 success !!");
			
		} catch (SQLException e) {
			System.out.println("chartAge fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}		
		
		return list;
	} // chartAge 함수
	
	// 회원정보 가져오기
	@Override
	public List<CustomerDto> getCustomerList(String search, String text) {		
		String sql =  " SELECT ID, PASSWORD, NAME, ADDRESS, BIRTHDAY, PHONE, AUTH, EMAIL, GRADE, BOOKING_COUNT, TOTAL_PAYMENT "
					+ " FROM CUSTOMER "
					+ " WHERE 1=1 ";
		
		if(search.equals("id")) {
			sql += " AND ID LIKE '%" + text.trim() + "%' ";
			
		}else if(search.equals("name")) {
			sql += " AND NAME LIKE '%" + text.trim() + "%' ";
			
		}else if(search.equals("grade")) {
			sql += " AND GRADE LIKE '%" + text.trim() + "%' ";
			
		}else if(search.equals("phone")) {
			sql += " AND PHONE LIKE '%" + text.trim() + "%' ";
			
		}else if(search.equals("email")) {
			sql += " AND EMAIL LIKE '%" + text.trim() + "%' ";
			
		}

		sql += " ORDER BY NAME ASC ";
					
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CustomerDto> list = new ArrayList<CustomerDto>();
		
		try {			
			conn = DBConnection.getConnection();
			System.out.println("getCustomerList 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("getCustomerList 2/6 success !!");
			
			rs = psmt.executeQuery();
			System.out.println("getCustomerList 3/6 success !!");
			
			while(rs.next()) {
				int i=1;
				CustomerDto dto = new CustomerDto(rs.getString(i++), 
												  rs.getString(i++), 
												  rs.getString(i++), 
												  rs.getString(i++), 
												  rs.getString(i++), 
												  rs.getString(i++), 
												  rs.getInt(i++), 
												  rs.getString(i++), 
												  rs.getString(i++), 
												  rs.getInt(i++), 
												  rs.getInt(i++));
				
				list.add(dto);
						
			}
			System.out.println("getCustomerList 4/6 success !!");
			
		} catch (SQLException e) {
			System.out.println("getCustomerList fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;		
	} // getCustomerList 함수
	
	@Override
	public List<AdminTodayBookingDto> getTodayBooking(String date) {
	//public List<TodayBookingDto> getTodayBooking() {
		String sql =  " SELECT c.ID, c.NAME, c.grade, b.ADULT_NUMBER, b.CHILD_NUMBER, b.ROOM_NUMBER, b.VISIT_DATE, b.Leave_DATE "
					+ " FROM CUSTOMER c, BOOKING b "
					+ " WHERE c.ID = b.ID AND ( ? = VISIT_DATE OR ? = LEAVE_DATE ) "
					+ " ORDER BY ROOM_NUMBER ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AdminTodayBookingDto> list = new ArrayList<AdminTodayBookingDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("getTodayBooking 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("getTodayBooking 2/6 success !!");
			
			psmt.setString(1, date);
			psmt.setString(2, date);
			rs = psmt.executeQuery();
			System.out.println("getTodayBooking 3/6 success !!");
			
			while(rs.next()) {
				AdminTodayBookingDto dto = new AdminTodayBookingDto(rs.getString(1),
														rs.getString(2),
														rs.getString(3),
														rs.getInt(4),
														rs.getInt(5),
														rs.getString(6),
														rs.getString(7),
														rs.getString(8));
				list.add(dto);
			}
			System.out.println("getTodayBooking 4/6 success !!");
			
		} catch (SQLException e) {
			System.out.println("getTodayBooking fail !!");
			e.printStackTrace();
		}
		
		return list;
	} // getTodayBooking 함수
	
	
	

}
