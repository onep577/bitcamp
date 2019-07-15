package main;

import db.jdbcTest;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	JDBC
		 	JAVA DataBase Connectivity
		*/
		
		jdbcTest jt = new jdbcTest();
		// Driver Loading Success!!
		
		//UserDto dto = new UserDto("ccc", "둘리", 333, "");
		
		int n = jt.Insert("ggg", "코끼리", 777);
		// DB Connection Success!!
		// sql :  INSERT INTO USERDTO(ID, NAME, AGE, JOINDATE)  VALUES('aaa', '홍길동', 111, SYSDATE)
		System.out.println("n : " + n);
		
		if(n > 0) {
			System.out.println("정상 추가 완료");
		}

	} // main 함수

}
