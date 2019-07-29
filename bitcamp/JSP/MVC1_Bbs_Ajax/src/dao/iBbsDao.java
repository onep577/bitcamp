package dao;

import java.util.List;

import dto.BbsDto;

public interface iBbsDao {
	
	public List<BbsDto> getBbsList();
	
	public boolean bbsWrite(String id, String title, String content);
	
	public BbsDto getWrite(int seq);
	
	public boolean update(int seq, String title, String content);
	
	public boolean readcount(int seq);
	
	public boolean delete(int seq);
	
	public List<BbsDto> search(String search, String searchText);

}
