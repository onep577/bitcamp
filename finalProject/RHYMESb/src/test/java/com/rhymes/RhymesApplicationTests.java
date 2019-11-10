package com.rhymes;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
public class RhymesApplicationTests {

	@Autowired
	MockMvc mock;
	
	
	@Test
	public void contextLoads() {
		
	}

	
	//@Test 
	public void wel() throws Exception {
		for(int i = 0 ; i < 100000; i++) {
			if( i%2 == 0) {
				
			}
		}
		mock.perform(get("/welcome"))
			.andExpect(status().isOk())
			.andDo(print());
		mock.perform(get("/member/login"))
			.andDo(print());
	}
}
