# 관리자페이지 - 로그인 관련 주요 기능

![관리자페이지](https://user-images.githubusercontent.com/99188096/180388870-4718f022-f9a6-495c-8f9b-2c73e947adfb.PNG)   


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

***

## 2. 총 방문자 수
- 새로운 세션이 방문할 때 방문자수 테이블에 데이터 입력
- 모델 1의 경우 헤더의 스크립트릿에서 session.isnew() 메서드를 이용하여 새로운 세션인지 판별 후 디비 입력이 가능했었다.
- 스프링의 경우 web.xml에서 설정이 가능했었다.
- 스프링 부트의 경우 WebListener 어노테이션을 이용, 애플리케이션이 실행될 때 해당 listener 클래스를 적용한다
	- 스프링부트가 매퍼를 연결해주기 전 실행되기 때문에 DB연결을 직접 해준다   

```java
package com.metaus.common;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;

import javax.crypto.Cipher;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebListener
public class VisitListener implements HttpSessionListener {
	private static final Logger logger = LoggerFactory.getLogger(VisitListener.class);
	
	static private int activeSession = 0;
	static public HashMap<String, String> managerMap = new HashMap<String,String>();

	public static int getActiveSessions() {
		return activeSession;
	}
	
	public void sessionCreated(HttpSessionEvent e) {
		
		activeSession++;
		logger.info("create sessionId={}",e.getSession().getId());
		int insertVisit = insertVisit();
		logger.info("insertVisit={}",insertVisit);
		
	}
	public void sessionDestroyed(HttpSessionEvent e) {
		activeSession--;
		logger.info("destroy sessionId={}",e.getSession().getId());
		VisitListener.managerMap.remove((String)e.getSession().getAttribute("managerId"));
	}
	
	public int insertVisit() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//Context ctx;
		int cnt = 0;
		
		Connection con;
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "javauser";
			String pwd = "javauser123";
			con = DriverManager.getConnection(url,user,pwd);
			System.out.println("db연결 여부 con = "+con);
			PreparedStatement ps = null;
			try {
				String sql = "insert into fp_visit values(fp_visit_seq.nextval,sysdate)";
				
				ps = con.prepareStatement(sql);
				cnt = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				if(ps!=null)
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt;
	}
	

	
	
}

```
