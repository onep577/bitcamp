package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MypageWishlistDAO;
import com.rhymes.app.member.model.mypage.MemberStockDTO;
import com.rhymes.app.member.model.mypage.MemberWishlistDTO;

@Repository
public class MypageWishlistDAOImpl implements MypageWishlistDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "wishlist.";
	
	/**매개변수로 받은 ID에 맞는 찜목록 리턴
	 * @param userid
	 * @return
	 */
	@Override
	public List<MemberWishlistDTO> getWishlistById(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getWishlistById", userid);
	}

	/**매개변수로 받은 ID와 p_seq에 맞는 찜 아이템 삭제
	 * @param dto
	 * @return
	 */
	@Override
	public int deleteWishItemByIdAndP_Seq(MemberWishlistDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.delete(ns + "deleteWishItemByIdAndP_Seq", dto);
	}

	/**상품번호에 맞는 재고정보 리스트 리턴
	 * @param p_seq
	 * @return
	 */
	@Override
	public List<MemberStockDTO> getSizeListByP_Seq(int p_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "getSizeListByP_Seq", p_seq);
	}
	
}
