package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MypageReviewDAO;
import com.rhymes.app.member.model.mypage.MemberReviewBbsDTO;
import com.rhymes.app.member.model.mypage.MemberReviewDTO;
import com.rhymes.app.member.model.mypage.MemberReviewPagingDTO;

@Repository
public class MypageReviewDAOImpl implements MypageReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "review.";
	
	/**매개변수로 받은 유저ID가 갖고있는 모든 주문번호를 가져옴
	 * @param userid
	 * @return
	 */
	@Override
	public List<String> getPaymentCodesByUserid(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getPaymentCodesByUserid", userid);
	}
	
	/**매개변수로 받은 검색조건(userid, review_written(t/f))에 맞는 모든 후기의 개수를 리턴
	 * @param mRPDto
	 * @return
	 */
	@Override
	public int getReviewCountByIdAndConditions(MemberReviewPagingDTO mRPDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getReviewCountByIdAndConditions", mRPDto);
	}

	/**매개변수로 받은 검색조건(USERID, review_written(t/f), paging)에 맞는 모든 후기목록를 가져옴
	 * @param mRPDto
	 * @return
	 */
	@Override
	public List<MemberReviewDTO> getReviewByIdAndOtherConditions(MemberReviewPagingDTO mRPDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getReviewByIdAndOtherConditions", mRPDto);
	}
	
	/**매개변수로 받은 디테일id(seq)에 맞는 주문정보 리턴 
	 * @param seq
	 * @return
	 */
	@Override
	public MemberReviewDTO getReviewByIdSeq(int seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getReviewByIdSeq", seq);
	}
	
	/**후기 게시물 DB에 저장
	 * @param mRBDto
	 * @return
	 */
	@Override
	public int insertNewReviewBbs(MemberReviewBbsDTO mRBDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(ns + "insertNewReviewBbs", mRBDto);
	}
	
	/**후기 게시물 저장이 완료된 경우 rhy_payment_details에 review_written값 true로 변경
	 * @param seq
	 * @return
	 */
	@Override
	public int updateReviewWritten(int seq) {
		// TODO Auto-generated method stub
		return sqlSession.update(ns + "updateReviewWritten", seq);
	}
	
}
