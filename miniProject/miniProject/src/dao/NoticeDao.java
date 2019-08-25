package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.NoticeDto;

public class NoticeDao implements iNoticeDao{
	
	private static NoticeDao dao = null;
	
	private NoticeDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static NoticeDao getInstance() {
		if(dao == null) {
			dao = new NoticeDao();
		}
		return dao;
	}
	
	// 공지수정
	@Override
	public boolean updateNotice(NoticeDto dto, int seq) {
		System.out.println(dto.toString());
		String sql = " UPDATE NOTICE "
				+ " SET TITLE=?, CONTENT=?, FILENAME=? "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 updateNotice suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 updateNotice suc");
			
			psmt.setString(1, dto.getTitle());	
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getFilename());
			psmt.setInt(4, seq);
			System.out.println("3/6 updateNotice suc");
			
			count = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("updateNotice fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}

		return count>0? true : false;
	}

	// 공지글 삭제
	@Override
	public boolean delNotice(int seq) {
		String sql = " UPDATE NOTICE "
				+ " SET DEL=1 "
				+ " WHERE SEQ=? ";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int delcount = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 delNotice suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 delNotice suc");
			
			delcount = psmt.executeUpdate();
			System.out.println("3/6 delNotice suc");
			
		} catch (Exception e) {
			System.out.println("delNotice fail");
			e.printStackTrace();
		} finally { 
			DBClose.close(conn, psmt, null);
		}
		
		return delcount>0? true : false;
	}

	// 공지글 추가
	@Override
	public boolean addNotice(NoticeDto dto) {
		System.out.println("(PdsDao)dto= " + dto.toString());
		String sql = " INSERT INTO NOTICE(SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, FILENAME, DOWNCOUNT) "
				+ " VALUES(SEQ_NOTICE.NEXTVAL,?,?,?,SYSDATE,0,0,?,0) ";
		
		Connection conn = null;	
		PreparedStatement psmt = null;
		
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addNotice suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addNotice suc");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getFilename());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addNotice suc");
			
		} catch (Exception e) {
			System.out.println("addNotice fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}
	


	// 공지글 가져오기
	@Override
	public NoticeDto getContent(int seq) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, FILENAME, DOWNCOUNT "
				+ " FROM NOTICE "
				+ " WHERE SEQ=? ";
		
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		NoticeDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getContent suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getContent suc");
			
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getContent suc");
			
			if(rs.next()) {		
				int i = 1;
				dto = new NoticeDto(  rs.getInt(i++),
									  rs.getString(i++), 
									  rs.getString(i++), 
									  rs.getString(i++),
									  rs.getString(i++),
									  rs.getInt(i++),
									  rs.getInt(i++),
									  rs.getString(i++),
									  rs.getInt(i++));
			}
			
		} catch (Exception e) {
			System.out.println("getContent fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
		return dto;
	}

	
	@Override
	public int getAllnotice(String choice,String searchWord) {
		System.out.println("searchWord  " + searchWord);
		System.out.println("choice  " + choice);
		String sql = " SELECT COUNT(*) " + 
				" FROM NOTICE "
				+ " WHERE DEL = 0 ";
		
		//priority
		// 검색항목과 검색어
		String sqlWord = "";
		
		if(choice.equals("title")) {
			sqlWord = " AND TITLE LIKE '%" + searchWord.trim() + "%' ";
		}	
		else if(choice.equals("content")) {
			sqlWord = " AND CONTENT LIKE '%" + searchWord.trim() + "%' ";
		}
		sql += sqlWord;	
				
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int notice_len = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllnotice suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllnotice suc");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				notice_len = rs.getInt(1);
			}
			System.out.println("3/6 getAllnotice suc");
		} catch (Exception e) {
			System.out.println("getAllnotice fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}		
		return notice_len;
	}

	// 페이징
	@Override
	public List<NoticeDto> getPagingList(String choice, String searchWord, int page) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, FILENAME, DOWNCOUNT "
				+ " FROM ";
		
		sql += " (SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
				+ " SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, FILENAME, DOWNCOUNT "
				+ " FROM NOTICE "
				+ " WHERE DEL = 0 ";
		
		// 검색항목과 검색어
		String sqlWord = "";
		System.out.println("choice = " + choice);
		if(choice.equals("title")) {
			sqlWord = " AND TITLE LIKE '%" + searchWord.trim() + "%' ";
		}	
		else if(choice.equals("content")) {
			sqlWord = " AND CONTENT LIKE '%" + searchWord.trim() + "%' ";
		}
		
		sql += sqlWord;		
				
		sql += " ORDER BY SEQ DESC)";
		sql += " WHERE RNUM >= ? AND RNUM <= ? ";	//AND DEL = 0  
				
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<NoticeDto> list = new ArrayList<>();
		
		int start, end;
		start = 1 + (10 * page);
		end = 10 + (10 * page);
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getPagingList suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);			
			System.out.println("2/6 getPagingList suc");
						
			rs = psmt.executeQuery();
			
			System.out.println("3/6 getPagingList suc");
			
			while(rs.next()) {
				int i=1;
				
				NoticeDto dto = new NoticeDto(rs.getInt(i++),
											  rs.getString(i++), 
											  rs.getString(i++), 
											  rs.getString(i++),
											  rs.getString(i++),
											  rs.getInt(i++),
											  rs.getInt(i++),
											  rs.getString(i++),
											  rs.getInt(i++));
				
				list.add(dto);
			}
			System.out.println("4/6 getPagingList suc");
			
		} catch (Exception e) {
			System.out.println("getPagingList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
		
		return list;
	}
	
	
	
	// 다운로드 횟수
	@Override
	public void downcount(int seq) {
		System.out.println(seq);
		String sql = " UPDATE NOTICE SET "
				+ " DOWNCOUNT=DOWNCOUNT+1 "
				+ " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 downcount Success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 downcount Success");
			
			psmt.executeUpdate();
			System.out.println("3/6 downcount Success");			
			
		} catch (Exception e) {
			System.out.println("downcount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
	}

	//조회수
	@Override
	public void readcount(int seq) {
		String sql = " UPDATE NOTICE SET "
				+ " READCOUNT=READCOUNT+1 "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 readcount Success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 readcount Success");
			
			psmt.executeUpdate();
			System.out.println("3/6 readcount Success");			
			
		} catch (Exception e) {
			System.out.println("readcount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
	}
	
	
	// 공지글 리스트 (사용X)
	@Override
	public List<NoticeDto> getNoticeList() {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT, FILENAME, DOWNCOUNT "
				+ " FROM NOTICE "
				+ " ORDER BY WDATE DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getNoticeList suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getNoticeList suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getNoticeList suc");
			
			
			while(rs.next()) {
				NoticeDto dto = new NoticeDto(rs.getInt(1), 
										rs.getString(2), 
										rs.getString(3), 
										rs.getString(4), 
										rs.getString(5), 
										rs.getInt(6), 
										rs.getInt(7), 
										rs.getString(8), 
										rs.getInt(9));
				list.add(dto);				
			}
			System.out.println("4/6 getNoticeList suc");
		} catch (Exception e) {
			System.out.println("getNoticeList fail" + e.getMessage());
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}

}
