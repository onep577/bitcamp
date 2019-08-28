package bit.com.a.serviceImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.BbsDao;
import bit.com.a.model.BbsDto;
import bit.com.a.service.BbsService;

@Service
public class BbsServiceImpl implements BbsService {
	
	// BbsDao를 생성한다
	@Autowired
	private BbsDao bbsDao;
	
	// 현재 클래스에서 Logger를 사용하겠다
	Logger logger = LoggerFactory.getLogger(BbsServiceImpl.class);

	// 전체 리스트 갖고 게시판으로 이동
	@Override
	public List<BbsDto> bbsList() {
		List<BbsDto> list = bbsDao.bbsList();

		return list;
	}
	
	// 게시판 글쓰기
	@Override
	public boolean bbsWrite(BbsDto dto) {
		boolean b = bbsDao.bbsWrite(dto);

		return b;
	}

	// 해당 글 선택하면 조회수 증가
	@Override
	public boolean bbsReadCount(int seq) {
		boolean b = bbsDao.bbsReadCount(seq);

		return b;
	}

	// detail에서 게시글 가져오기
	@Override
	public BbsDto getBbs(int seq) {
		BbsDto dto = bbsDao.getBbs(seq);

		return dto;
	}
	
	// 게시글 삭제
	@Override
	public boolean bbsDelete(int seq) {
		boolean b = bbsDao.bbsDelete(seq);

		return b;
	}
	
	// 게시글 수정
	@Override
	public boolean bbsUpdate(BbsDto dto) {
		boolean b = bbsDao.bbsUpdate(dto);
		
		return b;
	}

	// 게시글 댓글
	@Override
	public boolean answer(BbsDto dto, int seq) {
		boolean b = bbsDao.answer(dto, seq);

		return b;
	}


}
