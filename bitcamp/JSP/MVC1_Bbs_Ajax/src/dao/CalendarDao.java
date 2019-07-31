package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CalendarDto;
import oracle.jdbc.driver.DBConversion;

public class CalendarDao implements iCalendar {
	
	private static CalendarDao dao = new CalendarDao();
	
	private CalendarDao() {		
	}
	
	public static CalendarDao getInstance() {
		return dao;
	}
	
	public List<CalendarDto> getCalendarList(String id, String yyyymm){
		// 매개변수 : 누구 일정인가? 어느 년도의 몇월인가?
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE " 
					+ " FROM (SELECT ROW_NUMBER() OVER(PARTITION BY SUBSTR(RDATE, 1, 8) ORDER BY RDATE ASC) RNUM, "
					+ " 		SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
					+ " 		FROM CALENDAR "
					+ " 		WHERE ID=? AND SUBSTR(RDATE, 1, 6)=? ) "
					+ " WHERE RNUM BETWEEN 1 AND 5 ";
		
				
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getCalendarList success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, yyyymm.trim());
			System.out.println("2/6 getCalendarList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getCalendarList success");
			
			while(rs.next()) {
				int i = 1;
				CalendarDto dto = new CalendarDto(rs.getInt(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++), 
												rs.getString(i++));
				list.add(dto);
			}
			System.out.println("4/6 getCalendarList success");
			
			
		} catch (SQLException e) {
			System.out.println("5/6 getCalendarList success");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
				
	} // getCalendarList 함수
		


	// 일정 추가
	@Override
	public boolean addCalendar(CalendarDto dto) {
		String sql =  " INSERT INTO CALENDAR(SEQ, ID, TITLE, CONTENT, RDATE, WDATE) "
					+ " VALUES(SEQ_CAL.NEXTVAL,?,?,?,?, SYSDATE) ";
		
		//System.out.println("insertCalendar : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId().trim());
			psmt.setString(2, dto.getTitle().trim());
			psmt.setString(3, dto.getContent().trim());
			psmt.setString(4, dto.getRdate().trim());
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
		
		return count>0?true:false;
	} // insertCalendar 함수
	
	

	@Override
	public CalendarDto getOneCalendar(int seq) {
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
					+ " FROM CALENDAR "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		CalendarDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new CalendarDto(rs.getInt(1),
									rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6) );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
		
		return dto;
	} // getOneCalendar 함수
	
	
	
	@Override
	public boolean delCalendar(int seq) {
		String sql =  " DELETE CALENDAR "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
		
		return count>0?true:false;
	}
	
	
	
	@Override
	public boolean updateCalendar(CalendarDto dto) {
		String sql =  " UPDATE CALENDAR "
					+ " SET TITLE=?, RDATE=?, CONTENT=? "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getRdate());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, dto.getSeq());
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
		
		return count>0?true:false;
	}
	


	@Override
	public List<CalendarDto> getcallist(String rdate) {
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
					+ " FROM CALENDAR "
					+ " WHERE RDATE LIKE ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + rdate + "%");
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CalendarDto dto = new CalendarDto(rs.getInt(1),
												rs.getString(2),
												rs.getString(3),
												rs.getString(4),
												rs.getString(5),
												rs.getString(6));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
}
