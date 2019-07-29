package dao;

import dto.MemberDto;

public interface iMemberDao {	
	
	public boolean addMember(String id, String pw, String name, String email);
	
	public MemberDto checkLogin(String id, String password);
	
	public boolean getUserId(String id);
	
	public boolean getUserpw(String id, String pw);

}
