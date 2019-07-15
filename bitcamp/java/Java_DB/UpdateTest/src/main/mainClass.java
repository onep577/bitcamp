package main;

import db.DBConnection;
import up.UpdateTest;

public class mainClass {

	public static void main(String[] args) {
		DBConnection.initConnection();
		// Driver Loading Success!!
		
		UpdateTest ut = new UpdateTest();
		// DB Connection Success!!
		
		String id = "aaa";
		int age = 35;
		
		boolean b = ut.update(id, age);
		// sql :  UPDATE USERDTO  SET AGE = 27  WHERE ID = 'aaa' 

		if(b) {
			System.out.println("성공적으로 수정되었습니다");
		}else {
			System.out.println("데이터가 수정되지 못 했습니다");
		}

	} // main 함수

}
