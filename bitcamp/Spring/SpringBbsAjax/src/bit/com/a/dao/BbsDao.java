package bit.com.a.dao;

import bit.com.a.model.BbsMemberDto;

public interface BbsDao {

	// 회원가입 페이지에서 아이디 중복확인
	boolean idCheck(String id);
	
	// 회원가입 페이지에서 회원가입 클릭
	boolean account(BbsMemberDto dto);

}
