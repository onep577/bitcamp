package com.rhymes.app.member.controller;

import java.io.DataOutputStream;
import java.net.URL;
import java.security.Principal;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rhymes.app.member.model.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/member/*")
public class AuthTestController {
	
	//@RequestMapping(value = "/testredi", method = RequestMethod.POST)
	@PostMapping(value = "/testredi")
	public String testRediPost() {
		log.info("postpostpostpostpostpostpost");
		return "ok post";
	}
	
//	@RequestMapping(value = "/testredi", method = RequestMethod.GET)
//	public String testRediGet() {
//		log.info("getgetgetgetgetgetgetgetget");
//		return "ok get";
//	}
	
	@RequestMapping(value = "/testredistart")
	public void testRediStart(HttpServletRequest req ,RedirectAttributes redirectAttributes) throws Exception{
					
		URL url = new URL( "https://192.168.0.14:18080/member/testredi");
		HttpsURLConnection con = (HttpsURLConnection) url.openConnection();

		con.setRequestMethod("POST"); // HTTP POST 메소드 설정
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty(CsrfToken.class.getName(), "token");
		con.setDoOutput(true); // POST 파라미터 전달을 위한 설정

		// Send post request
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes("dfdfdf");
		wr.flush();
		wr.close();


		return;
		//return "redirect:/member/testredi";
	}
	
	@GetMapping("/login")
	public String login(HttpServletRequest request, Model model, HttpSession session) {
		log.info("show login view");

		return "rhylogin";
	}

	@GetMapping("/logout")
	public String logout() {

		log.info("do logout");

		return "welcome";
	}

	@GetMapping("/admin")
	public String adminMain() {

		log.info("admin");

		return "memtest/admin";
	}

	@GetMapping("/member")
	public String memberMain() {

		log.info("member");

		return "main";
	}

	@GetMapping("/seller")
	public String sellerMain() {

		log.info("seller");

		return "memtest/seller";
	}

}
