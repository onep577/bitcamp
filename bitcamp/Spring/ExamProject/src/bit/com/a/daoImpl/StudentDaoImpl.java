package bit.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.StudentDao;
import bit.com.a.model.Student;

//org.springframework를 pom.xml에 넣으면 @Repository를 사용할 수 있다
@Repository		// 저장소
public class StudentDaoImpl implements StudentDao {

	// org.springframework를 pom.xml에 넣으면 @Autowired를 사용할 수 있다
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Student.";
	
	// log4j
	// 현재 클래스에서 Logger를 사용하겠다
	Logger logger = LoggerFactory.getLogger(StudentDaoImpl.class);

	// 회원가입 페이지에서 아이디 중복확인
	@Override
	public boolean idCheck(String id) throws Exception {
		int count = sqlSession.selectOne(namespace + "idcheck", id);
		
		logger.info("StudentDaoImpl idCheck : " + count);
		
		return count>0?true:false;
	}

	// 회원가입 페이지에서 회원가입 클릭
	@Override
	public boolean accountAf(Student dto) throws Exception {
		logger.info("StudentDaoImpl accountAf : " + dto.toString());
		int count = sqlSession.insert(namespace + "accountAf", dto);
		
		logger.info("StudentDaoImpl accountAf : " + count);

		return count>0?true:false;
	}

	// 로그인 페이지에서 로그인 성공하면 게시판으로 실패하면 로그인 창으로
	@Override
	public boolean loginAf(Student dto) throws Exception {
		logger.info("StudentDaoImpl loginAf : " + dto.getId() + ", " + dto.getPwd());
		int count = sqlSession.selectOne(namespace + "loginAf", dto);
		
		logger.info("StudentDaoImpl : " + count);
		
		return count>0?true:false;
	}

	// 로그인 한 정보 다 가져오기
	@Override
	public Student loginDto(Student dto) throws Exception {
		dto = sqlSession.selectOne(namespace + "loginsession", dto);
		
		return dto;
	}
	
	
	
	
	
	
}
