package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.PriceDao;
import db.DBClose;
import db.DBConnection;
import model.PriceDto;

public class PriceDaoImpl implements PriceDao {

	@Override
	public List<PriceDto> getCoffType() {
		// MENUVIEW 테이블에 뿌리기
		String sql =  " SELECT TYPENAME "
					+ " FROM COFFEEPRICE ";

		System.out.println("menuView 뿌리기 sql : " + sql);

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<PriceDto> list = new ArrayList<PriceDto>();
		PriceDto dto;		
				
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {		
				dto = new PriceDto(0,rs.getString(1),0,0,0);
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}		

		return list;
	}  // getCoffType 함수
	
	
	@Override
	public List<PriceDto> getCoffeePriceList() {
		// 커피 주문 가격표 전체
		String sql =  " SELECT NUM, TYPENAME, SHORT,"
					+ " TALL, GRANDE "
					+ " FROM COFFEEPRICE "
					+ " ORDER BY NUM ASC ";
		
		System.out.println("allcoffee 뿌리기 sql : " + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<PriceDto> list = new ArrayList<PriceDto>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			// 물음표가 없어서 넣어줄게 없다
			while(rs.next()) {
				// 모든 데이터를 다 가져왔을 때 while을 쓴다
				int i = 1;
				// + 가 뒤에 있으니까 값을 넣고 증가된다
				PriceDto dto = new PriceDto
										(rs.getInt(i++),
										rs.getString(i++),
										rs.getInt(i++),
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
	}
	
	// 커피 사이즈별 가격 가져와서 총금액에 넣기
	public int getTypeOnePrice(String size, String typeName) {
		String sql =  " SELECT " + size + " "
					+ " FROM COFFEEPRICE "
					+ " WHERE TYPENAME = '" + typeName + "' ";
		
		System.out.println("coffetype price sql : " + sql);

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int price = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				price = rs.getInt(1);
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return price;
	}
	

}
