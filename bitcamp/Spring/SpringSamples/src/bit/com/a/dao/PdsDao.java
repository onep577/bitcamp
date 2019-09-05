package bit.com.a.dao;

import java.util.List;

import bit.com.a.model.PdsDto;

public interface PdsDao {
	
	// 파일 전체 보기
	public List<PdsDto> getPdsList() throws Exception;
	
	// 파일 업로드
	public boolean uploadPds(PdsDto dto) throws Exception;
	
	// 파일 삭제
	public boolean delete(int seq) throws Exception;
	
	// 하나의 파일 가져오기
	public PdsDto getPds(int seq) throws Exception;
	
	// 조회수 증가
	public boolean readcount(int seq) throws Exception;

}
