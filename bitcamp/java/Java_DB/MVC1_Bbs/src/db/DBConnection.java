package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static void initConnection(){
		// 어디서나 접근 할 수 있게 static 메소드
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// ojdbc6.jar 파일에 oracle.jdbc.driver 패키지에 OracleDriver.class가 있다
			// 사용 할 DBMS에 맞는 드라이버의 full name을 인수로 준다
			// oracle에 맞는 드라이버의 full name은 ojdbc6.jar로 알 수 있다
			System.out.println("Driver Loading Success!!");
		} catch (ClassNotFoundException e) {
			// oracle.jdbc.driver.OracleDriver 가 없을 때 익셉션
			e.printStackTrace();
		}
	} // initConnection 함수
	
	public static Connection getConnection(){
		// 어디서나 접근 할 수 있게 static 메소드
		Connection conn = null; // 처음은 null로 설정
		
		try {
			// Drivermanager 클래스란? 연결된 Connection 정보를 리턴해주는 클래스
			// getConnection URL에 연결 시도
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
