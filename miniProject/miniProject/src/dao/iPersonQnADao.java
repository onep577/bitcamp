package dao;

import java.util.List;

import dto.PersonQnADto;

public interface iPersonQnADao {
	
	// 총 글의 갯수
	public int getCount(String choiceStr, String str);
	
	// 고객의소리 List
	public List<PersonQnADto> getPersonQnAList(String choiceStr, String str, int pageNum);
	
	// 고객이 QnA 등록
	public boolean addQnA(PersonQnADto dto);
	
	// 고객이 QnA 수정
	public boolean changeQnA(PersonQnADto dto);
	
	// 관리자가 답변 달아주기
	public boolean updateQnA(String comments, int seq);
	
	// 마이페이지 내가 쓴 QnA List
	public List<PersonQnADto> getMyList(String id);
	
	// 마이페이지에서 내가 쓴 상제 QnA 한개만 볼때
	public PersonQnADto getMyQnA(String seq);
	
	// 회원탈퇴 후 아이디 null값으로 바꾸기
	public boolean outCustomer(String id);
	

}
