package service.impl;

import dao.CustomerDao;
import dao.impl.CustomerDaoImpl;
import model.CustomerDto;
import service.CustomerService;

public class CustomerServiceImpl implements CustomerService {
	CustomerDao dao = new CustomerDaoImpl();

	@Override
	public boolean addMember(CustomerDto dto) {
		return dao.addMember(dto);
	}

	@Override
	public boolean getId(String id) {
		return dao.getId(id);
	}

	@Override
	public boolean login(String id, String pwd) {
		return dao.login(id, pwd);
	}

	@Override
	public String getLoginId() {
		return dao.loginId();
	}
}
