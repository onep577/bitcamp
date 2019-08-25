package dao;

import java.util.List;

import dto.RoomDto;

public interface iRoomDao {

	//객실정보에서 체크박스 별로 서치 했을때 리스트 리턴 해주는 함수
	public List<RoomDto> getRoomSearchList(String search);

	//관리자페이지에서 관리자가 룸 추가할때 함수	
	public boolean addRoom(RoomDto dto);

	//관리자페이지에서 관리자가 룸 삭제할때 함수	
	public boolean delRoom(String room_num);

	//관리자페이지에서 관리자가 룸의 등급과 가격을 수정할때 함수	
	public boolean changeRoom(RoomDto dto);

	//룸 추가할때 룸번호가 있는지 체크하는 함수	
	public boolean CheckRoom_Number(String Room_num);

	//모든 룸 리스트를 가져온다
	public List<RoomDto> getRoomList();
	
	//룸의 등급과 금액을 변경한다
	public boolean updateRoom(RoomDto dto);
	
	//룸의 정보를 삭제한다.
	public boolean deleteRoom(String room_number);
	
	// 특정날짜에 쓸수 있는 방의 목록을 전체적으로 가져온다.
	public List<RoomDto> getAllList(String visit_date, String leave_date);
	
	// 특정날짜에 
	public List<RoomDto> getList(int num1, int num2, String visit_date);

}
