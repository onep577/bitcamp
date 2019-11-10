package com.rhymes.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.dao.MypagePersonalDAO;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.member.service.MypagePersonalService;

@Service
public class MypagePersonalServiceImpl implements MypagePersonalService {

	@Autowired
	private MypagePersonalDAO mypagePersonalDAO;
	
	/**매개변수로 받은 ID의 암호화된 비밀번호를 리턴
	 * @param id
	 * @return
	 */
	@Override
	public String getOnePwById(String id) {
		// TODO Auto-generated method stub
		return mypagePersonalDAO.getOnePwById(id);
	}

	/**매개변수로 받은 ID가 갖는 권한 리턴
	 * @param id
	 * @return
	 */
	@Override
	public List<String> getAuthorities(String id) {
		// TODO Auto-generated method stub
		return mypagePersonalDAO.getAuthorities(id);
	}

	/**개인회원 상세 정보 리턴(RHY_MEM_P)
	 * @param id
	 * @return
	 */
	@Override
	public P_MemberDTO getOnePersonalMemberById(String id) {
		// TODO Auto-generated method stub
		return mypagePersonalDAO.getOnePersonalMemberById(id);
	}

	/**기업회원 상세 정보 리턴(RHY_MEM_C)
	 * @param id
	 * @return
	 */
	@Override
	public SellerDTO getOneSellerMemberById(String id) {
		// TODO Auto-generated method stub
		return mypagePersonalDAO.getOneSellerMemberById(id);
	}

	/**매개변수로 받은 아이디 삭제(enabled = false)
	 * @param id
	 * @return
	 */
	@Override
	public int updateOneMemberToDisabled(String id) {
		// TODO Auto-generated method stub
		return mypagePersonalDAO.updateOneMemberToDisabled(id);
	}
	
	/**매개변수로 받은 회원정보에 맞게 비밀번호 업데이트
	 * @param mem
	 * @return
	 */
	@Override
	public int updateMemberPassword(MemberDTO mem) {
		// TODO Auto-generated method stub
		return mypagePersonalDAO.updateMemberPassword(mem);
	}

	/**매개변수로 받은 개인회원정보로 업데이트
	 * @param pmdto
	 * @return
	 */
	@Override
	public int updateOnePMember(P_MemberDTO pmdto) {
		// TODO Auto-generated method stub
		return mypagePersonalDAO.updateOnePMember(pmdto);
	}
	
}
