package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MypageCouponDAO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberReviewPagingDTO;

@Repository
public class MypageCouponDAOImpl implements MypageCouponDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "coupon.";
	
	/**검색조건에 맞는 유효한 쿠폰의 총 개수 리턴
	 * @return
	 */
	@Cacheable(key = "#userid", value = "getCountOnConditions")
	@Override
	public int getCountOnConditions(String userid) {
		// TODO Auto-generated method stub
		//return Integer.parseInt( sqlSession.selectMap(ns + "getCountOnConditions", userid).get("CNT") + "");
		return sqlSession.selectOne(ns + "getCountOnConditions", userid);
	}
	
	/**쿠폰리스트에 보여줄 쿠폰의 총 개수 리턴
	 * @param userid
	 * @return
	 */
	@Override
	public int getCountOfMyCoupons(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getCountOfMyCoupons", userid);
	}

	/**검색조건에 맞는 쿠폰 디테일 정보 리턴
	 * @return
	 */
	@Override
//	public List<MemberCouponDTO> getDetailsOnConditions(PointsPagingDTO dto) {
	public List<MemberCouponDTO> getDetailsOnConditions(MemberReviewPagingDTO dto) {
		// TODO Auto-generated method stub 
		return sqlSession.selectList(ns + "getDetailsOnConditions", dto);
	}
	
	/**쿠폰번호에 맞는 쿠폰상세정보 리턴
	 * @param coup_code
	 * @return
	 */
	@Override
	public MemberCouponDetailDTO getCoupInfoByCoupCode(String coup_code) {
		return sqlSession.selectOne(ns + "getCoupInfoByCoupCode", coup_code);
	}
	
	/**쿠폰상세정보의 c_seq와 일치하는 쿠폰내용 리턴
	 * @param c_seq
	 * @return
	 */
	@Override
	public MemberCouponDTO getCoupInfoByCSeq(int c_seq) {
		return sqlSession.selectOne(ns + "getCoupInfoByCSeq", c_seq);
	}
	
	/**새 쿠폰 등록. 적립인 경우 사용처리까지 수행
	 * @param cDDto
	 * @return
	 */
	@CacheEvict(key = "#userid", value = "getCountOnConditions", allEntries = true)
//	@CacheEvict(key = "#userid", value = {"getAmountOfPointById", "getAmountOfExpiredPointById", "getCountOnConditions"})
	@Override
	public int regiNewCoupon(MemberCouponDetailDTO cDDto) {
		return sqlSession.update(ns + "regiNewCoupon", cDDto);
	}
	
	/**seq에 맞는 CouponDetail 1개의 visible을 0으로 변경
	 * @param seq
	 * @return
	 */
	@Override
	public int deleteCouponInList(int seq) {
		return sqlSession.update(ns + "deleteCouponInList", seq);
	}
}
