package com.rhymes.app.admin.events.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.CouponDTO;
import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.admin.events.model.CouponDetailPagingDTO;

@Repository
public class AdminCouponDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "adcoupon.";
	
	/**검색조건에 맞는 총 쿠폰 개수
	 * @param pDto
	 * @return
	 */
	public int getTotalCountOfCoupons(AdminPointsPagingDTO pDto) {
		return sqlSession.selectOne(ns + "getTotalCountOfCoupons", pDto);
	}
	
	/**페이징, 검색 조건에 맞는 쿠폰 리턴
	 * @param pDto
	 * @return
	 */
	public List<CouponDTO> getCouponsByConditions(AdminPointsPagingDTO pDto){
		return sqlSession.selectList(ns + "getCouponsByConditions", pDto);
	}
	
	/**SEQ(ID)에 맞는 쿠폰정보 리턴
	 * @param seq
	 * @return
	 */
	public CouponDTO getCouponInfoBySeq(int seq){
		return sqlSession.selectOne(ns +"getCouponInfoBySeq", seq);
	}
	
	/**검색조건에 맞는 총 쿠폰 디테일 개수
	 * @param pDto
	 * @return
	 */
	public int getTotalCountOfCouponDetail(CouponDetailPagingDTO pDto) {
		return sqlSession.selectOne(ns + "getTotalCountOfCouponDetail", pDto);
	}
	
	/**검색조건에 맞는 쿠폰 디테일 리턴
	 * @param pdto
	 * @return
	 */
	public List<CouponDetailDTO> getCouponDetails(CouponDetailPagingDTO pdto) {
		return sqlSession.selectList(ns + "getCouponDetails", pdto);
	}
	
	/**쿠폰코드 List DB에 저장
	 * @param codeList
	 * @return
	 */
	public int insertCouponList(List<CouponDetailDTO> codeList) {
		return sqlSession.insert(ns + "insertCouponList", codeList);
	}
	
	/**새 쿠폰 디테일 저장(쿠폰코드를 사용자에게 등록)
	 * @param cDDto
	 * @return
	 */
	public int giveCouponToOneUser(CouponDetailDTO cDDto) {
		return sqlSession.update(ns + "giveCouponToOneUser", cDDto);
	}	

	/**새 쿠폰 생성(rhy_mem_coupon)
	 * @param cDto
	 * @return
	 */
	public int insertNewCoupon(CouponDTO cDto) {
		return sqlSession.insert(ns + "insertNewCoupon", cDto);
	}
}
