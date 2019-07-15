package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BbsDao {
	
	private static BbsDao dao = new BbsDao();
	private List<BbsDto> bdto_list;
	public static boolean searchClick = false;
	
	private BbsDao() {
	}
	
	public static BbsDao getInstance() {
		// 싱글톤을 더 간략히 한다
		return dao;
	}
	
	public List<BbsDto> getBbsList(){
		// 로그인하고 게시판에 보여주기
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, "
					+ " WDATE, DEL, READCOUNT "
					+ " FROM BBS "
					+ " ORDER BY WDATE DESC ";

		// 최신글이 가장 위에 올라오게 내림차순 정렬한다		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			// 물음표가 없어서 넣어줄게 없다
			while(rs.next()) {
				// 모든 데이터를 다 가져왔을 때 while을 쓴다
				int i = 1;
				// + 가 뒤에 있으니까 값을 넣고 증가된다
				BbsDto dto = new BbsDto(rs.getInt(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++));
				list.add(dto);
			} // while문
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	} // getBbsList 함수
	
	public boolean writeBbs(String id, String title, String content){
		// 게시판 글을 추가할 때
		String sql =  " INSERT INTO BBS(SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT) "
					+ " VALUES(SEQ_BBS.NEXTVAL, ?, ?, ?, SYSDATE, 1, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		System.out.println("sql:" + sql);
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, title);
			psmt.setString(3, content);
			
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count>0?true:false;
		// count가 0보다 크면 true 작으면 false를 리턴
	} // setWriteList 함수
	
	public void readCount(int seq){
		// 조회수 증가할 때
		System.out.println("조회수 증가 seq : " + seq);
		String sql = "  UPDATE BBS "
					+ " SET READCOUNT = READCOUNT + 1 "
					+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		System.out.println("setCountList sql:" + sql);
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

	} // setCountList 함수
	
	public boolean updateBbs(String title, String content, int seq) {
		String sql =  " UPDATE BBS "
					+ " SET TITLE = ?, CONTENT = ? "
					+ " WHERE SEQ = " + seq + " ";
		
		System.out.println("게시판 수정 sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {			
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;

	} // update 함수
	
	public boolean deleteBbs(int seq) {
		String sql =  " UPDATE BBS "
					+ " SET DEL = 0 "
					+ " WHERE SEQ = " + seq + " ";
		System.out.println("게시판 글 삭제 sql : " + sql);
		
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
			DBClose.close(psmt, conn, null);
		}
		System.out.println("삭제 count : " + count);
		return count>0?true:false;
		
	} // delete 함수
	
	
	public List<BbsDto> searchBbs2(String selectItem, String selectField) {		
		String sql =  " SELECT SEQ, ID, TITLE "
					+ " FROM BBS "
					+ " WHERE 1=1 ";
		// + " WHERE 1=1 "; DEL = 1이 없이 WHERE만 있다면 찾을 데이터가 없을 때 에러난다
		// 왜? WHERE ORDER BY WDATE DESC 이기 때문이다 그럴땐 WHERE 1=1이라고 실무에서 쓴
		
		if(selectItem.equals("제목")) {
			sql = sql + " AND TITLE LIKE ? ";  
		}else if(selectItem.equals("내용")){
			sql = sql + " AND CONTENT LIKE ? ";
		}else if(selectItem.equals("작성자")){
			sql = sql + " AND ID = ? ";
		}
		
		sql = sql + " ORDER BY WDATE DESC ";
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		Connection conn=null;
		PreparedStatement psmt=null;
		ResultSet rs=null;
		
		try {
			conn = DBConnection.getConnection();		
			psmt = conn.prepareStatement(sql);
			
			if(selectItem.equals("작성자")) {
				psmt.setString(1, selectField);				
			}else if(selectItem.equals("제목") || selectItem.equals("내용")){
				psmt.setString(1, "%" + selectField + "%");
			}
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int i = 1;
				
				BbsDto dto = new BbsDto(rs.getInt(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										null, 
										null, 
										0, 
										0);
				list.add(dto);				
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);			
		}
		return list;
	} // searchBbs2 함수
	
	

}










