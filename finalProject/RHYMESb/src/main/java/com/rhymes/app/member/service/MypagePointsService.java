package com.rhymes.app.member.service;

import java.util.List;

import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;

public interface MypagePointsService {

	/**새 적립금 등록
	 * @param mPDto
	 * @return
	 */
	public int addNewPoint(MemberPointDTO mPDto);	
	
	/**검색조건에 맞는 적립금 디테일의 총 개수 리턴 
	 * @param userid
	 * @return
	 */
	public int getCountOnConditions(String userid); 

	/**검색조건에 맞는 적립금 디테일 정보 리턴
	 * @param dto
	 * @return
	 */
	public List<MemberPointDTO> getDetailsOnConditions(PointsPagingDTO dto);
	
	
	/** id에 맞는 디테일 정보 리턴
	 * @param userid
	 * @return
	 */
	public List<MemberPointDTO> getDetailsById(String userid);
	
	
	/**매개변수로 받은 ID가 갖는 적립금 중 유효한 적립금 총 합 리턴 
	 * @param userid
	 * @return
	 */
	public int getAmountOfPointById(String userid);
	
	/**매개변수로 받은 ID가 갖는 적립금 중 만료 예정인 적립금 총 합 리턴
	 * @param userid
	 * @return
	 */
	public int getAmountOfExpiredPointById(String userid);
}
