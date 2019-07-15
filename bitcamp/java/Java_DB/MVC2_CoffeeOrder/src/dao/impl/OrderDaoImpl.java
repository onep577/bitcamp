package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.OrderDao;
import db.DBClose;
import db.DBConnection;
import model.OrderDto;

public class OrderDaoImpl implements OrderDao {

	@Override
	public List<OrderDto> getTotal() {
		// 커피 주문내역 전체
		String sql =  " SELECT SEQ, CUS, COFFEE_TYPE, COFFEE_SIZE, "
					+ " COFFEE_SYRUP, COFFEE_SHOT, COFFEE_WHIP, "
					+ " COFFEE_NUMBER, COFFEE_TOTALPRICE, WDATE "
					+ " FROM COFFEEORDER "
					+ " ORDER BY WDATE DESC ";
		
		System.out.println("allcoffee 뿌리기 sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<OrderDto> list = new ArrayList<OrderDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			// 물음표가 없어서 넣어줄게 없다
			while(rs.next()) {
				// 모든 데이터를 다 가져왔을 때 while을 쓴다
				int i = 1;
				// + 가 뒤에 있으니까 값을 넣고 증가된다
				OrderDto dto = new OrderDto
										(rs.getInt(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getString(i++),
										rs.getInt(i++),
										rs.getInt(i++),
										rs.getString(i++));
				list.add(dto);
			} // while문
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return list;
	}
	
	@Override
	public boolean setOrder(String id, String coffName, String coffSize,
			String coffSyrup, String isShot, String isWhip,
			int totalPrice, int coffNum) {
		String sql =  " INSERT INTO COFFEEORDER(SEQ, CUS, COFFEE_TYPE,"
				+ " COFFEE_SIZE, COFFEE_SYRUP, COFFEE_SHOT, COFFEE_WHIP,"
				+ " COFFEE_NUMBER, COFFEE_TOTALPRICE, WDATE) "
				+ " VALUES(SEQ_COFFEEORDER.NEXTVAL, "
				+ " ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE) ";
		
		System.out.println("order sql insert : " + sql);
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, coffName);
			psmt.setString(3,  coffSize);
			psmt.setString(4, coffSyrup);
			psmt.setString(5, isShot);
			psmt.setString(6, isWhip);
			psmt.setInt(7, totalPrice);
			psmt.setInt(8, coffNum);
			
			count = psmt.executeUpdate();
			System.out.println("count : " + count);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
		
	} // setOrder 함수

	
}










