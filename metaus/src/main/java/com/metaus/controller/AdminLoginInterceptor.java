package com.metaus.controller;

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
//public class LoginInterceptor implements HandlerInterceptor{
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

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("postHandle() 실행! - 컨트롤러 실행 후");
		
		HttpSession session = request.getSession();
		String managerId = (String)session.getAttribute("managerId");
		logger.info("postHandle managerId={}",managerId);
		System.out.println(managerId);
		List<ManagerMailboxVO> list = searchMail(managerId);
		session.setAttribute("navMsg", list);
		session.setAttribute("managerMap", VisitListener.managerMap);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("afterCompletion() 실행! - 뷰 생성 후");
	}
	
	
	public List<ManagerMailboxVO> searchMail(String managerId) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		//Context ctx;
		
		Connection con;
		List<ManagerMailboxVO> list = new ArrayList<ManagerMailboxVO>();
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "javauser";
			String pwd = "javauser123";
			con = DriverManager.getConnection(url,user,pwd);
			System.out.println("db연결 여부 con = "+con);
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				String sql = "select A.*, B.*,(select manager_name from fp_manager C where A.msgadd_adser = C.manager_id) manager_name, (select manager_pic from fp_manager D where A.msgadd_adser = D.manager_id) manager_pic  from fp_msg A join fp_msgadd B on A.msg_no = B.msg_no where B.msgadd_adsee = ? and B.msgadd_date is null and B.temporary_flag = 'N'";
				
				ps = con.prepareStatement(sql);
				ps.setString(1, managerId);
				rs=ps.executeQuery();
				
				while(rs.next()) {
					ManagerMailboxVO vo = new ManagerMailboxVO();
					vo.setMsgNo(rs.getInt("msg_no"));
					vo.setMsgTitle(rs.getString("msg_title"));
					vo.setMsgaddAdser(rs.getString("msgadd_adser"));
					vo.setMsgContent(rs.getString("msg_content"));
					vo.setSendDate(rs.getTimestamp("send_date"));
					vo.setMsgaddNo(rs.getInt("msgadd_no"));
					vo.setMsgaddAdsee(rs.getString("msgadd_adsee"));
					vo.setMsgaddDate(rs.getTimestamp("msgadd_date"));
					vo.setManagerName(rs.getString("manager_name"));
					vo.setManagerPic(rs.getString("manager_pic"));
					list.add(vo);
					
					
				}
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
		
		return list;
	};
	
}
