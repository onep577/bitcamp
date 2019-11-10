package com.rhymes.db;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.rhymes.app.common.util.MypageUtils;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class QueryCreateTest {

	@Test
	public void dd() {
		for (int i = 1; i < 12; i++) {
			if (i < 10) {
				System.out.println(
						"INSERT INTO RHY_MEM_COUPON_DETAIL (C_SEQ, COUP_CODE ) VALUES ( 1, 'AAAAA0" + i + "' );");
			} else {
				System.out.println(
						"INSERT INTO RHY_MEM_COUPON_DETAIL (C_SEQ, COUP_CODE ) VALUES ( 1, 'AAAAA" + i + "' );");
			}

		}

		MypageUtils.printRandCoupsInsert(12, 20, 2);
	}
}
