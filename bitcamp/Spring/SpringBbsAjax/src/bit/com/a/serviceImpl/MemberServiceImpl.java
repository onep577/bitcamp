package bit.com.a.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.MemberDao;
import bit.com.a.model.MemberDto;
import bit.com.a.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	// BbsDao를 생성한다
	@Autowired
	private MemberDao memDao;
	Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	// 회원가입 페이지에서 아이디 중복확인
	@Override
	public boolean idCheck(String id) {
		boolean b = memDao.idCheck(id);
		logger.info("BbsServiceImpl idCheck : "+b);
		
		return b;
	}

	// 회원가입 페이지에서 회원가입 클릭
	@Override
	public boolean account(MemberDto dto) {
		boolean b = memDao.account(dto);
		logger.info("BbsServiceImpl account : " + b);

		return b;
	}

	// 로그인 페이지에서 로그인 성공하면 게시판으로 이동
	@Override
	public boolean loginAf(MemberDto dto) {
		boolean b = memDao.loginAf(dto);
		logger.info("BbsServiceImpl loginAf : " + b);

		return b;
	}

}
