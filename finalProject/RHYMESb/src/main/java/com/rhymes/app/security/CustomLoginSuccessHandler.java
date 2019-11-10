package com.rhymes.app.security;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.rhymes.app.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	MemberService memberService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp,
			Authentication auth) throws IOException, ServletException {
		// TODO Auto-generated method stub
		log.warn("Login Success");
		
		List<String> roleNames = new ArrayList<String>();

		// auth를 통해 받은 권한 이름들을 roleNames 리스트에 저장
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES : " + roleNames);
		
		if (roleNames.contains("ROLE_ADMIN")) {			
			resp.sendRedirect("/main");
			return;
		}
		if (roleNames.contains("ROLE_MEMBER")) {
			resp.sendRedirect("/main");
			return;
		}
		if (roleNames.contains("ROLE_SELLER")) {
			resp.sendRedirect("/admin/company/main");
			return;
		}

		resp.sendRedirect("/welcome");
		return;
	}

}
