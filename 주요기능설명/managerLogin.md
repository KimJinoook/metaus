# 관리자페이지 - 로그인 관련 주요 기능
  - 1. 로그인 인터셉터
  - 2. 총 방문자 수
  - 3. 현재 접속자 수
  - 4. 타 관리자 로그인 여부   

***

## 1. 로그인 인터셉터
- 관리자 페이지의 로그인화면을 제외하고는, 비로그인 시 접근 금지
- 이미지 등의 resource 파일 경로는 인터셉터에 걸리지 않도록 제외처리   

- 접근금지 경로 설정   

```java
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
		.excludePathPatterns("/admin/login/adminLogin","/admin/member/lostAccount","/admin/member/findId","/admin/member/managerPwReset","/admin/member/findPw","/admin/member/updatePw",
							"/admin/css/**","/admin/js/**","/admin/img/**","/admin/scss/**","/admin/vendor/**")
		.addPathPatterns("/admin/**");
		
		
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver 
			= new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		multipartResolver.setMaxUploadSizePerFile(1024 * 1024 * 1024); 
		return multipartResolver;
	}
	
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry
	          .addResourceHandler("/resources/**")
	          .addResourceLocations("/resources/");	
	    }

}

```

- 로그인 인터셉터 메서드   

```java
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.metaus.admin.model.ManagerMailboxVO;
import com.metaus.common.VisitListener;

@Component
public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger
	=LoggerFactory.getLogger(AdminLoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle() 실행!- 컨트롤러 실행 전");
		/*
		- 컨트롤러 수행이전에 먼저 수행되는 메서드
		- 클라이언트의 요청을 컨트롤러에 전달하기 전에 호출됨*/
		
		String isAdmin=(String) request.getSession().getAttribute("isAdmin");
		logger.info("isAdmin = {}", isAdmin);
		
		//로그인 안된 경우
		if(!("admin").equals(isAdmin)) {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인이 필요한 서비스입니다.');");
			out.print("location.href='"+request.getContextPath()
				+ "/admin/login/adminLogin';");			
			out.print("</script>");
			
			return false;
		}
		
		return true; //다음 컨트롤러가 수행됨
	}
}
```
