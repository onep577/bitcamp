package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CustuserDto;

public class CustuserDao {
	
	private static CustuserDao dao = null;
	
	private CustuserDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// 클래스를 못 찾았을 때 익셉션 나온다
			e.printStackTrace();
		}
	} // CustuserDao 기본 생성자
	
	// CustuserDao 클래스가 싱글톤이 되었다
	public static CustuserDao getInstance() {
		if(dao == null) {
			dao = new CustuserDao();
		}
		return dao;
	}
	
	
	
	// list에 있는 모든 정보를 가져온다
	public List<CustuserDto> getCustuserList(){
		String sql =  " SELECT ID, NAME, ADDRESS "
					+ " FROM CUSTUSER "
					+ " ORDER BY ID DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		// 디비정보 얻어올 때. sql구문을 넣을 때. 결과를 리턴받을 때
		
		List<CustuserDto> list = new ArrayList<CustuserDto>();
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("ID");
				String name = rs.getString("NAME");
				String address = rs.getString("ADDRESS");
				
				CustuserDto dto = new CustuserDto(id, name, address);
				list.add(dto);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, rs);
		}
		
		return list;
		
	} // getCustuserList 함수

	// 고객정보 추가
	public int addCustuser(String id, String name, String address) {
		//System.out.println("id : " + id + ", name : " + name + ", address : " + address);
		
		String sql =  " INSERT INTO CUSTUSER(ID, NAME, ADDRESS) "
					+ " VALUES(?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		// 디비정보 얻어올 때. sql구문을 넣을 때.
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, address);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, null);
		}
		
		return count;
		
	} // addCustuser 함수
	
	// 한 명의 고객정보를 가져온다
	public CustuserDto getOnelist(String id) {
		String sql =  " SELECT ID, NAME, ADDRESS "
					+ " FROM CUSTUSER "
					+ " WHERE ID = ? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		// 디비정보 얻어올 때. sql구문을 넣을 때. 결과를 리턴받을 때
		
		CustuserDto dto = null;
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);			
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new CustuserDto(rs.getString(1),
									rs.getString(2),
									rs.getString(3));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, rs);
		}
		
		return dto;
	} // getOnelist 함수
	
	// 고객의 정보를 모두 삭제한다
	public boolean delcustuser(String id) {
		String sql =  " DELETE "
					+ " FROM CUSTUSER "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		// 디비정보 얻어올 때. sql구문을 넣을 때.
		
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
		
	} // delcustuser 함수
	
	// 고객의 정보를 수정한다
	public boolean updatecustuser(String id, String name, String addr) {
		String sql =  " UPDATE CUSTUSER "
					+ " SET NAME = ? , ADDRESS = ? "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = this.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, addr);
			psmt.setString(3, id);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, psmt, null);
		}
		
		return count>0?true:false;
		
	} // updatecustuser
	
	
	
	
	
	
	public Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@192.168.0.26:1521:xe";
		String user = "hr";
		String pass = "hr";

		Connection conn = DriverManager.getConnection(url, user, pass);
		
		return conn;
	} // getConnection 함수
	
	public void close(Connection conn, PreparedStatement psmt, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} // close 함수

}
