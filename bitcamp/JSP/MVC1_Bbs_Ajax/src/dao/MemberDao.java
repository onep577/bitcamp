package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.MemberDto;

public class MemberDao {
	public static MemberDao dao = null;
	
	public static MemberDao getInstance() {
		if(dao == null) {
			dao = new MemberDao();
		}
		return dao;
	}
	
	private MemberDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// 클래스를 못 찾았을 때 익셉션 나온다
			e.printStackTrace();
		}
	} // MemberDao 기본 생성자
	
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@192.168.0.12:1521:xe";
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
		String sql =  " INSERT INTO MEMBER(ID, PASSWORD, NAME, EMAIL) "
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
	public MemberDto checkLogin(String id, String password) {
		String sql =  " SELECT ID, PASSWORD, NAME, EMAIL "
					+ " FROM MEMBER "
					+ " WHERE ID=? AND PASSWORD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new MemberDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4) );
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
					+ " FROM MEMBER "
					+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
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
					+ " FROM MEMBER "
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
