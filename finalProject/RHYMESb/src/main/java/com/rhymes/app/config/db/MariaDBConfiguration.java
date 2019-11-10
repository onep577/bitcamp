package com.rhymes.app.config.db;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@PropertySource("classpath:/application.yml")
public class MariaDBConfiguration {

	@Bean
	@ConfigurationProperties(prefix = "spring.datasource.hikari")
	public HikariConfig hikariConfig() {
		return new HikariConfig();
	}

	@Bean
	public DataSource dataSource() {
		DataSource dataSource = new HikariDataSource(hikariConfig());
		return dataSource;
	}	
	
	@Autowired
	private ApplicationContext applicationContext;

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*.xml"));
		
		return sqlSessionFactoryBean.getObject();
	}

	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
			return new SqlSessionTemplate(sqlSessionFactory);
	}
	
//	@Bean
//	public MapperFactoryBean sd(SqlSessionFactory ssf, DataSource ds) throws Exception {
//		SqlSessionTemplate st = new SqlSessionTemplate(ssf);
//		
//		MapperFactoryBean mp = new MapperFactoryBean();
//		mp.setSqlSessionFactory(sqlSessionFactory(ds));
//		mp.setSqlSessionTemplate(st);
//		mp.setMapperInterface(MemberDAO.class);
//		
//		return mp;
//	}
}
