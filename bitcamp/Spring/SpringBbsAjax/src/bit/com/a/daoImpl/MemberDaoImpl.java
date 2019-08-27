package bit.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.MemberDao;
import bit.com.a.model.MemberDto;

//org.springframework를 pom.xml에 넣으면 @Repository를 사용할 수 있다
@Repository		// 저장소
public class MemberDaoImpl implements MemberDao {

	// org.springframework를 pom.xml에 넣으면 @Autowired를 사용할 수 있다
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Member.";
	
	// log4j
	// 현재 클래스에서 Logger를 사용하겠다
	Logger logger = LoggerFactory.getLogger(MemberDaoImpl.class);

	// 회원가입 페이지에서 아이디 중복확인
	@Override
	public boolean idCheck(String id) {
		int count = sqlSession.selectOne(namespace + "idcheck", id);
		
		logger.info("MemberDaoImpl idCheck : " + count);
		
		return count>0?true:false;
	}

	// 회원가입 페이지에서 회원가입 클릭
	@Override
	public boolean account(MemberDto dto) {
		logger.info("MemberDaoImpl account : " + dto.toString());
		int count = sqlSession.insert(namespace + "addmember", dto);
		
		logger.info("MemberDaoImpl account : " + count);

		return count>0?true:false;
	}

	// 로그인 페이지에서 로그인 성공하면 게시판으로 실패하면 로그인 창으로
	@Override
	public boolean loginAf(MemberDto dto) {
		logger.info("MemberDaoImpl loginAf : " + dto.getId() + ", " + dto.getPwd());
		int count = sqlSession.selectOne(namespace + "loginAf", dto);
		
		return count>0?true:false;
	}

	
	
	
	
	
	
}
