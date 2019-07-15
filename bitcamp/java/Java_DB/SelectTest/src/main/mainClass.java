package main;

import java.util.List;

import db.DBConnection;
import dto.UserDto;
import select.SelectTest;

public class mainClass {

	public static void main(String[] args) {
		DBConnection.initConnection();
		// 클래스가 있는지 확인하는 것
		
		SelectTest st = new SelectTest();
		// Driver Loading Success!!
		
		UserDto ud = st.search("aaa");
		//DB Connection Success!!
		//sql :  SELECT ID, NAME, AGE, JOINDATE  FROM USERDTO  WHERE ID = 'aaa' 
		
		if(ud != null) {
			System.out.println(ud.toString());
			// UserDto [id=aaa, name=홍길동, age=25, joindate=2019-06-27 14:00:20.0]
		}else {
			System.out.println("데이터를 찾을 수 없습니다");
		}
		
			
			
			
		ud = st.search2("aaa");
		// DB Connection Success!!
		if(ud != null) {
			System.out.println(ud.toString());
			// UserDto [id=aaa, name=홍길동, age=25, joindate=2019-06-27 14:00:20.0]
		}else {
			System.out.println("데이터를 찾을 수 없습니다");
		}
		
		List<UserDto> userlist = st.getUserList();
		// sql :  SELECT ID, NAME, AGE, JOINDATE  FROM USERDTO 
		// DB Connection Success!!
		
		for (UserDto user : userlist) {
			System.out.println(user.toString());
		}
	} // main 함수

}
