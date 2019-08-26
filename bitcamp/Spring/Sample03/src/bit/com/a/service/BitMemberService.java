package bit.com.a.service;

import bit.com.a.model.MemberDto;

public interface BitMemberService {
	
	public boolean addmember(MemberDto mem) throws Exception;
	
	public boolean loginCheck(MemberDto mem) throws Exception;
	
	public boolean idCheck(String id) throws Exception;

}