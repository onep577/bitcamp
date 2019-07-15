package dao;

import java.util.List;

import model.OrderDto;

public interface OrderDao {

	public List<OrderDto> getTotal();
	
	public boolean setOrder(String id, String coffName, String coffSize,
			String coffSyrup, String isShot, String isWhip,
			int coffNum, int totalPrice);
}
