package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbcTest {
	
	public jdbcTest() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
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
	
	public int Insert(String id, String name, int age) {
		// 앞 뒤에 한칸씩 띄어쓰는 이유 안 띄어쓰면 sql문 에러난다
		// QUERY문 작성할 때는 앞 뒤 한칸씩 띄어쓰자
		// SELECT INTO USERDTO(ID, NAME, AGE, JOINDATE)
		// VALUES('id', 'name', 'age', SYSDATE);
		String sql = " INSERT INTO USERDTO(ID, NAME, AGE, JOINDATE) "
				+ " VALUES('" + id + "', '" + name + "', " + age + ", SYSDATE) ";
		
		Connection conn = getConnection(); // 자신의 db 정보를 연결해 놓은 걸 가져온다
		System.out.println("Insert conn : " + conn);
		Statement stmt = null; // 현재 상태를 얻어올
		
		int count = 0;
		
		System.out.println("sql : " + sql);
		// sql문에서 에러가 가장 많이 난다 확인 작업!
		
		try {
			stmt = conn.createStatement();
			// 연결된 디비의 정보를 가지고 있는 컨넥을 통해서
			// SQL 문을 데이타베이스에 보내기위한 statement를 만든다
			System.out.println("Insert stmt : " + stmt);
			// stmt : oracle.jdbc.driver.OracleStatementWrapper@3c5a99da
			
			count = stmt.executeUpdate(sql);
			// 업데이트를 실행하자 무슨 문장을? 위의 sql 문장을
			System.out.println("Insert conn : " + conn);
			// conn : oracle.jdbc.driver.T4CConnection@29444d75
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// finally은 무조건 실행된다 중간에 함수 튀어나가도 무조건 실행된다

			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // finally
		return count; // 몇개 추가하였는지
		// 1이 나오면 추가 됨. 0이 나오면 추가 실패
		
	} // Insert 함수
	
} // jdbcTest 클래스









