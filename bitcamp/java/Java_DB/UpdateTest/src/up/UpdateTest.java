package up;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBClose;
import db.DBConnection;

public class UpdateTest {
	
	public boolean update(String id, int age) {
		String sql = " UPDATE USERDTO "
				+ " SET AGE = " + age + " "
				+ " WHERE ID = '" + id + "' ";
		
		Connection conn = DBConnection.getConnection();
		// 자신의 db 정보를 연결해 놓은 걸 가져온다
		
		// DB Connection Success!!
		Statement stmt = null; // 현재 상태를 얻어올
		
		int count = 0;
		
		System.out.println("sql : " + sql);
		// sql문에서 에러가 가장 많이 난다 확인 작업!
		
		try{
			stmt = conn.createStatement();	
			// 연결된 디비의 정보를 가지고 있는 컨넥을 통해서
			// SQL 문을 데이타베이스에 보내기위한 statement를 만든다	
			count = stmt.executeUpdate(sql);
			// 업데이트를 실행하자 무슨 문장을? 위의 sql 문장을
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(stmt, conn, null);
		}
		return count>0?true:false;
		// 삼항함수
		// count가 0보다 크면 true
		// count가 0보다 작으면 false
		
	} // update 함수

}
