package bit.com.a.service;

import java.util.List;

import bit.com.a.model.PollBean;
import bit.com.a.model.PollDto;
import bit.com.a.model.Voter;

public interface PollService {
	
	// 모든 투표의 정보를 가져오기
	public List<PollDto> getPollAllList(String id);
	
	// 투표 했는지? 안했는지? 확인
	public int isVote(Voter voter);
	
	// 투표 만들기 위해 정보 다 가져오기
	public void makePoll(PollBean pbean);

}
