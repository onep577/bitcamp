package bit.com.a.dao;

import bit.com.a.model.MemberDto;

public interface MemberDao {

	// 회원가입 페이지에서 아이디 중복확인
	boolean idCheck(String id);
	
	// 회원가입 페이지에서 회원가입 클릭
	boolean account(MemberDto dto);
	
	// 로그인 페이지에서 로그인 성공하면 게시판으로 이동
	boolean loginAf(MemberDto dto);

}
