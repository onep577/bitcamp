package com.rhymes.app.config.cache;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.extern.slf4j.Slf4j;

/**EHCache 활용을 위한 설정
 * @author minhj
 *
 */
@Slf4j
@Configuration
@EnableCaching
public class CacheConfiguration implements CommandLineRunner {

	@Autowired
	private CacheManager cacheManager;
	

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		log.info("\n\n" + "=========================================================\n"
                + "Using cache manager: " + this.cacheManager.getClass().getName() + "\n"
                + "=========================================================\n\n");
	}
	
}
