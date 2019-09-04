package bit.com.a.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.PollDao;
import bit.com.a.model.PollBean;
import bit.com.a.model.PollDto;
import bit.com.a.model.PollSubDto;
import bit.com.a.model.Voter;
import bit.com.a.service.PollService;

@Service
public class PollServiceImpl implements PollService {
	
	@Autowired
	PollDao pollDao;

	// 모든 투표의 정보를 가져오기
	@Override
	public List<PollDto> getPollAllList(String id) {
		
		// 모든 투표 목록을 가져온다
		List<PollDto> list = pollDao.getPollAllList();
		
		// 투표 할 수 있는지를 정리해서 넘겨줄 리스트
		List<PollDto> plist = new ArrayList<PollDto>();
		
		for (PollDto poll : list) {
			int pollid = poll.getPollid();	// 투표번호
			
			// 두번째 값은 아무거나 넣어도 된다
			int count = pollDao.isVote(new Voter(pollid, -1, id));
			
			if(count == 1) {
				// 투표했음
				poll.setVote(true);
			}else {
				// 투표 안했음
				poll.setVote(false);
			}
			plist.add(poll);
		}
		
		return plist;
	}

	// 투표 했는지? 안했는지? 확인
	@Override
	public int isVote(Voter voter) {
		return pollDao.isVote(voter);
	}

	// 투표 만들기 위해 정보 다 가져오기
	@Override
	public void makePoll(PollBean pbean) {
		
		System.out.println("pbean toString : " + pbean.toString());
		
		// 투표 항목		//	투표 만든 사람의 id, 질문, 시작일, 종료일, 보기의 갯수, 이 질문에 투표한 사람 수
		PollDto poll = new PollDto(pbean.getId(), pbean.getQuestion(), pbean.getSdate(),
									pbean.getEdate(), pbean.getItemcount(), 0);
		
		// sequence와 regdate는 DB에서 처리하기 때문에 값이 없다
		System.out.println("poll toString : " + poll.toString());
		
		// 투표 만들기
		pollDao.makePoll(poll);
		
		
		// 보기들		//	0번부터 9번까지 전부 다 가져온다
		String answer[] = pbean.getPollnum();
		
		// itemcount만큼 즉, 보기 갯수만큼 for문 돈다
		for(int i = 0; i < pbean.getItemcount(); i++) {
			PollSubDto pollsub = new PollSubDto();
			//pollsub.setPollid(poll.getPollid());
			pollsub.setAnswer(answer[i]);
			
			System.out.println("pollsub dto : " + pollsub.toString());
			
			pollDao.makePollSub(pollsub);
		}
		/**/

	
	
	
	}

}
