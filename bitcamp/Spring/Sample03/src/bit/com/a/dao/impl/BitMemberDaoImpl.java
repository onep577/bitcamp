package bit.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.BitMemberDao;
import bit.com.a.model.MemberDto;

@Repository // == 저장소
public class BitMemberDaoImpl implements BitMemberDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Member.";

	@Override
	public boolean addmember(MemberDto mem) throws Exception {		
		// 앞에 아이디값은 Member.addmember로 들어간다
		int n = sqlSession.insert(namespace + "addmember", mem);
		return n>0?true:false;
	}

	@Override
	public boolean loginCheck(MemberDto mem) throws Exception {		
		String id = sqlSession.selectOne(namespace + "loginCheck", mem);
		
		if(mem.getId().equals(id) ) {
			return true;
		}else {
			return false;
		}		
	}

	@Override
	public boolean idCheck(String id) throws Exception {
		int count = sqlSession.selectOne(namespace + "idCheck", id);
		
		if(count > 0) {
			return true;
		}else {
			return false;
		}
		
	}
	
	
	
	

}
