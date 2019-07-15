package controller;


import java.util.List;

import model.PriceDto;
import service.PriceService;
import service.impl.PriceServiceImpl;
import view.PriceView;

public class PriceController {
	PriceService priService = new PriceServiceImpl();
	
	public List<PriceDto> getCoffType() {
		List<PriceDto> list = priService.getCoffType();
		return list;
	}
	
	public List<PriceDto> getCoffeePriceList(){
		List<PriceDto> list = priService.getCoffeePriceList();
		return list;
	}
	
	public void PriceView() {
		new PriceView();
	}
	
	public int getTypeOnePrice(String size, String coffType) {
		int price = priService.getTypeOnePrice(size, coffType);
		return price;
	}

	
}
