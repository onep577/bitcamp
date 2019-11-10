package com.rhymes.db;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.rhymes.app.member.service.MypageCouponService;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class QueryExecuteTest {

	@Autowired
	SqlSession ss;
	
	@Autowired
	MypageCouponService mypageCouponService;
	
	@Test
	public void dd() {
		int d = ss.selectOne("coupon.getCountOnConditions", "mhj");
		System.out.println(d);
		
		int dd = mypageCouponService.getCountOnConditions("mhj");
		System.out.println(dd);
		
		
		
		
	}
}
