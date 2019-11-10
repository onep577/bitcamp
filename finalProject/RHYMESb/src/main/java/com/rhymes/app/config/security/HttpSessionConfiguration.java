package com.rhymes.app.config.security;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class HttpSessionConfiguration implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// session timeout
		se.getSession().setMaxInactiveInterval(60*15);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	}
	// 11.05 session timeout테스트
}
