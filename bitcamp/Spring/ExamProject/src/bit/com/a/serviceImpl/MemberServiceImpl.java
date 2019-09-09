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
	public boolean idCheck(String id) throws Exception {
		boolean b = memDao.idCheck(id);
		logger.info("MemberServiceImpl idCheck : "+b);
		
		return b;
	}

	// 회원가입 페이지에서 회원가입 클릭
	@Override
	public boolean account(MemberDto dto) throws Exception {
		boolean b = memDao.account(dto);
		logger.info("MemberServiceImpl account : " + b);

		return b;
	}

	// 로그인 페이지에서 로그인 성공하면 게시판으로 실패하면 로그인 창으로
	@Override
	public boolean loginAf(MemberDto dto) throws Exception {
		logger.info("MemberServiceImpl loginAf");
		boolean b = memDao.loginAf(dto);
		logger.info("MemberServiceImpl loginAf : " + b);

		return b;
	}

	// 로그인 한 정보 다 가져오기
	@Override
	public MemberDto loginDto(MemberDto dto) throws Exception {
		return memDao.loginDto(dto);
	}

}
