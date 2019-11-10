package com.rhymes.mypage;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

import com.rhymes.app.member.service.MypagePersonalService;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class MypagePersonalTest {

	@Autowired
	BCryptPasswordEncoder bc;
	
	@Autowired
	MypagePersonalService mps;
	
	@Test
	public void confirmPwWhenLeave() {
		String userid = "";
		int result = mps.updateOneMemberToDisabled(userid);
		System.out.println("result:" + result);
		
		userid = "mintestp";
		result = mps.updateOneMemberToDisabled(userid);
		System.out.println("result:" + result);
		
		System.out.println(new Date().getTime());
	}
}
