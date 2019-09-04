package bit.com.a.dao;

import java.util.List;

import bit.com.a.model.PollDto;
import bit.com.a.model.PollSubDto;
import bit.com.a.model.Voter;

public interface PollDao {
	
	// 모든 투표의 정보를 가져오기
	public List<PollDto> getPollAllList();
	
	// 투표 했는지? 안했는지? 확인
	public int isVote(Voter voter);
	
	// 투표 질문 만들기
	public void makePoll(PollDto poll);
	
	// 투표 보기 만들기
	public void makePollSub(PollSubDto pollSub);

}
