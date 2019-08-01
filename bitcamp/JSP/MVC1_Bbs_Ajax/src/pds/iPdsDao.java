package pds;

import java.util.List;

public interface iPdsDao {
	
	public List<PdsDto> getPdsList();
	
	public boolean addPds(String id, String title, String content, String filename);
	
	public PdsDto getOnePds(int seq);
	
	public boolean readcount(int seq);
	
	public boolean deletePds(int seq);

}
