package com.example.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Configuration
public class CorsConfig {
//
//	@Bean
//	public CorsFilter corsFilter() {
//		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
//		CorsConfiguration config = new CorsConfiguration(); 
//		config.setAllowCredentials(true);//서버에서 응답 시, json을 자바스크립트에서 처리할 수 있게 할 것인가?
//		config.addAllowedOrigin("*"); // 모든 ip의 응답을 허용
//		config.addAllowedHeader("*"); // 모든 header에 응답을 허용하겠다.
//		config.addAllowedMethod("*"); // 모든 post, get, put, delete, patch 요청을 허용하겠다.
//		source.registerCorsConfiguration("/api/**", config);
//		return new CorsFilter(source);
//	}
}