package com.exboot.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class OracleConfiguration {
	
	@Autowired
	private ApplicationContext applicationContext;
	
	/**
	 * hikari cp config 명시
	 * conf prop -> application.yml 
	 */
	@Bean
	@ConfigurationProperties("spring.datasource.hikari")
	public HikariConfig hikariConfig() {
		return new HikariConfig();
	}
	
	/**
	 * mybatis에 hikari cp 등록
	 */
	@Bean
	public DataSource dataSource() {
		DataSource dataSource = new HikariDataSource( hikariConfig() );
		return dataSource;
	}
	
	/**
	 * @param dataSource
	 * @return
	 * @throws Exception
	 * SqlFactoryBean에 dataSource와 mapper 경로 등록
	 */
	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
		SqlSessionFactoryBean sqlFactoryBean = new SqlSessionFactoryBean();
		
		sqlFactoryBean.setDataSource(dataSource);
		// mapper가 없으면 sqlSessionFactory 에러가 난다 최소 하나의 mapper가 있어야 된다
		sqlFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/**.xml"));
		return sqlFactoryBean.getObject();
	}
	
	/**
	 * @param sqlSessionFactory
	 * @return
	 * SqlSessionFactory를 SqlSessionTemplate에 등록
	 */
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}