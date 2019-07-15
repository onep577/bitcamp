package service;

import model.CustomerDto;

public interface CustomerService {
	public boolean addMember(CustomerDto dto);	

	public boolean getId(String id);
	
	public boolean login(String id, String pwd);
	
	public String getLoginId();
}
