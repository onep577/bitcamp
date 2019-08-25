package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.PersonQnADto;

public class PersonQnADao implements iPersonQnADao{
	
	private static PersonQnADao dao = new PersonQnADao();
	
	private PersonQnADao() {
		DBConnection.initConnect();
	}
	
	public static PersonQnADao getInstance() {
		return dao;
	}
	
	// 총 글의 갯수 구하기
	@Override
	public int getCount(String choiceStr, String str) {
		String sql = " SELECT COUNT(*) "
				   + " FROM PERSONQNA "
				   + " WHERE ID IS NOT NULL ";
		
		if(choiceStr.equals("ID")) {
			sql = sql + " AND ID=? ";
		}
		else if(choiceStr.equals("문의 유형")) {
			sql = sql + " AND QUESTION_TYPE=? ";
		}
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = -1;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getCount suc");
			
			psmt = conn.prepareStatement(sql);
			
			if(choiceStr.equals("ID") || choiceStr.equals("문의 유형")) {
				psmt.setString(1, str.trim());
			}
			System.out.println("2/6 getCount suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getCount suc");
		
			if(rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("4/6 getCount suc");
			
		} catch (SQLException e) {
			System.out.println("getCount fail " + e.getMessage());
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return count;
	}
	
	// List 받아오기
	@Override
	public List<PersonQnADto> getPersonQnAList(String choiceStr, String str, int pageNum) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, ANSWER_CHECK, QUESTION_TYPE, COMMENTS "
				   + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
				   		 + " SEQ, ID, TITLE, CONTENT, WDATE, ANSWER_CHECK, QUESTION_TYPE, COMMENTS "
				   		 + " FROM PERSONQNA "
				   		 + " WHERE ID IS NOT NULL ";
		
		if(choiceStr.equals("ID")) {
			sql = sql + " AND ID=? ";
		}
		else if(choiceStr.equals("문의 유형")) {
			sql = sql + " AND QUESTION_TYPE=? ";
		}
		
		sql = sql + " ORDER BY SEQ DESC) "
				  + " WHERE RNUM>=? AND RNUM<=? ";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PersonQnADto> list = new ArrayList<PersonQnADto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getPersonQnAList suc");
			
			psmt = conn.prepareStatement(sql);
			
			if(choiceStr.equals("ID") || choiceStr.equals("문의 유형")) {
				psmt.setString(1, str.trim());
				psmt.setInt(2, pageNum * 10 - 9);
				psmt.setInt(3, pageNum * 10);
			}
			else {	// 검색하지 않는 경우
				psmt.setInt(1, pageNum * 10 - 9);		
				psmt.setInt(2, pageNum * 10);			
			}
			System.out.println("2/6 getPersonQnAList suc");
			System.out.println("getPersonQnAList sql : " + sql);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getPersonQnAList suc");
			
			while(rs.next()) {
				PersonQnADto dto = new PersonQnADto(rs.getInt(1),
													rs.getString(2),
													rs.getString(3),
													rs.getString(4),
													rs.getString(5),
													rs.getInt(6),
													rs.getString(7),
													rs.getString(8));
				list.add(dto);
			}
			System.out.println("4/6 getPersonQnAList suc");
			
		} catch (SQLException e) {
			System.out.println("getPersonQnAList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	// QnA 등록
	@Override
	public boolean addQnA(PersonQnADto dto) {
		String sql = " INSERT INTO PERSONQNA(SEQ, ID, TITLE, CONTENT, WDATE, ANSWER_CHECK, QUESTION_TYPE, COMMENTS) "
				   + " VALUES(SEQ_PERSONQNA.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?, NULL) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("insert sql : " + sql);
		
		int count=0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getQuestion_type());
	
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return count>0?true:false;
	}
	
	// 고객이 QnA 수정
	@Override
	public boolean changeQnA(PersonQnADto dto) {
		String sql = " UPDATE PERSONQNA "
				   + " SET TITLE=?, CONTENT=?, QUESTION_TYPE=?, WDATE=SYSDATE "
				   + " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("changeQnA sql : " + sql);
		
		int count=0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getQuestion_type());
			psmt.setInt(4, dto.getSeq());
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return count>0?true:false;
	}

	// 관리자가 QnA 답변 등록
	@Override
	public boolean updateQnA(String comments, int seq) {
		String sql = " UPDATE PERSONQNA "
				   + " SET COMMENTS=?, ANSWER_CHECK=1 "
				   + " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println("update sql : " + sql);
		
		int count=0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, comments);
			psmt.setInt(2, seq);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return count>0?true:false;
	}

	// 마이페이지 내가 쓴 QnA List
	@Override
	public List<PersonQnADto> getMyList(String id) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, ANSWER_CHECK, QUESTION_TYPE, COMMENTS "
				   + " FROM PERSONQNA "
				   + " WHERE ID=? "
				   + " ORDER BY SEQ DESC ";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PersonQnADto> list = new ArrayList<PersonQnADto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMyList suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			
			System.out.println("2/6 getMyList suc");
			System.out.println("getMyList sql : " + sql);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getMyList suc");
			
			while(rs.next()) {
				PersonQnADto dto = new PersonQnADto(rs.getInt(1),
													rs.getString(2),
													rs.getString(3),
													rs.getString(4),
													rs.getString(5),
													rs.getInt(6),
													rs.getString(7),
													rs.getString(8));
				list.add(dto);
			}
			System.out.println("4/6 getMyList suc");
			
		} catch (SQLException e) {
			System.out.println("getMyList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}

	@Override
	public PersonQnADto getMyQnA(String seq) {
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, ANSWER_CHECK, QUESTION_TYPE, COMMENTS "
				   + " FROM PERSONQNA "
				   + " WHERE SEQ= " + seq.trim();
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PersonQnADto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getMyQnA suc");
			
			psmt = conn.prepareStatement(sql);
			
			System.out.println("2/6 getMyQnA suc");
			System.out.println("getMyList sql : " + sql);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getMyQnA suc");
			
			if(rs.next()) {
				dto = new PersonQnADto(rs.getInt(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5),
										rs.getInt(6),
										rs.getString(7),
										rs.getString(8));
			}
			System.out.println("4/6 getMyQnA suc");
			
		} catch (SQLException e) {
			System.out.println("getMyQnA fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return dto;
		
	}


	@Override
	public boolean outCustomer(String id) {
		String sql =  " UPDATE PERSONQNA SET ID = NULL "
					+ " WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("outCustomer 1/6 success !!");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("outCustomer 2/6 success !!");
			
			psmt.setString(1, id);
			count = psmt.executeUpdate();
			System.out.println("outCustomer 3/6 success !!");
			
		} catch (SQLException e) {
			System.out.println("outCustomer fail !!");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
		
		return count>0?true:false;
	}

	
}
