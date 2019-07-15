package main;

import db.DBConnection;
import view.loginView;

public class mainClass {

	public static void main(String[] args) {
		// db init
		DBConnection.initConnection();
		
		// 첫번째 view 이동
		new loginView();
	}

}

