package dao;

import java.util.List;

import dto.NoticeDto;

public interface iNoticeDao {

	// 공지 추가
	public boolean addNotice( NoticeDto dto );
	
	// 공지 리스트
	public List<NoticeDto> getNoticeList();
	
	// 공지 리스트 (페이징 적용)
	public List<NoticeDto> getPagingList(String choice, String searchWord, int page);
	
	// 공지 내용
	public NoticeDto getContent(int seq);
	
	// 조회수
	public void readcount(int seq);

	// 모든 페이지수
	public int getAllnotice(String choice,String searchWord);
	
	// 공지 삭제
	public boolean delNotice( int seq );
	
	// 공지 업데이트
	public boolean updateNotice(NoticeDto dto, int seq);
	
	// 다운로드 증가
	public void downcount(int seq);

	
	

}
