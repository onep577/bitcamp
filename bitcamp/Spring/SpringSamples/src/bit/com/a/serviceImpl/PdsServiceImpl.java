package bit.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.PdsDao;
import bit.com.a.model.PdsDto;
import bit.com.a.service.PdsService;

@Service
public class PdsServiceImpl implements PdsService {

	@Autowired
	PdsDao pdsDao;

	@Override
	public List<PdsDto> getPdsList() {
		return pdsDao.getPdsList();
	}

	@Override
	public boolean uploadPds(PdsDto dto) {
		return pdsDao.uploadPds(dto);
	}
	
}
