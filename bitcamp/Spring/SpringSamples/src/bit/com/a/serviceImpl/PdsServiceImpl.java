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

	// 파일 전체 보기
	@Override
	public List<PdsDto> getPdsList() throws Exception {
		return pdsDao.getPdsList();
	}

	// 파일 업로드
	@Override
	public boolean uploadPds(PdsDto dto) throws Exception {
		return pdsDao.uploadPds(dto);
	}

	// 파일 삭제
	@Override
	public boolean delete(int seq) throws Exception {
		return pdsDao.delete(seq);
	}

	// 하나의 파일 가져오기
	@Override
	public PdsDto getPds(int seq) throws Exception {
		return pdsDao.getPds(seq);
	}
	
}
