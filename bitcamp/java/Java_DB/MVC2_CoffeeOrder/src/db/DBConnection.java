package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static void initConnection(){
		// 어디서나 접근 할 수 있게 static 메소드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver Loading Success!!");
		} catch (ClassNotFoundException e) {
			// oracle.jdbc.driver.OracleDriver 가 없을 때 익셉션
			e.printStackTrace();
		}
	} // initConnection 함수
	
	public static Connection getConnection(){
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.26:1521:xe", "hr", "hr");
			// 자바와 DB를 연결시킨다
			
			System.out.println("DB Connection Success!!");
		} catch (SQLException e) {
			// DB가 유효하지 않을 때 익셉션
			e.printStackTrace();
		}
		return conn;
		
	} // getConnection 함수
}
