package com.rhymes.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.MypageCouponDAO;
import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberReviewPagingDTO;
import com.rhymes.app.member.service.MypageCouponService;

@Service
public class MypageCouponServiceImpl implements MypageCouponService {

	@Autowired
	private MypageCouponDAO mypageCouponDAO;
		
	/**검색조건에 맞는 유효한 쿠폰의 총 개수 리턴
	 * @return
	 */
	@Override
	public int getCountOnConditions(String userid) {
		// TODO Auto-generated method stub
		return mypageCouponDAO.getCountOnConditions(userid);
	}
	
	/**쿠폰리스트에 보여줄 쿠폰의 총 개수 리턴
	 * @param userid
	 * @return
	 */
	@Override
	public int getCountOfMyCoupons(String userid) {
		// TODO Auto-generated method stub
		return mypageCouponDAO.getCountOfMyCoupons(userid);
	}

	/**검색조건에 맞는 쿠폰 디테일 정보 리턴
	 * @return
	 */
	@Override
//	public List<MemberCouponDTO> getDetailsOnConditions(PointsPagingDTO dto) {
	public List<MemberCouponDTO> getDetailsOnConditions(MemberReviewPagingDTO dto) {
		// TODO Auto-generated method stub
		return mypageCouponDAO.getDetailsOnConditions(dto);
	}

	/**쿠폰번호에 맞는 쿠폰상세정보 리턴
	 * @param coup_code
	 * @return
	 */
	@Override
	public MemberCouponDetailDTO getCoupInfoByCoupCode(String coup_code) {
		return mypageCouponDAO.getCoupInfoByCoupCode(coup_code);
	}
	
	/**쿠폰상세정보의 c_seq와 일치하는 쿠폰내용 리턴
	 * @param c_seq
	 * @return
	 */
	@Override
	public MemberCouponDTO getCoupInfoByCSeq(int c_seq) {
		return mypageCouponDAO.getCoupInfoByCSeq(c_seq);
	}
	
	/**새 쿠폰 등록. 적립인 경우 사용처리까지 수행
	 * @param cDDto
	 * @return
	 */
	@Override
	public int regiNewCoupon(MemberCouponDetailDTO cDDto) {
		return mypageCouponDAO.regiNewCoupon(cDDto);
	}
	
	/**seq에 맞는 CouponDetail 1개의 visible을 0으로 변경
	 * @param seq
	 * @return
	 */
	@Override
	public int deleteCouponInList(int seq) {
		return mypageCouponDAO.deleteCouponInList(seq);
	}
}
