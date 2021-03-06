package bit.com.a.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.PollDao;
import bit.com.a.model.PollBean;
import bit.com.a.model.PollDto;
import bit.com.a.model.PollSubDto;
import bit.com.a.model.Subject;
import bit.com.a.model.Voter;
import bit.com.a.service.PollService;

@Service
public class PollServiceImpl implements PollService {
	
	@Autowired
	PollDao pollDao;

	// 모든 투표의 정보를 가져오기
	@Override
	public List<PollDto> getPollAllList(String id) throws Exception {
		
		// 모든 투표 목록을 가져온다
		List<PollDto> list = pollDao.getPollAllList();
		
		// 투표 할 수 있는지를 정리해서 넘겨줄 리스트
		List<PollDto> plist = new ArrayList<PollDto>();
		
		for (PollDto poll : list) {
			int subject_seq = poll.getExam_seq();	// 투표번호
			
			// 두번째 값은 아무거나 넣어도 된다
			int count = pollDao.isVote(new Voter(subject_seq, id));
			
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
	public int isVote(Voter voter) throws Exception {
		return pollDao.isVote(voter);
	}

	// 투표 만들기 위해 정보 다 가져오기
	@Override
	public void makePoll(PollBean pbean) throws Exception {
		
		System.out.println("pbean toString : " + pbean.toString());
		
		// 과목 만들기
		Subject subject = new Subject(pbean.getTitle(), pbean.getSdate(), pbean.getEdate());
		
		// sequence와 regdate는 DB에서 처리하기 때문에 값이 없다
		System.out.println("subject toString : " + subject.toString());
		
		pollDao.makeSubject(subject);
		
		// itemcount만큼 즉, 보기 갯수만큼 for문 돈다
		for(int i = 0; i < Integer.parseInt(pbean.getItemcount()); i++) {

			
			// 투표 항목		//	투표 만든 사람의 id, 질문, 시작일, 종료일, 질문의 갯수
			PollDto poll = new PollDto(pbean.getQuestion(), pbean.getQuestion_sub(),
							pbean.getTeacher(), pbean.getSdate(), pbean.getEdate());
			
			// 투표 보기
			PollSubDto pollsub = new PollSubDto(pbean.getQuestion(), pbean.getQuestion_sub(), pbean.getAnswer(),
					pbean.getPollsub1(), pbean.getPollsub2(), pbean.getPollsub3(), pbean.getPollsub4());
			
			System.out.println("poll toString : " + poll.toString());
			System.out.println("pollsub toString : " + pollsub.toString());
			
			// 투표 만들기
			pollDao.makePoll(poll);
			pollDao.makePollSub(pollsub);
		}
		
		
	}


	// 투표하기
	/*
	@Override
	public PollDto getPoll(PollDto poll) throws Exception {
		return pollDao.getPoll(poll);
	}

	@Override
	public List<PollSubDto> getPollSubList(PollDto poll) throws Exception {
		return pollDao.getPollSubList(poll);
	}
	/**/

	// 투표
	/*
	@Override
	public void polling(Voter voter) throws Exception {
		// 투표자 등록, 질문의 카운터, 보기의 카운터
		pollDao.pollingVoter(voter);
		pollDao.pollingPoll(voter);
		pollDao.pollingSub(voter);
	}
	/**/

}
