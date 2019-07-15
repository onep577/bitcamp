package service;

import java.util.List;

import model.PriceDto;

public interface PriceService {
	public List<PriceDto> getCoffType();
	
	public List<PriceDto> getCoffeePriceList();
	
	public int getTypeOnePrice(String size, String coffType);
	
}
