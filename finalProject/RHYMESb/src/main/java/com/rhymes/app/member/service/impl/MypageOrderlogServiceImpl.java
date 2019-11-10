package com.rhymes.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.MypageOrderlogDAO;
import com.rhymes.app.member.model.mypage.MemberOrderDTO;
import com.rhymes.app.member.model.mypage.MemberOrderDetailDTO;
import com.rhymes.app.member.model.mypage.MemberOrderPagingDTO;
import com.rhymes.app.member.model.mypage.MemberPaymentDTO;
import com.rhymes.app.member.service.MypageOrderlogService;

/**마이페이지 주문내역 서비스
 * @author minhj
 *
 */
@Service
public class MypageOrderlogServiceImpl implements MypageOrderlogService {

	@Autowired
	private MypageOrderlogDAO mypageOrderlogDAO;
	
	/**검색조건에 맞는 결제이력을 리턴
	 * 	- userid
	 * 	- 기간
	 * 	- 페이징 
	 * @return
	 */
	@Override
	public List<MemberOrderDTO> getOrderlogsById(MemberOrderPagingDTO mOPDto) {
		// TODO Auto-generated method stub
		return mypageOrderlogDAO.getOrderlogsById(mOPDto);
	}

	/**검색조건에 맞는 총 결제이력 수를 리턴
	 * 	- userid
	 *  - 기간
	 * @return
	 */
	@Override
	public int getTotalOrderlogCount(MemberOrderPagingDTO mOPDto) {
		// TODO Auto-generated method stub
		return mypageOrderlogDAO.getTotalOrderlogCount(mOPDto);
	}

	/**매개변수로 받은 주문번호에 맞는 세부 주문내역 리턴
	 * @param payment_code
	 * @return
	 */
	@Override
	public List<MemberOrderDetailDTO> getOrderlogDetailsByPaymentCode(String payment_code) {
		// TODO Auto-generated method stub
		return mypageOrderlogDAO.getOrderlogDetailsByPaymentCode(payment_code);
	}

	/**매개변수로 받은 주문번호에 맞는 결제정보, 주문정보, 배송정보 리턴
	 * @param payment_code
	 * @return
	 */
	@Override
	public MemberPaymentDTO getPaymentInfoByPaymentCode(String payment_code) {
		// TODO Auto-generated method stub
		return mypageOrderlogDAO.getPaymentInfoByPaymentCode(payment_code);
	}

	/**매개변수로 받은 주문번호 삭제(주문취소, 미결제인 경우에만 가능)
	 * @param payment_code
	 * @return
	 */
	@Override
	public int deletePayment(String payment_code) {
		// TODO Auto-generated method stub
		return mypageOrderlogDAO.deletePayment(payment_code);
	}
	
}
