package com.rhymes.app.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.rhymes.app.member.model.MemberDTO;

@SuppressWarnings("serial")
public class CustomUser extends User{
		
	@SuppressWarnings("unused")
	private MemberDTO dto;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}
	
	public CustomUser(MemberDTO dto) {
		super(dto.getUserid(), dto.getUserpw(), dto.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).collect(Collectors.toList()));
		this.dto = dto;
	}	
}
