package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;

public class MemberDao {
	
	private static MemberDao mem;
	private String loginId;
	// 로그인된 아이디. getter setter를 만든 후 mem을 이용해서 꺼낼 수 있다
	
	public MemberDao() {
	}
	
	public static MemberDao getInstance() { // 싱글톤 생성
		if(mem == null) {
			mem = new MemberDao();
		}
		return mem;		
	} // getInstance 함수
	
	public String getLoginId() {
		return loginId;
	}
	
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	
	// 왜? 아이디와 비밀번호를 대조하는 로그임 함수인데 강사님 코드에서는 비밀번호만 빼고
	// id, name, email, auth를 가져왔다. 비밀번호는 외부르 노출시키지 않는다는 이유인데
	// 사용자가 입력한 아이디만 맞으면 로그인 되는건가? 그럼 아이디만 확인하는 거랑 무엇이 다른가?
	// boolean으로 가져와도 될 듯하다 안돼? loginView에서 getId를 못한다
	public String login(String id, String pwd) {
		// 로그인 할 때 아이디와 비밀번호 맞는지 확인하는 함수
		// 강사님 코드는 비밀번호 빼고 다 가져왔다
		String sql =  " SELECT ID "
					+ " FROM MEMBER "
					+ " WHERE ID = ? AND PWD = ? ";
		
		System.out.println("로그인 sql문 : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// select일 때 즉, 받아오는 데이터가 있을 때 사용한다
		String _id = null;		
		
		try {
			conn = DBConnection.getConnection();
			// getConnection 메소드에서 자바와 DB를 연결하고 연결된 DB 정보를 login 함수로 가져온다
			
			psmt = conn.prepareStatement(sql);
				// conn.prepareStatement(sql)의 리턴
				// a new default PreparedStatement object containing the pre-compiled SQL statement
			// 사전 컴파일 된 sql문을 PreparedStatement로 보낸다
			
			// prepareStatement 메소드에서 sql문을 컴파일 할 것으로 추측한다.
			// 개발자가 보기에는 sql문이 정확하게 보이지만 자바 외부로 나가면 데이터베이스가
			// sql문을 인식하지 못 할 것 같다. 그래서 prepareStatement 매개변수로 보내는 게 아닐까 추측한다.
			// 마치 dto를 직렬화 하는 것처럼 자바 외부로 나가면 인식 못하는 건가?
			
			psmt.setString(1, id.trim());
			psmt.setString(2, pwd.trim());
				// Sets the designated parameter to the given Java String value
			// 지정된 parameter에 java string 값을 넣는다
			// 첫번째 ?에 매개변수로 받은 id를 넣는다. 두번째 ?에 매개변수로 받은 pwd를 넣는다
			// index는 int, values는 String이다
			// trim으로 앞 뒤 공백을 없앤다
			
			rs = psmt.executeQuery();
				// psmt.executeQuery()의 리턴
				// a ResultSet object that contains the data produced by the query; never null
			// query에 의해 생성된 데이터를 포함한 ResultSet object를 보낸다
			
			if(rs.next()) {
				// 직접 입력한 sql문의 컬럼 순서대로 써야한다
				
				_id = rs.getString(1); // id
				loginId = _id;
			}
			System.out.println("_id : " + _id);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
			// PrepareStatement, Connection, ResultSet 모두 close 한다
		}
		return _id;
		
	} // login할 때 id, pwd 맞는지 비교하는 함수
	
	public boolean getId(String id) {
		// 회원가입 할 때 아이디 중복확인
		String sql =  " SELECT ID "
					+ " FROM MEMBER "
					+ " WHERE ID = ? ";

		System.out.println("아이디 중복확인 sql : " + sql);

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean findId = false;
		// 같은 아이디 찾았을 때 true, 같은 아이디 못 찾았을 때 false
				
		try {
			conn = DBConnection.getConnection();
			// DB 연결 후 getId 함수에 연결된 DB 정보를 리턴한다
			psmt = conn.prepareStatement(sql);
			// prepareStatement 메소드에서 sql문을 컴파일하고 PreparedStatement 객체 형태로 리턴한다
			// 자바 외부에서 sql문을 잘 인식할 수 있기 위함이다
			psmt.setString(1, id);
			// sql문 첫번째 물음표에 매개변수 id를 대입한다
			rs = psmt.executeQuery();
			// sql문을 실행하고 결과를 ResultSet 객체로 리턴한다
			
			if(rs.next()) {
				// 리턴받은 ResultSet에 데이터가 있으면 들어온다
				findId = true;
				System.out.println("if문 안 rs : " + rs);
				System.out.println("if문 안 rs.next() : " + rs.next());
			}
			System.out.println("if문 밖 rs : " + rs);
			System.out.println("if문 밖 rs.next() : " + rs.next());

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
			// 셋 다 close 한다
		}		
		return findId;
		
	} // getId 회원가입 할 때 아이디 중복확인
		
	public boolean addMember(String id, String pwd, String name, String email) { // 회원가입
		String sql =  " INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH) "
					+ " VALUES(?, ?, ?, ?, 3) ";
		
		System.out.println("회원가입 sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			psmt.setString(3, name);
			psmt.setString(4, email);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
		
	} // addMember 회원가입 할 때 회원정보 입력

}














