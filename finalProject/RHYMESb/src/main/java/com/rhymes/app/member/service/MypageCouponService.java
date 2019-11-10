package com.rhymes.app.member.service;

import java.util.List;

import com.rhymes.app.member.model.PointsPagingDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDetailDTO;
import com.rhymes.app.member.model.mypage.MemberReviewPagingDTO;

public interface MypageCouponService {
		
	/**검색조건에 맞는 유효한 쿠폰의 총 개수 리턴
	 * @return
	 */
	public int getCountOnConditions(String userid);
	
	/**쿠폰리스트에 보여줄 쿠폰의 총 개수 리턴
	 * @param userid
	 * @return
	 */
	public int getCountOfMyCoupons(String userid);
	
	/**검색조건에 맞는 쿠폰 디테일 정보 리턴
	 * @return
	 */
	/* public List<MemberCouponDTO> getDetailsOnConditions(PointsPagingDTO dto); */
	public List<MemberCouponDTO> getDetailsOnConditions(MemberReviewPagingDTO dto);
	
	
	/**쿠폰번호에 맞는 쿠폰상세정보 리턴
	 * @param coup_code
	 * @return
	 */
	public MemberCouponDetailDTO getCoupInfoByCoupCode(String coup_code);
	
	/**쿠폰상세정보의 c_seq와 일치하는 쿠폰내용 리턴
	 * @param c_seq
	 * @return
	 */
	public MemberCouponDTO getCoupInfoByCSeq(int c_seq);
	
	/**새 쿠폰 등록. 적립인 경우 사용처리까지 수행
	 * @param cDDto
	 * @return
	 */
	public int regiNewCoupon(MemberCouponDetailDTO cDDto);

	/**seq에 맞는 CouponDetail 1개의 visible을 0으로 변경
	 * @param seq
	 * @return
	 */
	public int deleteCouponInList(int seq);
}
