package pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class PdsDao implements iPdsDao {
	
	private static PdsDao dao = new PdsDao();
	
	private PdsDao() {
	}
	
	public static PdsDao getInstance() {
		return dao;
	}
	

	// 파일 전체 가져오기
	@Override
	public List<PdsDto> getPdsList() {
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, FILENAME, READCOUNT, "
					+ " DOWNCOUNT, REGDATE "
					+ " FROM PDS "
					+ " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PdsDto> list = new ArrayList<PdsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getPdsList success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getPdsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getPdsList success");
			
			while(rs.next()) {
				int i = 1;
				PdsDto dto = new PdsDto(rs.getInt(i++),
										rs.getString(i++), 
										rs.getString(i++),
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getInt(i++), 
										rs.getInt(i++), 
										rs.getString(i++));
				list.add(dto);
			}
			System.out.println("4/6 getPdsList success");
			
		} catch (Exception e) {
			System.out.println("getPdsList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	} // getPdsList 함수
	

	
	@Override
	public boolean addPds(String id, String title, String content, String filename) {
		String sql =  " INSERT INTO PDS(SEQ, ID, TITLE, CONTENT, FILENAME, "
					+ " READCOUNT, DOWNCOUNT, REGDATE) "
					+ " VALUES(SEQ_PDS.NEXTVAL,?,?,?,?,0,0,SYSDATE) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addPds success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addPds success");
			
			psmt.setString(1, id.trim());
			psmt.setString(2, title.trim());
			psmt.setString(3, content.trim());
			psmt.setString(4, filename.trim());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addPds success");
			
		} catch (SQLException e) {
			System.out.println("addPds fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}		
		
		return count>0?true:false;
	}
	


	// datail에서 하나의 dto를 다 가져온다
	@Override
	public PdsDto getOnePds(int seq) {
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, FILENAME, READCOUNT, DOWNCOUNT, REGDATE "
					+ " FROM PDS "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PdsDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getOnePds success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getOnePds success");
			
			psmt.setInt(1, seq);
			rs = psmt.executeQuery();
			System.out.println("3/6 getOnePds success");
			
			while(rs.next()) {
				int i = 1;
				dto = new PdsDto(rs.getInt(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getInt(i++),
								rs.getInt(i++),
								rs.getString(i++));
			}
			System.out.println("4/6 getOnePds success");
			
		} catch (SQLException e) {
			System.out.println("getOnePds fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}		
				
		return dto;
	} // getOnePds 함수
	
	
	
	@Override
	public boolean readcount(int seq) {
		String sql =  " UPDATE PDS "
					+ " SET READCOUNT = READCOUNT+1 "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 readcount success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 readcount success");
			
			psmt.setInt(1, seq);
			count = psmt.executeUpdate();
			System.out.println("3/6 readcount success");
			
		} catch (SQLException e) {
			System.out.println("readcount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}				
				
		return count>0?true:false;
	} 
	
	
	
	@Override
	public boolean deletePds(int seq) {
		String sql =  " DELETE PDS "
					+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 deletePds success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 deletePds success");
			
			psmt.setInt(1, seq);
			count = psmt.executeUpdate();
			System.out.println("3/6 deletePds success");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}				
				
		return count>0?true:false;
	}
	
	
	
	
	

}
