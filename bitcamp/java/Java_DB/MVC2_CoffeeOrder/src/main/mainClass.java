package main;

import db.DBConnection;
import single.Singleton;

public class mainClass {

	public static void main(String[] args) {
		DBConnection.initConnection();

		Singleton s = Singleton.getInstance();
		// main -> controller -> login 함수. 나중에서 이 작업을 spring이 대신 해준다
		s.cusControl.login();
	}

}
