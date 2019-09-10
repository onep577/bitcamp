package bit.com.a.serviceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.StudentDao;
import bit.com.a.model.Student;
import bit.com.a.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
	
	// studentDao를 생성한다
	@Autowired
	private StudentDao studentDao;

	Logger logger = LoggerFactory.getLogger(StudentServiceImpl.class);

	// 회원가입 페이지에서 아이디 중복확인
	@Override
	public boolean idCheck(String id) throws Exception {
		boolean b = studentDao.idCheck(id);
		logger.info("StudentServiceImpl idCheck : "+b);
		
		return b;
	}

	// 회원가입 페이지에서 회원가입 클릭
	@Override
	public boolean accountAf(Student dto) throws Exception {
		boolean b = studentDao.accountAf(dto);
		logger.info("StudentServiceImpl accountAf : " + b);

		return b;
	}

	// 로그인 페이지에서 로그인 성공하면 게시판으로 실패하면 로그인 창으로
	@Override
	public boolean loginAf(Student dto) throws Exception {
		logger.info("StudentServiceImpl loginAf");
		boolean b = studentDao.loginAf(dto);
		logger.info("StudentServiceImpl loginAf : " + b);

		return b;
	}

	// 로그인 한 정보 다 가져오기
	@Override
	public Student loginDto(Student dto) throws Exception {
		return studentDao.loginDto(dto);
	}

}
