package com.example.web.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.example.web.filter.MyFilter1;
import com.example.web.filter.MyFilter2;

@Configuration
public class FilterConfig {
	
//	@Bean
//	public FilterRegistrationBean<MyFilter1> filter1(){
//		FilterRegistrationBean<MyFilter1> bean = new FilterRegistrationBean<>(new MyFilter1());
//		bean.addUrlPatterns("/*");
//		bean.setOrder(0); // 번호가 낮을수록 필터가 빨리실행 << filter의 doFilter가 실행된다.
//		return bean;
//	}
//	
//	@Bean
//	public FilterRegistrationBean<MyFilter2> filter2(){
//		FilterRegistrationBean<MyFilter2> bean = new FilterRegistrationBean<>(new MyFilter2());
//		bean.addUrlPatterns("/*");
//		bean.setOrder(1); // 번호가 낮을수록 필터가 빨리실행 << filter의 doFilter가 실행된다.
//		return bean;
//	}
//	
//	
}