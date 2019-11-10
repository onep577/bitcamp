package com.rhymes.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.MypagePointsDAO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;
import com.rhymes.app.member.service.MypagePointsService;

@Service
public class MypagePointsServiceImpl implements MypagePointsService {
	
	@Autowired
	private MypagePointsDAO mypagePointsDAO;
	
	/**새 적립금 등록
	 * @param mPDto
	 * @return
	 */
	@Override
	public int addNewPoint(MemberPointDTO mPDto) {
		return mypagePointsDAO.addNewPoint(mPDto);
	}
	
	/**검색조건에 맞는 적립금 디테일의 총 개수 리턴 
	 * @param userid
	 * @return
	 */
	@Override
	public int getCountOnConditions(String userid) {
		// TODO Auto-generated method stub
		return mypagePointsDAO.getCountOnConditions(userid);
	}

	/**검색조건에 맞는 적립금 디테일 정보 리턴
	 * @param dto
	 * @return
	 */
	@Override
	public List<MemberPointDTO> getDetailsOnConditions(PointsPagingDTO dto) {
		// TODO Auto-generated method stub
		return mypagePointsDAO.getDetailsOnConditions(dto);
	}

	/** id에 맞는 디테일 정보 리턴
	 * @param userid
	 * @return
	 */
	@Override
	public List<MemberPointDTO> getDetailsById(String userid) {
		// TODO Auto-generated method stub
		return mypagePointsDAO.getDetailsById(userid);
	}

	/**매개변수로 받은 ID가 갖는 적립금 중 유효한 적립금 총 합 리턴 
	 * @param userid
	 * @return
	 */
	@Override
	public int getAmountOfPointById(String userid) {
		// TODO Auto-generated method stub
		return mypagePointsDAO.getAmountOfPointById(userid);
	}

	/**매개변수로 받은 ID가 갖는 적립금 중 만료 예정인 적립금 총 합 리턴
	 * @param userid
	 * @return
	 */
	@Override
	public int getAmountOfExpiredPointById(String userid) {
		// TODO Auto-generated method stub
		return mypagePointsDAO.getAmountOfExpiredPointById(userid);
	}

}
