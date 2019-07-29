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
	
	@Override
	public List<BbsDto> getBbsList() {
		String sql =  " SELECT SEQ, ID, REF, STEP, DEPTH, "
					+ " TITLE, CONTENT, WDATE, PARENT, "
					+ " DEL, READCOUNT "
					+ " FROM BBS "
					+ " ORDER BY REF DESC, STEP ASC ";
					// REF가 순번대로 들어간다 번호가 클 수록 앞에 와라
		
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
	}
	
	@Override
	public boolean bbsWrite(String id, String title, String content) {
		String sql =  " INSERT INTO BBS(SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, "
					+ " WDATE, PARENT, DEL, READCOUNT) "
					+ " VALUES(SEQ_BBS.NEXTVAL,?,0,0,0,?,?,SYSDATE,0,1,0) ";
		
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
	}
	
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
	}
	
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
	}
	
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
	}
	
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
	}
	
	@Override
	public List<BbsDto> search(String search, String searchText) {
		String sql =  " SELECT TITLE, ID "
					+ " FROM BBS "
					+ " WHERE 1=1 ";
					
		if(search.equals("제목")) {
				sql = sql + " AND TITLE LIKE '%" + searchText + "%' ";
		}else if(search.equals("작성자")){
			sql = sql + " AND ID LIKE '%" + searchText + "%' ";
		}
		
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
				dto = new BbsDto(rs.getString(1), rs.getString(2), null) ;
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}	
		
		return list;
	}
	

}
