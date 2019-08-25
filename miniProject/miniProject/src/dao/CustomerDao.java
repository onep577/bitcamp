package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.AdminChartDto;
import dto.CustomerDto;

public class CustomerDao implements iCustomerDao{
	
	private static CustomerDao dao = new CustomerDao();
	
	private CustomerDao() {
		DBConnection.initConnect();
	}
	
	public static CustomerDao getInstance() {
		return dao;
	}

	@Override
	public boolean addCustomer(CustomerDto dto) {
		String sql = " INSERT INTO CUSTOMER(ID, PASSWORD, NAME, ADDRESS, BIRTHDAY, PHONE, AUTH, EMAIL, GRADE, BOOKING_COUNT, TOTAL_PAYMENT) " + 
				" VALUES(?, ?, ?, ?, ?, ?, 3, ?, '일반', 0, 0) ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		int count=0;
	
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getBirthday());
			psmt.setString(6, dto.getPhone());
			psmt.setString(7, dto.getEmail());
	
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return count>0?true:false;
	}

	@Override
	public boolean getidcheck(String id) {
		
		String sql = " SELECT ID "
				+ " FROM CUSTOMER "
				+ " WHERE ID = ? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		boolean check = false;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
	
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

	@Override
	public CustomerDto loginCustomer(String id, String pwd) {
		
		String sql = " SELECT ID, PASSWORD, NAME, ADDRESS, BIRTHDAY, PHONE, AUTH, EMAIL, GRADE, BOOKING_COUNT, TOTAL_PAYMENT "
				+ " FROM CUSTOMER "
				+ " WHERE ID = ? AND PASSWORD = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		CustomerDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int i=1;
				dto = new CustomerDto(rs.getString(i++), 
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
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}

		return dto;
	}

	@Override
	public boolean infoChangeCustomer(CustomerDto dto) {
		
		String sql =  " UPDATE CUSTOMER SET PASSWORD = ?, NAME = ?, ADDRESS = ?, BIRTHDAY = ?, PHONE = ?, EMAIL = ? "
				+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		int count=0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPwd());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getAddress());
			psmt.setString(4, dto.getBirthday());
			psmt.setString(5, dto.getPhone());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getId());

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
	public boolean delCustomer(String id) {
		
		String sql = " DELETE FROM CUSTOMER "
				+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		int count=0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

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
	public boolean B_T_ChangeCustomer(CustomerDto dto) {
		
		String sql =  " UPDATE CUSTOMER SET BOOKING_COUNT = BOOKING_COUNT + 1, TOTAL_PAYMENT = TOTAL_PAYMENT + ? "
				+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		int count=0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getTotal_payment());
			psmt.setString(2, dto.getId());

			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		GradeChange(dto.getId());
		
		return count>0?true:false;
	}

	@Override
	public boolean GradeChange(String id) {
		
		CustomerDto dto = getCustomer(id);
		
		int count=0;
		String grade = "일반";
		
		if(dto.getTotal_payment() > 20000000) {
			grade = "VVIP";
		}else if(dto.getTotal_payment() > 10000000) {
			grade = "VIP";
		}else if(dto.getTotal_payment() > 3000000) {
			grade = "골드";
		}else if(dto.getTotal_payment() > 500000) {
			grade = "실버";
		}
		
		String sql =  " UPDATE CUSTOMER SET GRADE = ? "
				+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, grade);
			psmt.setString(2, id);

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
	public CustomerDto getCustomer(String id) {
		
		String sql = " SELECT ID, PASSWORD, NAME, ADDRESS, BIRTHDAY, PHONE, AUTH, EMAIL, GRADE, BOOKING_COUNT, TOTAL_PAYMENT "
				+ " FROM CUSTOMER "
				+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		CustomerDto dto = null;
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int i=1;
				dto = new CustomerDto(rs.getString(i++), 
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
						
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}

		return dto;
		
	}

	@Override
	public List<CustomerDto> getCustomerList() {
		
		String sql = " SELECT ID, PASSWORD, NAME, ADDRESS, BIRTHDAY, PHONE, AUTH, EMAIL, GRADE, BOOKING_COUNT, TOTAL_PAYMENT "
				+ " FROM CUSTOMER "
				+ " ORDER NAME ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CustomerDto> list = new ArrayList<CustomerDto>();
		
		try {
			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
	
			rs = psmt.executeQuery();
			
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
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
		
	}
	
	
	// 검색된 회원정보 가져오기
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
				
			}else if(search.equals("address")) {
				sql += " AND ADDRESS LIKE '%" + text.trim() + "%' ";
				
			}
			
			System.out.println("회원관리 : 검색 " + sql);
						
			
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
		
		
		
		// 회원정보 가져오기
		@Override
		public List<CustomerDto> getCustomerList(String search, String text, String page) {
			String sql =  " SELECT ID, PASSWORD, NAME, ADDRESS, BIRTHDAY, PHONE, AUTH, EMAIL, GRADE, BOOKING_COUNT, TOTAL_PAYMENT "
						  + " FROM ( SELECT ROW_NUMBER()OVER(ORDER BY NAME ASC, ID ASC) AS RNUM, "
						  + 			" ID, PASSWORD, NAME, ADDRESS, BIRTHDAY, PHONE, AUTH, EMAIL, GRADE, BOOKING_COUNT, TOTAL_PAYMENT "
						  +		   " FROM CUSTOMER "
						  + 	   " WHERE 1=1 ";
			

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
				
			}else if(search.equals("address")) {
				sql += " AND ADDRESS LIKE '%" + text.trim() + "%' ";
				
			}
			
			sql += " ) ";
			sql += " WHERE RNUM >= ? AND RNUM <= ? ";

			
			System.out.println("회원관리 : 검색 : 페이징 " + sql);
						
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<CustomerDto> list = new ArrayList<CustomerDto>();
			
			try {			
				conn = DBConnection.getConnection();
				System.out.println("getCustomerList 1/6 success !!");
				
				psmt = conn.prepareStatement(sql);
				
				if(page.equals("1")) {
					psmt.setInt(1, 1);
					psmt.setInt(2, 10);
				}else {
					int _page = Integer.parseInt(page);
					psmt.setInt(1, _page * 10 - 9);
					psmt.setInt(2, _page * 10);
				}			
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

	@Override
	public boolean getidandemailcheck(String id, String email) {
		
		String sql = " SELECT ID "
				+ " FROM CUSTOMER "
				+ " WHERE ID = ? AND EMAIL = ? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("sql:" + sql);
		
		System.out.println(id);
		System.out.println(email);
		
		boolean check = false;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, email);
	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String _id = rs.getString("ID");
				check = true;
			}else {
				//System.out.println("일치하는 값이 없습니다 읽어오기 실패!!");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return check;
	}


	@Override
	public boolean cancel(String id, int price) {
		String sql =  " UPDATE CUSTOMER SET BOOKING_COUNT = BOOKING_COUNT - 1, TOTAL_PAYMENT = TOTAL_PAYMENT - ? "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("cancel 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("cancel 2/6 success !!");
			
			psmt.setInt(1, price);
			psmt.setString(2, id);
			count = psmt.executeUpdate();
			System.out.println("cancel 3/6 success !!");
			
		} catch (SQLException e) {
			System.out.println("cancel fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		GradeChange(id);

		return count>0?true:false;
	} // cancel 함수
	
	
	
}
