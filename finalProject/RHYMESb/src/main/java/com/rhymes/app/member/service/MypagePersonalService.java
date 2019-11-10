package com.rhymes.app.member.service;

import java.util.List;

import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;

public interface MypagePersonalService {

	/**매개변수로 받은 ID의 암호화된 비밀번호를 리턴
	 * @param id
	 * @return
	 */
	public String getOnePwById(String id);
	
	/**매개변수로 받은 ID가 갖는 권한 리턴
	 * @param id
	 * @return
	 */
	public List<String> getAuthorities(String id);
	
	/**개인회원 상세 정보 리턴(RHY_MEM_P)
	 * @param id
	 * @return
	 */
	public P_MemberDTO getOnePersonalMemberById(String id);
	
	/**기업회원 상세 정보 리턴(RHY_MEM_C)
	 * @param id
	 * @return
	 */
	public SellerDTO getOneSellerMemberById(String id);
	
	/**매개변수로 받은 아이디 삭제(enabled = false)
	 * @param id
	 * @return
	 */
	public int updateOneMemberToDisabled(String id);
	
	/**매개변수로 받은 회원정보에 맞게 비밀번호 업데이트
	 * @param mem
	 * @return
	 */
	public int updateMemberPassword(MemberDTO mem);
	
	/**매개변수로 받은 개인회원정보로 업데이트
	 * @param pmdto
	 * @return
	 */
	public int updateOnePMember(P_MemberDTO pmdto);
}
