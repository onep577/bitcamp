package service.impl;

import java.util.List;

import dao.PriceDao;
import dao.impl.PriceDaoImpl;
import model.PriceDto;
import service.PriceService;

public class PriceServiceImpl implements PriceService {
	PriceDao dao = new PriceDaoImpl();
	
	@Override
	public List<PriceDto> getCoffType() {
		return dao.getCoffType();
	}
	
	@Override
	public List<PriceDto> getCoffeePriceList() {
		return dao.getCoffeePriceList();
	}

	@Override
	public int getTypeOnePrice(String size, String coffType) {
		return dao.getTypeOnePrice(size, coffType);
	}

	
}
