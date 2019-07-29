package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
		
	public static void DBConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// 클래스를 못 찾았을 때 익셉션 나온다
			e.printStackTrace();
		}
	} // MemberDao 기본 생성자
	
	public static Connection getConnection() throws SQLException {
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

}
