package com.rhymes.app.admin.events.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.events.dao.AdminCouponDAO;
import com.rhymes.app.admin.events.model.AdminPointsPagingDTO;
import com.rhymes.app.admin.events.model.CouponDTO;
import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.admin.events.model.CouponDetailPagingDTO;

@Service
public class AdminCouponService {

	@Autowired
	private AdminCouponDAO adminCouponDAO;
	
	/**검색조건에 맞는 총 쿠폰 개수
	 * @param pDto
	 * @return
	 */
	public int getTotalCountOfCoupons(AdminPointsPagingDTO pDto) {
		return adminCouponDAO.getTotalCountOfCoupons(pDto);
	}
	
	/**페이징, 검색 조건에 맞는 쿠폰 리턴
	 * @param pDto
	 * @return
	 */
	public List<CouponDTO> getCouponsByConditions(AdminPointsPagingDTO pDto){
		return adminCouponDAO.getCouponsByConditions(pDto);
	}
	
	/**SEQ(ID)에 맞는 쿠폰정보 리턴
	 * @param seq
	 * @return
	 */
	public CouponDTO getCouponInfoBySeq(int seq){
		return adminCouponDAO.getCouponInfoBySeq(seq);
	}
	
	/**검색조건에 맞는 총 쿠폰 디테일 개수
	 * @param pDto
	 * @return
	 */
	public int getTotalCountOfCouponDetail(CouponDetailPagingDTO pDto) {
		return adminCouponDAO.getTotalCountOfCouponDetail(pDto);
	}
	
	/**검색조건에 맞는 쿠폰 디테일 리턴
	 * @param pdto
	 * @return
	 */
	public List<CouponDetailDTO> getCouponDetails(CouponDetailPagingDTO pdto) {
		return adminCouponDAO.getCouponDetails(pdto);
	}
	
	/**쿠폰코드 List DB에 저장
	 * @param codeList
	 * @return
	 */
	public int insertCouponList(List<CouponDetailDTO> codeList) {
		return adminCouponDAO.insertCouponList(codeList);
	}
	
	/**새 쿠폰 디테일 저장(쿠폰코드를 사용자에게 등록)
	 * @param cDDto
	 * @return
	 */
	public int giveCouponToOneUser(CouponDetailDTO cDDto) {
		return adminCouponDAO.giveCouponToOneUser(cDDto);
	}
	
	/**새 쿠폰 생성(rhy_mem_coupon)
	 * @param cDto
	 * @return
	 */
	public int insertNewCoupon(CouponDTO cDto) {
		return adminCouponDAO.insertNewCoupon(cDto);
	}
}
