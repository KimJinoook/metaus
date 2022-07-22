# 메세지 기능
- 1. 새로운 메세지 배지 알림
- 2. 메세지 작성 다중파일 업로드

***

## 1. 새로운 메세지 배지 알림   
![로그인](https://user-images.githubusercontent.com/99188096/180413640-ea92b3d9-ae5a-4049-af39-a43864390270.PNG)   

- 페이지 이동시마다 신규 메세지 여부 확인 필요
- 로그인 인터셉터에서 신규메세지 검색 처리   


```java
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

```

***

## 2. 메세지 다중파일 업로드   

- 컨트롤러에서의 처리   
```java
@RequestMapping("/sendMail")
	public String sendMail(@ModelAttribute MailboxVO vo, @RequestParam(defaultValue = "temporary") String msgaddAdsee
			,@RequestParam(defaultValue = "0") int msgaddNo
			,@RequestParam(defaultValue = "N") String temporaryFlag , HttpServletRequest request, HttpSession session){
		//임시저장 메세지 전송 처리
		/*Map<String, ?> flashMap =RequestContextUtils.getInputFlashMap(request);
		
		if(flashMap!=null) {
			MailboxVO mailboxVo = (MailboxVO) flashMap.get("mailboxVo");
			String msgaddAdsee2 = (String) flashMap.get("msgaddAdsee");
			logger.info("임시저장 메세지 전송 파라미터, mailboxVo={}, msgaddAdsee2={}", mailboxVo, msgaddAdsee2);
			
			msgaddAdsee = msgaddAdsee2;
			vo = mailboxVo;
		}*/
		
		int cnt=mailboxService.delTemporaryMail(msgaddNo);
		logger.info("임시저장 메세지 삭제 결과, cnt={}", cnt);
		
		//새 메세지 전송 처리
		String memId=(String) session.getAttribute("managerId");
		logger.info("memId={}", memId);
		vo.setMsgaddAdser(memId);
		
		logger.info("메세지 전송 처리, 파라미터 vo={}, msgaddAdsee={}, temporaryFlag={}", vo, msgaddAdsee, temporaryFlag);
		
		int cnt1=mailboxService.insertMailbox(vo);
		logger.info("메세지 등록 결과 cnt={}", cnt1);
		
		//수신자 셋팅
		RecipientVO recipientVo = new RecipientVO();
		recipientVo.setMsgaddAdsee(msgaddAdsee);
		recipientVo.setTemporaryFlag(temporaryFlag);
		logger.info("수신자 셋팅 결과 recipientVo={}", recipientVo);
		
		//수신자 번호 셋팅 - 등록한 쪽지 번호 셋팅
		int msgNo=mailboxService.selectMsgNo();
		recipientVo.setMsgNo(msgNo);
		logger.info("수신자 등록 처리 파라미터, recipientVo={}", recipientVo);
		
		int cnt2=mailboxService.insertRecipient(recipientVo);
		logger.info("수신자 등록 결과, cnt2={}", cnt2);
		
		//파일 업로드 처리
		String fileName="", originalFileName="";
		long fileSize=0;
		try {
			List<Map<String, Object>> list
				=fileUploadUtil.multiFileUpload(request, ConstUtil.UPLOAD_MESSAGE_FLAG);
			logger.info("업로드된 파일 목록 list={}", list);
			
			for(Map<String, Object> fileMap : list) {
				//다중 파일 업로드 처리
				originalFileName=(String) fileMap.get("originalFileName");
				fileName=(String) fileMap.get("fileName");
				fileSize= (long) fileMap.get("fileSize");	
				
				logger.info("파일 업로드 성공, fileName={}, fileSize={}", fileName,	fileSize);
				
				MailboxAtcVO mailboxAtcVo = new MailboxAtcVO();
				mailboxAtcVo.setMsgNo(msgNo);
				mailboxAtcVo.setMfileFilename(fileName);
				mailboxAtcVo.setMfileOriginname(originalFileName);
				mailboxAtcVo.setMfileFilesize(fileSize);
				
				int cnt3=mailboxService.insertMailboxAtc(mailboxAtcVo);
				logger.info("메세지 첨부파일 처리 결과 cnt3={}", cnt3);

			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/mail/mailList";
	}
```

- FileUploadUtil의 메서드   

```java
package com.metaus.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
	private static final Logger logger
	=LoggerFactory.getLogger(FileUploadUtil.class);
	
	public List<Map<String, Object>> multiFileUpload(HttpServletRequest request,
			int uploadFlag) 
					throws IllegalStateException, IOException {
		MultipartHttpServletRequest multiRequest 
		= (MultipartHttpServletRequest)request;
		
		Map<String, List<MultipartFile>> fileMap=multiRequest.getMultiFileMap();
		logger.info("업로드할 파일 목록, fileMap={}", fileMap);
		
		//업로드 파일 정보 저장할 List 선언
		List<Map<String, Object>> list = new ArrayList<>();
		
		Iterator<String> keyIter=fileMap.keySet().iterator();
		while(keyIter.hasNext()) {
			String key=keyIter.next();
			List<MultipartFile> tempFileList = fileMap.get(key);
			//=> 업로드된 파일을 임시파일 형태로 제공
			
			if(!tempFileList.isEmpty()) {
				for(MultipartFile tempFile : tempFileList) {
					if(tempFile!=null && !tempFile.isEmpty()) {
						long fileSize=tempFile.getSize(); //파일 크기
						String oName = tempFile.getOriginalFilename(); //원래 파일명
						
						//변경된 파일이름 구하기
						String fileName = getUniqueFileName(oName);
						
						//파일 업로드 처리
						//업로드할 폴더 구하기
						String uploadPath 
						= getUploadPath(request, uploadFlag);
						File file = new File(uploadPath, fileName); 
						tempFile.transferTo(file);
						
						//업로드된 파일 정보 저장
						//[1] Map에 저장
						Map<String, Object> resultMap = new HashMap<>();
						resultMap.put("fileName", fileName);
						resultMap.put("fileSize", fileSize);
						resultMap.put("originalFileName", oName);
						
						//[2] 여러 개의 Map을 List에 저장
						list.add(resultMap);
					}
				}
			}//if
		}//while
		
		return list;
	}
	
	
	public String getUniqueFileName(String fileName) {
		//파일명이 중복될 경우 파일이름 변경하기
		//파일명에 현재시간(년월일시분초밀리초)을 붙여서 변경된 파일이름 구하기
		//a.txt => a_20220602113820123.txt

		//순수 파일명만 구하기 => a
		int idx = fileName.lastIndexOf(".");
		String fileNm = fileName.substring(0,idx);  //a

		//확장자 구하기
		String ext = fileName.substring(idx); // .txt

		//변경된 파일이름
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today = sdf.format(d);

		String result = fileNm + "_" + today + ext;
		logger.info("변경된 파일명 : {}", result);

		return result;
	}

	public String getUploadPath(HttpServletRequest request, int pathFlag) {
		//업로드 경로 구하기
		String path="";

		if(ConstUtil.FILE_UPLOAD_TYPE.equals("test")) {
			if(pathFlag==ConstUtil.UPLOAD_FILE_FLAG) {  //자료실
				path=ConstUtil.FILE_UPLOAD_PATH_TEST;
				
			}else if(pathFlag==ConstUtil.UPLOAD_MESSAGE_FLAG) {
				path=ConstUtil.ATTACHMENT_FILE_UPLOAD_PATH_TEST; //메세지 첨부파일
				
			}else if(pathFlag==ConstUtil.UPLOAD_MEMBER_PROFILE_FLAG) {
				path=ConstUtil.MEMBER_FILE_UPLOAD_PATH_TEST; //일반회원 프로필사진
				
			}else if(pathFlag==ConstUtil.UPLOAD_COMPANY_PROFILE_FLAG) {
				path=ConstUtil.COMPANY_FILE_UPLOAD_PATH_TEST; //기업회원 로고
				
			}else if(pathFlag==ConstUtil.UPLOAD_PORTFOLIO_FLAG) {
				path=ConstUtil.PORTFOLIO_FILE_UPLOAD_PATH_TEST; //포트폴리오 첨부파일
				
			}else if(pathFlag==ConstUtil.UPLOAD_RECRUIT_FLAG) {
				path=ConstUtil.RECRUIT_FILE_UPLOAD_PATH_TEST; //기업의뢰 첨부파일
				
			}else if(pathFlag==ConstUtil.UPLOAD_PRODUCT_FLAG) {
				path=ConstUtil.PRODUCT_FILE_UPLOAD_PATH_TEST; //상품모델링 첨부파일
				
			}else if(pathFlag==ConstUtil.UPLOAD_MANAGER_PROFILE_FLAG) {
				path=ConstUtil.MANAGER_FILE_UPLOAD_PATH_TEST; //상품모델링 첨부파일
				
			}
			
		}else {  //deploy
			if(pathFlag==ConstUtil.UPLOAD_FILE_FLAG) {  //자료실
				path=ConstUtil.FILE_UPLOAD_PATH;  //pds_upload
				
			}else if(pathFlag==ConstUtil.UPLOAD_MESSAGE_FLAG) {
				path=ConstUtil.ATTACHMENT_FILE_UPLOAD_PATH;  //message_attachment
				
			}else if(pathFlag==ConstUtil.UPLOAD_MEMBER_PROFILE_FLAG) {
				path=ConstUtil.MEMBER_FILE_UPLOAD_PATH; //일반회원 프로필사진
				
			}else if(pathFlag==ConstUtil.UPLOAD_COMPANY_PROFILE_FLAG) {
				path=ConstUtil.COMPANY_FILE_UPLOAD_PATH; //기업회원 로고
				
			}else if(pathFlag==ConstUtil.UPLOAD_PORTFOLIO_FLAG) {
				path=ConstUtil.PORTFOLIO_FILE_UPLOAD_PATH; //포트폴리오 첨부파일
				
			}else if(pathFlag==ConstUtil.UPLOAD_RECRUIT_FLAG) {
				path=ConstUtil.RECRUIT_FILE_UPLOAD_PATH; //기업의뢰 첨부파일
				
			}else if(pathFlag==ConstUtil.UPLOAD_PRODUCT_FLAG) {
				path=ConstUtil.PRODUCT_FILE_UPLOAD_PATH; //상품모델링 첨부파일
				
			}else if(pathFlag==ConstUtil.UPLOAD_MANAGER_PROFILE_FLAG) {
				path=ConstUtil.MANAGER_FILE_UPLOAD_PATH; //상품모델링 첨부파일
				
			}
			//실제 물리적인 경로 구하기
			path=request.getSession().getServletContext().getRealPath(path);
		}

		logger.info("업로드 경로:{}", path);

		return path;
	}



}
```

***

