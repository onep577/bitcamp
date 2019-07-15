package controller;

import java.util.List;

import javax.swing.JOptionPane;

import model.OrderDto;
import service.OrderService;
import service.impl.OrderServiceImpl;
import view.menuView;
import view.totalView;

public class OrderController {
	OrderService coffService = new OrderServiceImpl();

	public void menu() {
		new menuView();
	}
	
	public void TotalView() {
		new totalView();
	}
	
	public List<OrderDto> getTotal(){
		List<OrderDto> list = coffService.getTotal();
		return list;
	}
	
	public void setOrder(String id, String coffName, String coffSize,
			String coffSyrup, String isShot, String isWhip,
			int coffNum, int totalPrice) {
		boolean b = coffService.setOrder(id, coffName, coffSize,
				coffSyrup, isShot, isWhip, coffNum, totalPrice);
		if(b) {
			JOptionPane.showMessageDialog(null, "주문 성공");
			TotalView();
		}else {
			JOptionPane.showMessageDialog(null, "주문 실패");
			menu();
		}
	}
	
	
	
}
