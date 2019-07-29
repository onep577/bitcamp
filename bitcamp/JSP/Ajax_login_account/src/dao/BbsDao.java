package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;
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

}
