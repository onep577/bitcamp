package dao;

import java.util.List;

import model.PriceDto;

public interface PriceDao {

	public List<PriceDto> getCoffType();

	public List<PriceDto> getCoffeePriceList();

	public int getTypeOnePrice(String size, String cofftype);
}
