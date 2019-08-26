package bit.com.a.service;

import bit.com.a.model.MemberDto;

public interface MemberService {
	// 회원가입 페이지에서 아이디 중복확인
	public boolean idCheck(String id);

	// 회원가입 페이지에서 회원가입 클릭
	public boolean account(MemberDto dto);

	// 로그인 페이지에서 로그인 성공하면 게시판으로 이동
	public boolean loginAf(MemberDto dto);

}
