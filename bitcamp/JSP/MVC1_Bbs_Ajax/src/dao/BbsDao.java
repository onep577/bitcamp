package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BbsDao implements iBbsDao {
	
	private static BbsDao bbsdao = new BbsDao();
	
	private BbsDao() {
	}
	
	public static BbsDao getInstance() {
		return bbsdao;
		// 멤버변수 영역에 한 번 생성하고 getInstance()에서 리턴한다
	}
	
	
	
	// 전체 데이터 가져와서 리스트에서 뿌려주기
	@Override
	public List<BbsDto> getBbsList() {
		String sql =  " SELECT SEQ, ID, REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE, PARENT, "
					+ " DEL, READCOUNT "
					+ " FROM BBS "
					+ " ORDER BY REF DESC, STEP ASC ";
					// REF가 역순으로 나온다 STEP이 정순으로 나온다
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
		
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList suc");
			
			while(rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1),
										rs.getString(2),
										rs.getInt(3),
										rs.getInt(4),
										rs.getInt(5),
										rs.getString(6),
										rs.getString(7),
										rs.getString(8),
										rs.getInt(9),
										rs.getInt(10),
										rs.getInt(11));
				list.add(dto);
			}
			System.out.println("4/6 getBbsList suc");
		
		} catch(Exception e) {
			System.out.println("getBbsList fail" + e.getMessage());
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	} // getBbsList 함수
	
	
	
	// 데이터 삽입
	@Override
	public boolean bbsWrite(String id, String title, String content) {
		String sql =  " INSERT INTO BBS(SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, "
					+ " WDATE, PARENT, DEL, READCOUNT) "
					+ " VALUES(SEQ_BBS.NEXTVAL,?,(SELECT NVL(MAX(REF), 0)+1 FROM BBS), "
					+ " (SELECT NVL(MAX(STEP), 0)+1 FROM BBS),0,?,?,SYSDATE,0,1,0) ";
		
		//System.out.println("sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			psmt.setString(2, title.trim());
			psmt.setString(3, content.trim());
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	} // bbsWrite 함수
	
	
	
	// 글쓰기 창에서 내용을 뿌려준다
	@Override
	public BbsDto getWrite(int seq) {
		String sql =  " SELECT ID, TITLE, CONTENT, WDATE, READCOUNT "
					+ " FROM BBS "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BbsDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new BbsDto(rs.getString(1), rs.getString(2), rs.getString(3), 
								rs.getString(4), rs.getInt(5) );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
				
		return dto;
	} // getWrite 함수
	
	
	
	// 데이터 갱신
	@Override
	public boolean update(int seq, String title, String content) {
		String sql =  " UPDATE BBS "
					+ " SET TITLE=?, CONTENT=? "
					+ " WHERE SEQ=" + seq + " " ;
		
		System.out.println("sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title.trim());
			psmt.setString(2, content.trim());
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
				
		return count>0?true:false;
	} // update 함수
	
	
	
	// 조회수 증가
	@Override
	public boolean readcount(int seq) {
		String sql =  " UPDATE BBS "
					+ " SET READCOUNT = READCOUNT + 1 "
					+ " WHERE SEQ=" + seq + " ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	} // readcount 함수
	
	
	
	// db에서 지우는 게 아니가 del=0으로 바꿔준다
	@Override
	public boolean delete(int seq) {
		String sql =  " UPDATE BBS "
					+ " SET DEL=0 "
					+ " WHERE SEQ=" + seq + " ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
		
		return count>0?true:false;
	} // delete 함수
	
	
	
	// 작성자나 제목으로 검색
	@Override
	public List<BbsDto> search(String search, String searchText) {
		String sql =  " SELECT SEQ, ID, REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE, PARENT, "
					+ " DEL, READCOUNT "
					+ " FROM BBS "
					+ " WHERE DEL=1 ";
					
		if(search.equals("제목")) {
				sql = sql + " AND TITLE LIKE '%" + searchText + "%' ";
		}else if(search.equals("작성자")){
			sql = sql + " AND ID LIKE '%" + searchText + "%' ";
		}
		
		sql = sql + " ORDER BY REF DESC, STEP ASC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BbsDto dto = null;
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto = new BbsDto(rs.getInt(1),
								rs.getString(2),
								rs.getInt(3),
								rs.getInt(4),
								rs.getInt(5),
								rs.getString(6),
								rs.getString(7),
								rs.getString(8),
								rs.getInt(9),
								rs.getInt(10),
								rs.getInt(11));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}	
		
		return list;
	} // search 함수
	
	
	
	// 답글 달기
	@Override
	public boolean answer(int seq, BbsDto bbs) {
		// update
		String sql1 = " UPDATE BBS "
					+ " SET STEP=STEP+1 "
					+ " WHERE REF=(SELECT REF FROM BBS WHERE SEQ=?) "
					+ " 	AND STEP>(SELECT STEP FROM BBS WHERE SEQ=?) ";
		/*
			3-0-0
				3-1-1
					3-2-2
				3-3-1
					3-4-2
					3-5-2
		*/
		
		
		
		// insert
		String sql2 = " INSERT INTO BBS "
				+ " (SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, PARENT, DEL, READCOUNT) "
				+ " VALUES(SEQ_BBS.NEXTVAL, ?, "
				+ " 	(SELECT REF FROM BBS WHERE SEQ=?), "		// REF
				+ " 	(SELECT STEP FROM BBS WHERE SEQ=?) + 1, "	// STEP
				+ " 	(SELECT DEPTH FROM BBS WHERE SEQ=?) + 1, "	// DEPTH
				+ " ?, ?, SYSDATE, ?, 1, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			// auto commit을 꺼준다
			System.out.println("1/6 answer success");
			
			// update
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("2/6 answer success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 answer success");
			
			// psmt 초기화
			psmt.clearParameters();
			
			// insert
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, bbs.getId());
			psmt.setInt(2, seq);			// ref
			psmt.setInt(3, seq);			// step
			psmt.setInt(4, seq);			// depth
			psmt.setString(5, bbs.getTitle());
			psmt.setString(6, bbs.getContent());
			psmt.setInt(7, seq);			// parent
			System.out.println("4/6 answer success");
			
			count = psmt.executeUpdate();
			conn.commit();
			System.out.println("5/6 answer success");
			
			
		} catch (Exception e) {
			System.out.println("5/6 answer fail");
			try {
				conn.rollback();
			} catch (SQLException e1) {}
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBClose.close(conn, psmt, null);
			System.out.println("6/6 answer success");
		}		
		
		return count>0?true:false;
	} // answer 함수
	

	
	/*
		총 글의 갯수 : 13 -> 2 page		1 ~ 10, 11 ~ 13
	*/
	// paging
	
	
	
	
	
	
	
	
	

}
