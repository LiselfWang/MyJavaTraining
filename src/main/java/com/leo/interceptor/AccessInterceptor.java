package com.leo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

@Configuration
public class AccessInterceptor implements HandlerInterceptor {
	/**
	 * 访问控制器前
	 * 
	 * @param request
	 * @param response
	 * @param o
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
		response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
		response.setHeader("Access-Control-Allow-Credentials", "true");
		response.setHeader("P3P", "CP=CAO PSA OUR");
		if (request.getHeader("Access-Control-Request-Method") != null && "OPTIONS".equals(request.getMethod())) {
			response.addHeader("Access-Control-Allow-Methods", "POST,GET,TRACE,OPTIONS");
			response.addHeader("Access-Control-Allow-Headers", "Content-Type,Origin,Accept");
			response.addHeader("Access-Control-Max-Age", "120");
		}
		// 为true的时候放行
		return true;
	}
}