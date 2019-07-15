package service.impl;

import java.util.List;

import dao.OrderDao;
import dao.impl.OrderDaoImpl;
import model.OrderDto;
import service.OrderService;

public class OrderServiceImpl implements OrderService {
	OrderDao dao = new OrderDaoImpl();

	@Override
	public List<OrderDto> getTotal() {
		return dao.getTotal();
	}
	
	@Override
	public boolean setOrder(String id, String coffName, String coffSize,
			String coffSyrup, String isShot, String isWhip,
			int coffNum, int totalPrice) {
		return dao.setOrder(id, coffName, coffSize,
				 coffSyrup, isShot, isWhip, coffNum, totalPrice);
	}


}
