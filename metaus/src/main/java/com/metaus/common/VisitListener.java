package com.metaus.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebListener
public class VisitListener implements HttpSessionListener {
	private static final Logger logger = LoggerFactory.getLogger(VisitListener.class);
	
	static private int activeSession = 0;

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
	};
	
	
}
