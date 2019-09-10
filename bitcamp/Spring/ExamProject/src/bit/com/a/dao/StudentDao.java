package bit.com.a.dao;

import bit.com.a.model.Student;

public interface StudentDao {

	// 회원가입 페이지에서 아이디 중복확인
	boolean idCheck(String id) throws Exception;
	
	// 회원가입 페이지에서 회원가입 클릭
	boolean accountAf(Student dto) throws Exception;
	
	// 로그인 페이지에서 로그인 성공하면 게시판으로 실패하면 로그인 창으로
	boolean loginAf(Student dto) throws Exception;
	
	// 로그인 한 정보 다 가져오기
	public Student loginDto(Student dto) throws Exception;

}
