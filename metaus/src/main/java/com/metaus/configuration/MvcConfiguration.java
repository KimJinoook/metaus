package com.metaus.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.metaus.controller.AdminLoginInterceptor;
import com.metaus.controller.LoginInterceptor;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer{

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/resume/**","/request/post", "/lecture/**"
				 , "/mailbox/**", "/commission/**");
		
		registry.addInterceptor(new AdminLoginInterceptor())
		.excludePathPatterns("/admin/login/adminLogin","/admin/member/lostAccount","/admin/css/**","/admin/js/**","/admin/img/**","/admin/scss/**","/admin/vendor/**")
		.addPathPatterns("/admin/**");
		
		
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
			= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
		multipartResolver.setMaxUploadSizePerFile(1024 * 1024 * 1024); // 파일당 업로드 크기 제한 (2MB)
		return multipartResolver;
	}
	
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry
	          .addResourceHandler("/resources/**")
	          .addResourceLocations("/resources/");	
	    }

}
