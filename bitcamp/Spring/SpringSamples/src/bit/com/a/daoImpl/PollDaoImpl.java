package bit.com.a.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.PollDao;
import bit.com.a.model.PollDto;
import bit.com.a.model.PollSubDto;
import bit.com.a.model.Voter;

@Repository
public class PollDaoImpl implements PollDao {
	
	// sqlSession은 ibatis 소속이고 sqlsessiontemplate은 mybatis 소속이다 차이가 거의 없다
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "Poll.";

	// 모든 투표의 정보를 가져오기
	@Override
	public List<PollDto> getPollAllList() {
		return sqlSession.selectList(namespace + "getPollAllList");
	}

	// 투표 했는지? 안했는지? 확인
	@Override
	public int isVote(Voter voter) {
		return sqlSession.selectOne(namespace + "isVote", voter);
	}

	// 투표 질문 만들기
	@Override
	public void makePoll(PollDto poll) {
		sqlSession.insert(namespace + "makePoll", poll);		
	}

	// 투표 보기 만들기
	@Override
	public void makePollSub(PollSubDto pollSub) {
		sqlSession.insert(namespace + "makePollSub", pollSub);
	}

}
