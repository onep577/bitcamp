package bit.com.a.service;

import java.util.List;

import bit.com.a.model.PollBean;
import bit.com.a.model.PollDto;
import bit.com.a.model.PollSubDto;
import bit.com.a.model.Voter;

public interface PollService {
	
	// 모든 투표의 정보를 가져오기
	public List<PollDto> getPollAllList(String id) throws Exception;
	
	// 투표 했는지? 안했는지? 확인
	public int isVote(Voter voter) throws Exception;
	
	// 투표 만들기 위해 정보 다 가져오기
	public void makePoll(PollBean pbean) throws Exception;
	
	// 투표하기
	public PollDto getPoll(PollDto poll) throws Exception;
	public List<PollSubDto> getPollSubList(PollDto poll) throws Exception;
	
	// 투표
	public void polling(Voter voter) throws Exception;

}
