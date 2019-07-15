package dao;

import model.CustomerDto;

public interface CustomerDao {
	
	public boolean addMember(CustomerDto dto);
	
	public boolean getId(String id);

	public boolean login(String id, String pwd);
	
	public String loginId();
}
