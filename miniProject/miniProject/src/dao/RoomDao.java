package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.RoomDto;

public class RoomDao implements iRoomDao {
	
	private static RoomDao dao = new RoomDao();
	
	
	private RoomDao() {
		DBConnection.initConnect();
	}
	
	public static RoomDao getInstance() {
		return dao;
	}

	@Override
	public List<RoomDto> getRoomSearchList(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addRoom(RoomDto dto) {
		
		String sql = " INSERT INTO ROOM(ROOM_NUMBER, PRICE, GRADE) " + 
				" VALUES(?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		int count=0;
	
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getRoom_number());
			psmt.setInt(2, dto.getPrice());
			psmt.setString(3, dto.getGrade());
	
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return count>0?true:false;
		
	}

	@Override
	public boolean delRoom(String room_num) {
		
		String sql = " DELETE FROM ROOM "
				+ " WHERE ROOM_NUMBER = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		int count=0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, room_num);

			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return count>0?true:false;
		
	}

	@Override
	public boolean changeRoom(RoomDto dto) {
		
		String sql =  " UPDATE ROOM SET PRICE = ?, GRADE = ? "
				+ " WHERE ROOM_NUMBER = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		int count=0;

		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getPrice());
			psmt.setString(2, dto.getGrade());
			psmt.setString(3, dto.getRoom_number());

			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return count>0?true:false;
		
	}

	@Override
	public boolean CheckRoom_Number(String Room_num) {

		String sql = " SELECT ROOM_NUMBER "
				+ " FROM ROOM "
				+ " WHERE ROOM_NUMBER = ? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		boolean check = false;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, Room_num);
	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String _id = rs.getString("ID");
			}else {
				//System.out.println("일치하는 값이 없습니다 읽어오기 실패!!");
				check = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return check;
		
	}
	
	// 모든 Room List
		@Override
		public List<RoomDto> getRoomList() {
			
			String sql = " SELECT ROOM_NUMBER, PRICE, GRADE "
					   + " FROM ROOM "
					   + " ORDER BY ROOM_NUMBER ASC ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<RoomDto> list = new ArrayList<RoomDto>();
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getRoomList suc");
				
				psmt = conn.prepareStatement(sql);
				
				System.out.println("2/6 getRoomList suc");
				System.out.println("getRoomList sql : " + sql);
				
				rs = psmt.executeQuery();
				System.out.println("3/6 getRoomList suc");
				
				while(rs.next()) {
					RoomDto dto = new RoomDto(	rs.getString(1),
												rs.getInt(2),
												rs.getString(3));
					list.add(dto);
				}
				System.out.println("4/6 getRoomList suc");
				
			} catch (SQLException e) {
				System.out.println("getRoomList fail");
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			return list;
			
		}
		
		
		// 객실 수정
		@Override
		public boolean updateRoom(RoomDto dto) {
			
			String sql = " UPDATE ROOM "
					   + " SET PRICE=?, GRADE=? "
					   + " WHERE ROOM_NUMBER=? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			System.out.println("update sql : " + sql);
			
			int count = 0;

			try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, dto.getPrice());
				psmt.setString(2, dto.getGrade());
				psmt.setString(3, dto.getRoom_number());
				
				count = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			
			return count>0?true:false;
		}

		// 객실 삭제
		@Override
		public boolean deleteRoom(String room_number) {
			String sql = " DELETE FROM ROOM "
					   + " WHERE ROOM_NUMBER=? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			int count = 0;
			System.out.println("sql : " + sql);
			
			try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, room_number);
							
				count = psmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, null);
			}
			return count > 0 ? true:false;
		}
		
		@Override
		public List<RoomDto> getAllList(String visit_date, String leave_date) {
			
			System.out.println("visit_date:" + visit_date);
			System.out.println("leave_date:" + leave_date);
			
			String sql = " SELECT ROOM_NUMBER, PRICE, GRADE " +
					 " FROM ROOM " +
					" WHERE ROOM_NUMBER NOT IN " +
					" (SELECT distinct ROOM_NUMBER FROM BOOKING WHERE " +
				" VISIT_DATE >= ? AND VISIT_DATE <= ?) " +
				" ORDER BY ROOM_NUMBER ";
			
			System.out.println("sql:" + sql);
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<RoomDto> list = new ArrayList<RoomDto>();
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getRoomList suc");

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, visit_date);
				psmt.setString(2, leave_date);
				System.out.println("2/6 getRoomList suc");

				rs = psmt.executeQuery();
				System.out.println("3/6 getRoomList suc");

				while (rs.next()) {
					RoomDto dto = new RoomDto(rs.getString(1), rs.getInt(2), rs.getString(3));
					list.add(dto);
				}
				System.out.println("4/6 getRoomList suc");

			} catch (Exception e) {
				System.out.println("getRoomList fail " + e.getMessage());
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}

			return list;

		}

		@Override
		public List<RoomDto> getList(int num1, int num2, String visit_date) {
			String sql = " SELECT ROOM_NUMBER, PRICE, GRADE " +
			" FROM " +
				"(SELECT ROW_NUMBER()OVER(ORDER BY ROOM_NUMBER DESC) AS RNUM, ROOM_NUMBER, " + 
				" PRICE, GRADE " +
				" FROM ROOM " +
				" ORDER BY GRADE, ROOM_NUMBER ) " +
			" WHERE RNUM >= ? AND RNUM <= ? AND ROOM_NUMBER NOT IN " + 
			 								" (SELECT ROOM_NUMBER FROM BOOKING WHERE " + 
			 								" TO_DATE(LEAVE_DATE, 'YYYYMMDD') - TO_DATE( " + visit_date + ", 'YYYYMMDD') > -1) " +
			" ORDER BY GRADE, ROOM_NUMBER DESC ";
			
			
		
			System.out.println("sql " + sql);
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			List<RoomDto> list = new ArrayList<RoomDto>();
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getRoomList suc");

				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 getRoomList suc");
				psmt.setInt(1, num1);
				psmt.setInt(2, num2);
				
				rs = psmt.executeQuery();
				
				
				System.out.println("3/6 getRoomList suc");

				while (rs.next()) {
					RoomDto dto = new RoomDto(rs.getString(1), rs.getInt(2), rs.getString(3));
					list.add(dto);
				}
				System.out.println("4/6 getRoomList suc");

			} catch (Exception e) {
				System.out.println("getRoomList fail " + e.getMessage());
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}

			return list;
		}
		
	
	
	

}
