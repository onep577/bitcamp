package bit.com.a.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.BbsDao;
import bit.com.a.model.BbsDto;
import bit.com.a.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService {
	
	// BbsDao를 생성한다
	@Autowired
	private BbsDao bbsDao;
	
	// 현재 클래스에서 Logger를 사용하겠다
	Logger logger = LoggerFactory.getLogger(BbsServiceImpl.class);
	
	// 게시판 글쓰기
	@Override
	public boolean bbsWrite(BbsDto dto) {
		boolean b = bbsDao.bbsWrite(dto);

		return b;
	}


}
