 package com.rhymes.app.config.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import com.rhymes.app.security.CustomLoginSuccessHandler;
import com.rhymes.app.security.CustomLogoutSuccessHandler;
import com.rhymes.app.security.CustomUserDetailsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
public class SpringSecurityConfiguration extends WebSecurityConfigurerAdapter {

	/**유저 정보를 가져올 곳과 비밀번호 암호화 알고리즘 설정
	 *
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService( customUserService() ).passwordEncoder( bCryptPasswordEncoder() );
	}

	/**security를 무시하는 패턴 설정.
	 *
	 */
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/favicon.ico", "/css/**", "/image/**", "/js/**", "/webjars/**", "/vendor/**", "/ck/**", "/upload/**");
	}

	/**URI 별 접근권한, 로그인 페이지, 로그아웃 등 전체적인 설정
	 *
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		log.info("HttpSecurity");

		//URI패턴 별 권한 설정
		http
			.authorizeRequests()
				.antMatchers("/welcome").permitAll()
				.antMatchers("/main", "/main/**").permitAll()
				.antMatchers("/used", "/used/**").permitAll()
				.antMatchers("/event", "/event/**").permitAll()
				.antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_SELLER')")
				.antMatchers("/store/basket", "/payment", "/payment/**").permitAll()
				.antMatchers("/member/admin", "/member/admin/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/member/member", "/member/member/**").access("hasRole('ROLE_MEMBER')")
				.antMatchers("/mypage/**").access("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN', 'ROLE_SELLER')");
		
		//로그인페이지 설정
		http
			.formLogin()
				.loginPage("/member/login").permitAll()
				.loginProcessingUrl("/login")
				.successHandler( loginSuccessHandler() );
		
		//로그아웃 관련 설정
		http
			.logout()
				.logoutUrl("/logout")
				.invalidateHttpSession(true)
				.deleteCookies("remember-me", "JSESSION_ID")
				.logoutSuccessHandler( logoutSuccessHandler() );
		
	}

	/**로그인에 성공한 경우 후속 작업을 설정한 핸들러를 리턴
	 * @return
	 */
	@Bean
	public AuthenticationSuccessHandler loginSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

	/**로그아웃에 성공한 경우 후속 작업을 설정한 핸들러를 리턴
	 * @return
	 */
	@Bean
	public LogoutSuccessHandler logoutSuccessHandler() {
		return new CustomLogoutSuccessHandler();
	}

	/**http session event publisher 리턴
	 * @return
	 */
	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
		return new HttpSessionEventPublisher();
	}
	
	/**비밀번호를 암호화하기 위한 인코더 리턴
	 * @return
	 */
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	/**DB에 저장된 사용자 정보를 가져오기 위함
	 * @return
	 */
	@Bean
	public UserDetailsService customUserService() {
		return new CustomUserDetailsService();
	}
}
