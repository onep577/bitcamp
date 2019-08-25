package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.AdminChartDto;
import dto.AdminTodayBookingDto;
import dto.BookingCheckDto;
import dto.BookingDto;
import db.DBClose;
import db.DBConnection;

public class BookingDao implements iBookingDao{
	
	private static BookingDao bookingdao = new BookingDao();
	
	private BookingDao() {
		DBConnection.initConnect();
	}
	
	public static BookingDao getInstance() {
		return bookingdao;
	}

	@Override
	public boolean InsertBook(BookingDto dto) {

		String sql = " INSERT INTO BOOKING(SEQ, ID, WDATE, VISIT_DATE, LEAVE_DATE, "
				+ " TOTAL_PRICE, ADULT_NUMBER, CHILD_NUMBER, ROOM_NUMBER) "
				+ " SELECT SEQ_BOOKING.NEXTVAL, ?, SYSDATE, ?, ?, ?, ?, ?, ? FROM DUAL "
				+ " WHERE ? NOT IN (SELECT distinct ROOM_NUMBER FROM BOOKING WHERE "
				+ "	VISIT_DATE >= ? AND VISIT_DATE <= ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		System.out.println("sql:" + sql);
		int count = 0;
		
		try {
			conn = db.DBConnection.getConnection();
			System.out.println("1/6 booking suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 booking suc");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getVisit_date());
			psmt.setString(3, dto.getLeave_date());
			psmt.setInt(4, dto.getTotal_price());
			psmt.setInt(5, dto.getAdult_number());
			psmt.setInt(6, dto.getChild_number());
			psmt.setString(7, dto.getRoom_number());
			psmt.setString(8, dto.getRoom_number());
			psmt.setString(9, dto.getVisit_date());
			psmt.setString(10, dto.getLeave_date());
			System.out.println("3/6 booking suc");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 booking suc");
			
		} catch (Exception e) {
			System.out.println("booking fail" + e.getMessage());
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		
		return count > 0 ? true : false;
	}

