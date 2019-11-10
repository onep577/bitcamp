package com.rhymes.app.member.service;

import java.util.List;
import java.util.Map;

import com.rhymes.app.member.model.mypage.MemberOrderDetailDTO;
import com.rhymes.app.member.model.mypage.MemberReviewBbsDTO;
import com.rhymes.app.member.model.mypage.MemberReviewDTO;
import com.rhymes.app.member.model.mypage.MemberReviewPagingDTO;

public interface MypageReviewService {
	
	/**매개변수로 받은 유저ID가 갖고있는 모든 주문번호를 가져옴
	 * @param userid
	 * @return
	 */
	public List<String> getPaymentCodesByUserid(String userid);
	
	/**매개변수로 받은 검색조건(userid, review_written(t/f))에 맞는 모든 후기의 개수를 리턴
	 * @param mRPDto
	 * @return
	 */
	public int getReviewCountByIdAndConditions(MemberReviewPagingDTO mRPDto);
	
	/**매개변수로 받은 검색조건(USERID, review_written(t/f), paging)에 맞는 모든 후기목록를 가져옴
	 * @param mRPDto
	 * @return
	 */
	public Map<String, List<MemberReviewDTO>> getReviewByIdAndOtherConditions(MemberReviewPagingDTO mRPDto);
	
	/**리뷰 작성 여부에 따라 Map에 저장
	 * key:true, value:리뷰가작성된 주문이력 Map
	 * key:false, value:리뷰가 작성되지 않은 주문이력 Map
	 * 
	 * 주문이력 Map
	 * key:주문번호, value: 디테일
	 * @param userid
	 * @return
	 */
	public Map<Boolean, Map<String, List<MemberOrderDetailDTO>>> getTwoMapsSeperatedByWhetherReviewWritten(List<String> payment_codes);
	
	/**매개변수로 받은 디테일id(seq)에 맞는 주문정보 리턴 
	 * @param seq
	 * @return
	 */
	public MemberReviewDTO getReviewByIdSeq(int seq);
	
	/**후기 게시물 DB에 저장
	 * @param mRBDto
	 * @return
	 */
	public int insertNewReviewBbs(MemberReviewBbsDTO mRBDto);
	
	/**후기 게시물 저장이 완료된 경우 rhy_payment_details에 review_written값 true로 변경
	 * @param seq
	 * @return
	 */
	public int updateReviewWritten(int seq);	
}
