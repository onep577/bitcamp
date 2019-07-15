package jdbcTest;

import java.sql.Connection;

import db.jdbcTest;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	JDBC
		 	JAVA DataBase Connectivity
		*/
		
		jdbcTest jt = new jdbcTest();
		// 기본생성자가 호출될 때 드라이버가 로드된다
		
		Connection conn = jt.getConnection();
		// getConnection()이 호출될 때 자바와 DB가 연결된다
		System.out.println("conn : " + conn);
		// conn : oracle.jdbc.driver.T4CConnection@4ee285c6
	}

}
