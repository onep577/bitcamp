package com.rhymes.admin.events;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.rhymes.app.common.util.MypageUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class CouponEncryption {

	@Autowired
	BCryptPasswordEncoder bp;
	
	//@Test
	public void genCoup() {
		log.info("[test] generate coupon codes");
		
		log.info("bp : " + BCrypt.hashpw("1570429654604", BCrypt.gensalt(6)) );
		log.info("bp : " + BCrypt.hashpw("1570429654604", BCrypt.gensalt(10)) );
		
		MypageUtils.printRandCoupsTimestamp(5);
	}
}
