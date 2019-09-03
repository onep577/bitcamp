package bit.com.a.service;

import java.util.List;
import bit.com.a.model.PdsDto;

public interface PdsService {
	
	// 파일 전체 보기
	public List<PdsDto> getPdsList() throws Exception;
	
	// 파일 업로드
	public boolean uploadPds(PdsDto dto) throws Exception;
	
	// 파일 삭제
	public boolean delete(int seq) throws Exception;
	
	// 하나의 파일 가져오기
	public PdsDto getPds(int seq) throws Exception;

}
