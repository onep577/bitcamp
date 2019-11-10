package com.rhymes.app.member.dao;

import java.util.List;

import com.rhymes.app.member.model.mypage.MemberOrderDTO;
import com.rhymes.app.member.model.mypage.MemberOrderDetailDTO;
import com.rhymes.app.member.model.mypage.MemberOrderPagingDTO;
import com.rhymes.app.member.model.mypage.MemberPaymentDTO;

/**마이페이지 주문내역 DAO
 * @author minhj
 *
 */
public interface MypageOrderlogDAO {
	
	/**검색조건에 맞는 결제이력을 리턴
	 * 	- userid
	 * 	- 기간
	 * 	- 페이징 
	 * @return
	 */
	public List<MemberOrderDTO> getOrderlogsById(MemberOrderPagingDTO mOPDto);
	
	/**검색조건에 맞는 총 결제이력 수를 리턴
	 * 	- userid
	 *  - 기간
	 * @return
	 */
	public int getTotalOrderlogCount(MemberOrderPagingDTO mOPDto);
	
	/**매개변수로 받은 주문번호에 맞는 세부 주문내역 리턴
	 * @param payment_code
	 * @return
	 */
	public List<MemberOrderDetailDTO> getOrderlogDetailsByPaymentCode(String payment_code);
		
	/**매개변수로 받은 주문번호에 맞는 결제정보, 주문정보, 배송정보 리턴
	 * @param payment_code
	 * @return
	 */
	public MemberPaymentDTO getPaymentInfoByPaymentCode(String payment_code);
		
	/**매개변수로 받은 주문번호 삭제(주문취소, 미결제인 경우에만 가능)
	 * @param payment_code
	 * @return
	 */
	public int deletePayment(String payment_code);
}
