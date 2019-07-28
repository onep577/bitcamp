package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CustomerDto;
import dto.PriceDto;

public class CoffeeDao {
	
	public static CoffeeDao dao = null;
	
	public static CoffeeDao getInstance() {
		if(dao == null) {
			dao = new CoffeeDao();
		}
		return dao;
	}
	
	public CoffeeDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// 클래스를 못 찾았을 때 익셉션 나온다
			e.printStackTrace();
		}
	} // CustomerDao 기본 생성자
	
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@192.168.0.26:1521:xe";
		String user = "hr";
		String pass = "hr";
		
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
		
	} // getConnection 함수
	
	
	
	
	
	// 회원가입
	public boolean addMember(String id, String pw, String name, String email) {
		String sql =  " INSERT INTO COFFEECUSTOMER(ID, PASSWORD, NAME, EMAIL) "
					+ " VALUES(?,?,?,?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, email);
			count = psmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, null);
		}	
		
		return count>0?true:false;
	} // addMember 함수
	
	
	
	// 로그인 할 때 
	public CustomerDto checkLogin(String id, String password) {
		String sql =  " SELECT ID, PASSWORD, NAME, EMAIL "
					+ " FROM COFFEECUSTOMER "
					+ " WHERE ID=? AND PASSWORD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		CustomerDto dto = null;
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new CustomerDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4) );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, rs);
		}
		
		return dto;
	}
	
	
	
	// id 중복체크 확인
	public boolean getUserId(String id) {
		String sql =  " SELECT ID "
					+ " FROM COFFEECUSTOMER "
					+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, null);
		}
		
		return count>0?true:false;
		
	} // getUserId 함수
	
	
	
	// id 있는지 확인 후 password 있는지 확인
	public boolean getUserpw(String id, String pw){
		String sql =  " SELECT ID, PASSWORD "
					+ " FROM COFFEECUSTOMER "
					+ " WHERE ID=? AND PASSWORD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
	
	
	// 커피 가격표를 전체 가져온다
	//@SuppressWarnings("null")
	public List<PriceDto> getPrice() {
		String sql =  " SELECT COFF_TYPE, COFF_SHORT, COFF_TALL, COFF_GRAND "
					+ " FROM COFFEEPRICE ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PriceDto dto = null;
		List<PriceDto> list = new ArrayList<PriceDto>();
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new PriceDto(rs.getString(1),
									rs.getInt(2),
									rs.getInt(3),
									rs.getInt(4));
				list.add(dto);
			} // while문
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
	
	
	public void close(Connection conn, PreparedStatement psmt, ResultSet rs) {
		try {
			if(conn != null) {
				conn.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(rs != null) {
				rs.close();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	} // close 함수

}
