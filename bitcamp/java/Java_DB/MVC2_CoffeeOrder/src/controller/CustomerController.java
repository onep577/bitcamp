package controller;

import javax.swing.JOptionPane;

import model.CustomerDto;
import service.CustomerService;
import service.impl.CustomerServiceImpl;
import single.Singleton;
import view.accountView;
import view.loginView;

public class CustomerController {
	CustomerService cusService = new CustomerServiceImpl();
	
	public void login() { // 2
		// 로그인 창으로 이동
		new loginView(); // 3
	}
	
	public void account() {
		// 회원가입 창으로 이동
		new accountView();
	}
	
	public boolean idCheck(String id) {
		return cusService.getId(id);
	}
	
	public void regiAf(String id, String pwd, String name, int age) {
		// 회원가입 후 
		boolean b = cusService.addMember(new CustomerDto(id, pwd, name, age, 3));
		// DB까지 쑥하고 들어간다
		
		if(b) {
			JOptionPane.showMessageDialog(null, "가입 성공");
			login();
		}else {
			JOptionPane.showMessageDialog(null, "가입 실패");
			account();
		}
	} // regiAf 함수
	
	public void loginAf(String id, String pwd) {
		// 로그인 후
		boolean b = cusService.login(id, pwd);
		
		if(b) {
			JOptionPane.showMessageDialog(null, "로그인 성공");
			Singleton s = Singleton.getInstance();
			s.orderControl.menu();
		}else {
			JOptionPane.showMessageDialog(null, "로그인 실패");
			login();
		}
	}
	
	public String LoginId() {
		String Loginid = cusService.getLoginId();
		return Loginid;
	}

}
