package bit.com.a.service;

import java.util.List;

import bit.com.a.model.BbsDto;

public interface BbsService {
	
	// 전체 리스트 갖고 게시판으로 이동
	public List<BbsDto> bbsList();
	
	// 게시판 글쓰기
	public boolean bbsWrite(BbsDto dto);
	
	// 게시판 조회수 증가
	public boolean bbsReadCount(int seq);
	
	// detail에서 게시글 가져오기
	public BbsDto getBbs(int seq);
	
	// 게시글 삭제
	public boolean bbsDelete(int seq);

	// 게시글 수정
	public boolean bbsUpdate(BbsDto dto);
	
	// 게시글 댓글
	public boolean answer(BbsDto dto);
}
