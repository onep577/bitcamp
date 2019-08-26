package bit.com.a.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.BbsDao;
import bit.com.a.model.BbsMemberDto;
import bit.com.a.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService {
	
	// BbsDao를 생성한다
	@Autowired
	private BbsDao bbsDao;
	Logger logger = LoggerFactory.getLogger(BbsServiceImpl.class);

	// 회원가입 페이지에서 아이디 중복확인
	@Override
	public boolean idCheck(String id) {
		boolean b = bbsDao.idCheck(id);
		logger.info("BbsServiceImpl idCheck : "+b);
		
		return b;
	}

	// 회원가입 페이지에서 회원가입 클릭
	@Override
	public boolean account(BbsMemberDto dto) {
		boolean b = bbsDao.account(dto);
		logger.info("BbsServiceImpl account : " + b);

		return b;
	}

}
