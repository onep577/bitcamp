package select;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.UserDto;

public class SelectTest {

	///////////////////// 하나의 데이터만 검색 -> dto Statement
	public UserDto search(String id) {
		String sql =  " SELECT ID, NAME, AGE, JOINDATE "
					+ " FROM USERDTO "
					+ " WHERE ID = '" + id + "' ";
		
		Connection conn = DBConnection.getConnection();
		// 연결된 DB 정보를 가져온다
		
		Statement stmt = null; // 현재 상태를 얻어올
		ResultSet rs = null;		
		UserDto dto = null;
		
		System.out.println("sql : " + sql);
		
		try {
			stmt = conn.createStatement();
			// 연결된 디비의 정보를 가지고 있는 컨넥을 통해서
			// SQL 문을 데이터베이스에 보내기위한 statement를 만든다	
			
			rs = stmt.executeQuery(sql);
			// statement를 통해서
			// select는 값을 받아와야 한다 우리가 원하는 데이터를 갖고있는 것
			
			if(rs.next()) {
				// query문에 상응하는 값이 참이 나왔을 때
				// String, String, int, String
				String _id = rs.getString("id");
				String _name = rs.getString("name");
				int _age = rs.getInt("age");
				String _joindate = rs.getString("joindate");
				// joindate는 회원가입
				// sql문과 순서가 맞아야한다
				
				dto = new UserDto(_id, _name, _age, _joindate);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(stmt, conn, rs);
		}
		return dto;
		// 못 찾았으면 null값이 간다
	}
	
	///////////////////// 하나의 데이터만 검색 -> dto PreparedStatement
	public UserDto search2(String id) {
		String sql =  " SELECT ID, NAME, AGE, JOINDATE "
					+ " FROM USERDTO "
					+ " WHERE ID = ? ";
		Connection conn = DBConnection.getConnection();
		
		PreparedStatement psmt = null;
		// Statement보다 처리가 가볍다
		ResultSet rs = null;		
		UserDto dto = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			// query를 생성 실행하면 반환된 결과를 가져오게 할 작업영역을
			psmt.setString(1, id); // 인덱스, 매개변수
			// id값이 첫번째 물음표에 대입된다
			
			rs = psmt.executeQuery();
			// query 실행을 받아들인다
			// 위에서 들어가니까 sql 지우자
			
			if(rs.next()) {
				// query문에 상응하는 값이 참이 나왔을 때
				// String, String, int, String
				String _id = rs.getString("id");
				String _name = rs.getString("name");
				int _age = rs.getInt("age");
				String _joindate = rs.getString("joindate");
				// joindate는 회원가입
				// sql문과 순서가 맞아야한다
				
				dto = new UserDto(_id, _name, _age, _joindate);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
		// 못 찾았으면 null값이 간다
	} // search2 함수
	

	///////////////////// 다수의 데이터 -> List<dto>
	public List<UserDto> getUserList(){
		
		String sql =  " SELECT ID, NAME, AGE, JOINDATE "
					+ " FROM USERDTO ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// 디비하고 연결, 커리문 실행, 그 커리문이 실행 되었을 때 데이터를 받는다
		
		List<UserDto> list = new ArrayList<UserDto>();
		// 리턴하기위한 List
		
		System.out.println("sql : " + sql);
		
		try {
			conn = DBConnection.getConnection();
			// 컨넥션 완성
			psmt = conn.prepareStatement(sql);
			// 컨넥션으로 프리페얼스테이트먼트 실행
			rs = psmt.executeQuery();
			//프리페얼스테이트먼트로 결과 값 받는다
			
			while(rs.next()) {
				// 생성, 넣기, add
				UserDto dto = new UserDto();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setJoindate(rs.getString("joindate"));
				// date형이지만 자바로 넘어올 땐 문자열로 온다
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
}
