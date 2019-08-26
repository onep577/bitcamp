package bit.com.a.service;

import bit.com.a.model.BbsMemberDto;

public interface BbsService {
	// 회원가입 페이지에서 아이디 중복확인
	public boolean idCheck(String id);

	// 회원가입 페이지에서 회원가입 클릭
	public boolean account(BbsMemberDto dto);


}
