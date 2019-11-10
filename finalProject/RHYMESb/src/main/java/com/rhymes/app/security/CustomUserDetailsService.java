package com.rhymes.app.security;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.rhymes.app.member.dao.MemberDAO;
import com.rhymes.app.member.model.AuthoritiesDTO;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

/**DB에서 사용자 정보를 가져오는 역할
 * @author minhj
 *
 */
@Slf4j
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberDAO memDAO;
	
	@Autowired
	private HttpSession session;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserId : " + username);
		
		session.setAttribute("userloginid", username);
		
		MemberDTO dto = memDAO.getOneMemberByMemberId(username);
		
		
		return dto == null ? null : new CustomUser(dto);
	}	
}
