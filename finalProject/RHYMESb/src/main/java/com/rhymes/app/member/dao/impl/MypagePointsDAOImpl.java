package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MypagePointsDAO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberPointDTO;

@Repository
public class MypagePointsDAOImpl implements MypagePointsDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "points.";
	
	/**새 적립금 등록
	 * @param mPDto
	 * @return
	 */
	@CacheEvict(key = "#userid", value = "getAmountOfPointById", allEntries = true)
	//@CacheEvict(value = {"getAmountOfPointById", "getAmountOfExpiredPointById"}, key = "#userid")
	@Override
	public int addNewPoint(MemberPointDTO mPDto) {
		return sqlSession.insert(ns + "addNewPoint", mPDto);
	}
	
	/**검색조건에 맞는 적립금 디테일의 총 개수 리턴 
	 * @param userid
	 * @return
	 */
	@Override
	public int getCountOnConditions(String userid) {
		// TODO Auto-generated method stub
		try {
			return sqlSession.selectOne(ns + "getCountOnConditions", userid);
		}catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		
	}

	/**검색조건에 맞는 적립금 디테일 정보 리턴
	 * @param dto
	 * @return
	 */
	@Override
	public List<MemberPointDTO> getDetailsOnConditions(PointsPagingDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getDetailsOnConditions", dto);
	}

	/** id에 맞는 디테일 정보 리턴
	 * @param userid
	 * @return
	 */
	@Override
	public List<MemberPointDTO> getDetailsById(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getDetailsById", userid);
	}

	/**매개변수로 받은 ID가 갖는 적립금 중 유효한 적립금 총 합 리턴 
	 * @param userid
	 * @return
	 */
	@Cacheable(key = "#userid", value = "getAmountOfPointById")
	@Override
	public int getAmountOfPointById(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getAmountOfPointById", userid);
	}

	/**매개변수로 받은 ID가 갖는 적립금 중 만료 예정인 적립금 총 합 리턴
	 * @param userid
	 * @return
	 */
	@Cacheable(key = "#userid", value = "getAmountOfExpiredPointById")
	@Override
	public int getAmountOfExpiredPointById(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getAmountOfExpiredPointById", userid);
	}

}
