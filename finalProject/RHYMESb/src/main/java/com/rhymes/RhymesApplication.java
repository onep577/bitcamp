package com.rhymes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@EnableCaching
@SpringBootApplication
public class RhymesApplication{
//public class RhymesApplication extends SpringBootServletInitializer{
//
//	@Override
//	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
//		// TODO Auto-generated method stub
//		//return super.configure(builder);
//		return builder.sources(RhymesApplication.class);
//	}
	
	public static void main(String[] args) {
		SpringApplication.run(RhymesApplication.class, args);
	}

}
