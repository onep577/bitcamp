package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MypageOrderlogDAO;
import com.rhymes.app.member.model.mypage.MemberOrderDTO;
import com.rhymes.app.member.model.mypage.MemberOrderDetailDTO;
import com.rhymes.app.member.model.mypage.MemberOrderPagingDTO;
import com.rhymes.app.member.model.mypage.MemberPaymentDTO;

/**마이페이지 주문내역 DAO
 * @author minhj
 *
 */
@Repository
public class MypageOrderlogDAOImpl implements MypageOrderlogDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "orderlog.";
	
	/**검색조건에 맞는 결제이력을 리턴
	 * 	- userid
	 * 	- 기간
	 * 	- 페이징 
	 * @return
	 */
	@Override
	public List<MemberOrderDTO> getOrderlogsById(MemberOrderPagingDTO mOPDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getOrderlogsById", mOPDto);
	}

	/**검색조건에 맞는 총 결제이력 수를 리턴
	 * 	- userid
	 *  - 기간
	 * @return
	 */
	@Override
	public int getTotalOrderlogCount(MemberOrderPagingDTO mOPDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getTotalOrderlogCount", mOPDto);
	}

	/**매개변수로 받은 주문번호에 맞는 세부 주문내역 리턴
	 * @param payment_code
	 * @return
	 */
	@Override
	public List<MemberOrderDetailDTO> getOrderlogDetailsByPaymentCode(String payment_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getOrderlogDetailsByPaymentCode", payment_code);
	}

	/**매개변수로 받은 주문번호에 맞는 결제정보, 주문정보, 배송정보 리턴
	 * @param payment_code
	 * @return
	 */
	@Override
	public MemberPaymentDTO getPaymentInfoByPaymentCode(String payment_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns + "getPaymentInfoByPaymentCode", payment_code);
	}

	/**매개변수로 받은 주문번호 삭제(주문취소, 미결제인 경우에만 가능)
	 * @param payment_code
	 * @return
	 */
	@Override
	public int deletePayment(String payment_code) {
		// TODO Auto-generated method stub
		int result = 0;
		result = sqlSession.delete(ns + "deletePayment", payment_code);
		result = sqlSession.delete(ns + "deletePaymentDetail", payment_code);		
		return result;
	}	
}
