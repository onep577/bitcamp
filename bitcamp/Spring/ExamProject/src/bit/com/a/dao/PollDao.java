package bit.com.a.dao;

import java.util.List;

import bit.com.a.model.PollDto;
import bit.com.a.model.Voter;

public interface PollDao {
	
	// 모든 투표의 정보를 가져오기
	public List<PollDto> getPollAllList() throws Exception;
	
	// 투표 했는지? 안했는지? 확인
	public int isVote(Voter voter) throws Exception;
	
	// 투표만들기
	//public void makePoll(PollDto poll) throws Exception;
	//public void makePollSub(PollSubDto pollSub) throws Exception;
	
	// 투표하기
	//public PollDto getPoll(PollDto poll) throws Exception;
	//public List<PollSubDto> getPollSubList(PollDto poll) throws Exception;
	
	// 투표
	//public void pollingVoter(Voter voter) throws Exception;
	//public void pollingPoll(Voter voter) throws Exception;
	//public void pollingSub(Voter voter) throws Exception;

}
