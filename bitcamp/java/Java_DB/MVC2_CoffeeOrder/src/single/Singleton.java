package single;

import controller.CustomerController;
import controller.OrderController;
import controller.PriceController;

public class Singleton {
	private static Singleton s = null;
	public boolean coffeePrice = false;
	public boolean totalPrice = false;
	
	public CustomerController cusControl;
	public OrderController orderControl;
	public PriceController priControl;
	
	private Singleton() {
		cusControl = new CustomerController();
		orderControl = new OrderController();
		priControl = new PriceController();
	}
	
	public static Singleton getInstance() {
		if(s == null) {
			s = new Singleton();
		}
		return s;
	} // getInstance 싱글톤 생성 함수

}
