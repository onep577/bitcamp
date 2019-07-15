package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.CustomerDao;
import db.DBClose;
import db.DBConnection;
import model.CustomerDto;;

public class CustomerDaoImpl implements CustomerDao {
		
	private String loginId;
	
	@Override
	public String loginId() {
		return loginId;
	}

	@Override
	public boolean addMember(CustomerDto dto) {
		// 회원가입 할 때 회원정보 입력
		String sql =  " INSERT INTO CUSTOMER(ID, PWD, NAME, AGE, AUTH) "
					+ " VALUES(?, ?, ?, ?, 3) ";
		
		System.out.println("회원가입 sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setInt(4, dto.getAge());
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
		
	} // addMember 회원가입 할 때 회원정보 입력

	@Override
	public boolean getId(String id) {
		// 회원가입 할 때 아이디 중복확인
		String sql =  " SELECT ID "
					+ " FROM CUSTOMER "
					+ " WHERE ID = ? ";

		System.out.println("아이디 중복확인 sql : " + sql);

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean findId = false;
		// 같은 아이디 찾았을 때 true, 같은 아이디 못 찾았을 때 false
				
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
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
		}		
		return findId;
				
	} // 회원가입 할 때 아이디 중복확인
	
	@Override
	public boolean login(String id, String pwd) {
		// 로그인 할 때 아이디와 비밀번호 맞는지 확인하는 함수
		String sql =  " SELECT ID "
					+ " FROM CUSTOMER "
					+ " WHERE ID = ? AND PWD = ? ";
		
		System.out.println("로그인 sql문 : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// select일 때 즉, 받아오는 데이터가 있을 때 사용한다
		String _id = null;
		boolean b = false;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id.trim());
			psmt.setString(2, pwd.trim());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				// 직접 입력한 sql문의 컬럼 순서대로 써야한다
				_id = rs.getString(1); // id
				loginId = _id;
				b = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return b;
		
	} // 로그인 할 때 아이디와 비밀번호 맞는지 확인하는 함수
		
}
