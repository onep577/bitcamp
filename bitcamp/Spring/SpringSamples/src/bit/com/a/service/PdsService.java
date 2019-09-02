package bit.com.a.service;

import java.util.List;
import bit.com.a.model.PdsDto;

public interface PdsService {
	
	public List<PdsDto> getPdsList();
	
	public boolean uploadPds(PdsDto dto);

}