	@Override
	public List<BookingDto> SelectBook(String id) {

		String sql = " SELECT SEQ, ID, WDATE, VISIT_DATE, LEAVE_DATE, TOTAL_PRICE, ADULT_NUMBER, CHILD_NUMBER, GRADE "
				+ " FROM BOOKING b, ROOM r "
				+ " WHERE ID = ? AND b.ROOM_NUMBER = r.ROOM_NUMBER " ;
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		System.out.println("sql:" + sql);
		List<BookingDto> list = new ArrayList<BookingDto>();
		
		try {
			conn = db.DBConnection.getConnection();
			System.out.println("1/6 SelectBook suc");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 SelectBook suc");
			psmt.setString(1, id);	
			
			rs = psmt.executeQuery();
			
			System.out.println("3/6 SelectBook suc");
			
			while(rs.next()) {
				BookingDto dto = new BookingDto(rs.getInt(1),
												rs.getString(2),
												rs.getDate(3),
												rs.getString(4),
												rs.getString(5),
												rs.getInt(6),
												rs.getInt(7),
												rs.getInt(8),
												rs.getString(9));
				list.add(dto);
				
			}
			
		} catch (Exception e) {
			System.out.println("SelectBook fail" + e.getMessage());
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		
		return list;
	}
	
	// 월별 통계
	@Override
	public List<AdminChartDto> chartDaily(String month) {
		String sql =  " SELECT SUM(TOTAL_PRICE), VISIT_DATE "
					+ " FROM (	SELECT * "
					+ " 		FROM BOOKING "
					+ " 		WHERE SUBSTR(VISIT_DATE,5,2) = ?) "
					+ " GROUP BY VISIT_DATE "
					+ " ORDER BY VISIT_DATE ASC ";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AdminChartDto> list = new ArrayList<AdminChartDto>();
			
		try {
			conn = DBConnection.getConnection();
			System.out.println("chartDaily 1/6 success !!");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("chartDaily 2/6 success !!");
				
			psmt.setString(1, month.trim());
			rs = psmt.executeQuery();
			System.out.println("chartDaily 3/6 success !!");

			while(rs.next()) {
				AdminChartDto dto = new AdminChartDto(rs.getInt(1));
				list.add(dto);
			}
			System.out.println("chartDaily 4/6 success !!");
				
		} catch (Exception e) {
			System.out.println("chartDaily fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}		
			
		return list;
	} // chartDaily 함수
		
		
	@Override
	public List<AdminTodayBookingDto> getTodayVisit(String date) {
			
		String sql =  " SELECT c.ID, c.NAME, c.grade, b.ADULT_NUMBER, b.CHILD_NUMBER, b.ROOM_NUMBER, b.VISIT_DATE, b.Leave_DATE "
					+ " FROM CUSTOMER c, BOOKING b "
					+ " WHERE c.ID = b.ID AND VISIT_DATE = ? "
					+ " ORDER BY ROOM_NUMBER ASC ";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
			
		List<AdminTodayBookingDto> list = new ArrayList<AdminTodayBookingDto>();
			
		try {
			conn = DBConnection.getConnection();
			System.out.println("getTodayVisit 1/6 success !!");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("getTodayVisit 2/6 success !!");
				
			psmt.setString(1, date);
				
			rs = psmt.executeQuery();
			System.out.println("getTodayVisit 3/6 success !!");
				
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
			System.out.println("getTodayVisit 4/6 success !!");
		
		} catch (Exception e) {
			System.out.println("getTodayVisit fail !!");
			e.printStackTrace();
		}
			
		return list;
	} // getTodayBooking 함수

	@Override
	public List<AdminTodayBookingDto> getTodayLeave(String date) {
		String sql =  " SELECT c.ID, c.NAME, c.grade, b.ADULT_NUMBER, b.CHILD_NUMBER, b.ROOM_NUMBER, b.VISIT_DATE, b.Leave_DATE "
					+ " FROM CUSTOMER c, BOOKING b "
					+ " WHERE c.ID = b.ID AND LEAVE_DATE = ? "
					+ " ORDER BY ROOM_NUMBER ASC ";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
			
		List<AdminTodayBookingDto> list = new ArrayList<AdminTodayBookingDto>();
			
		try {
			conn = DBConnection.getConnection();
			System.out.println("getTodayLeave 1/6 success !!");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("getTodayLeave 2/6 success !!");
				
			psmt.setString(1, date);
			rs = psmt.executeQuery();
			System.out.println("getTodayLeave 3/6 success !!");
				
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
			System.out.println("getTodayLeave 4/6 success !!");
			
		} catch (Exception e) {
			System.out.println("getTodayLeave fail !!");
			e.printStackTrace();
		}
			
		return list;
	} // getTodayBooking 함수
	
	
	@Override
	public List<AdminTodayBookingDto> getTodayBooking(String date) {
		String sql =  " SELECT c.ID, c.NAME, c.grade, b.ADULT_NUMBER, b.CHILD_NUMBER, b.ROOM_NUMBER, b.VISIT_DATE, b.Leave_DATE "
					+ " FROM CUSTOMER c, BOOKING b "
					+ " WHERE c.ID = b.ID "
					+ " AND VISIT_DATE < ? AND LEAVE_DATE > ? "
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
			
			psmt.setString(1, date.trim());
			psmt.setString(2, date.trim());
			rs = psmt.executeQuery();
			System.out.println("getTodayBooking 3/6 success !!");
			
			while(rs.next()) {
				int i = 1;
				AdminTodayBookingDto dto = new AdminTodayBookingDto(rs.getString(i++),
																	rs.getString(i++),
																	rs.getString(i++),
																	rs.getInt(i++),
																	rs.getInt(i++),
																	rs.getString(i++),
																	rs.getString(i++),
																	rs.getString(i++));
				list.add(dto);
			}			
			
		} catch (SQLException e) {
			System.out.println("getTodayBooking fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}		

		return list;
	}

		
		
	// 예약조회 페이지에서 나의 예약조회 리스트 가져오기
	@Override
	public List<BookingCheckDto> getBookingCheck(String id) {
		String sql =  " SELECT C.NAME, B.SEQ, B.ID, TO_CHAR(B.WDATE,'YYYYMMDD'), B.VISIT_DATE, B.LEAVE_DATE, "
					+ "			B.TOTAL_PRICE, B.ADULT_NUMBER, B.CHILD_NUMBER, B.ROOM_NUMBER "
					+ " FROM CUSTOMER C, BOOKING B "
					+ " WHERE C.ID = B.ID AND C.ID = ? "
					+ " AND B.VISIT_DATE >= TO_CHAR(SYSDATE,'YYYYMMDD') "
					+ " ORDER BY B.VISIT_DATE ASC ";
		
		System.out.println("getBookingCheck sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BookingCheckDto> list = new ArrayList<BookingCheckDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("getBookingCheck 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("getBookingCheck 2/6 success !!");
			
			psmt.setString(1, id.trim());
			rs = psmt.executeQuery();
			System.out.println("getBookingCheck 3/6 success !!");

			while(rs.next()) {
				int i = 1;
				BookingCheckDto dto = new BookingCheckDto(rs.getString(i++),
															rs.getInt(i++),
															rs.getString(i++),
															rs.getString(i++),
															rs.getString(i++),
															rs.getString(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getString(i++));
				list.add(dto);
			}
			System.out.println("getBookingCheck 4/6 success !!");
			
		} catch (Exception e) {
			System.out.println("getBookingCheck fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}

		return list;
	} // getBookingCheck 함수


	// 예약조회 페이지에서 취소하기
	@Override
	public boolean delete(int seq) {
		String sql = "  DELETE "
					+ " FROM BOOKING "
					+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("delete 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("delete 2/6 success !!");
			
			psmt.setInt(1, seq);
			System.out.println("delete 3/6 success !!");
			
			count = psmt.executeUpdate();
			System.out.println("delete 4/6 success !!");
			
		} catch (Exception e) {
			System.out.println("delete fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		

		return count>0?true:false;
	} // delete 함수



	@Override
	public boolean outCustomer(String id) {
		String sql =  " UPDATE BOOKING SET ID = NULL "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("outCustomer 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("outCustomer 2/6 success !!");
			
			psmt.setString(1, id);
			count = psmt.executeUpdate();
			System.out.println("outCustomer 3/6 success !!");
			
		} catch (SQLException e) {
			System.out.println("outCustomer fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
		
		return count>0?true:false;
	}

	
}
