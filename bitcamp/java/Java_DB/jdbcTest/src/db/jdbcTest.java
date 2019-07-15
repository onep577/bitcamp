package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class jdbcTest {
	
	public jdbcTest() {
		try { Class.forName("oracle.jdbc.driver.OracleDriver");
			// ojdbc6.jar 파일에 oracle.jdbc.driver 패키지에 OracleDriver.class가 있다
			// 사용 할 DBMS에 맞는 드라이버의 full name을 인수로 준다
			// oracle에 맞는 드라이버의 full name은 ojdbc6.jar로 알 수 있다
			System.out.println("Driver Loading Success!!");
		} catch (ClassNotFoundException e) {
			// oracle.jdbc.driver.OracleDriver가 없을 때 익셉션
			e.printStackTrace();
		}
	} // jdbcTest 기본 생성자
	 

	public Connection getConnection() {
		// 자바와 DB를 연결시킨다
		Connection conn = null; // 처음은 null값으로 설정
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.26:1521:xe", "hr", "hr");
			// Drivermanager 클래스란? 연결된 Connection 정보를 리턴해주는 클래스
			// getConnection URL에 연결 시도
			System.out.println("conn : " + conn);
			// conn : oracle.jdbc.driver.T4CConnection@4ee285c6
			System.out.println("DB Connection Success!!");
		} catch (SQLException e) {
			// DB가 유효하지 않을 때 익셉션
			e.printStackTrace();
		}
		return conn;
	} // getConnection 함수

}
