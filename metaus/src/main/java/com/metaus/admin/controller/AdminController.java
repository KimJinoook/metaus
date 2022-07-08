package com.metaus.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.metaus.admin.model.ManagerMailboxService;
import com.metaus.admin.model.ManagerService;
import com.metaus.admin.model.ManagerVO;
import com.metaus.common.VisitListener;
import com.metaus.common.VisitService;
import com.metaus.member.model.CompanyService;
import com.metaus.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	private static final Logger logger
	=LoggerFactory.getLogger(AdminController.class);
	
	private final ManagerService managerService;
	private final VisitService visitService;
	private final MemberService memberService;
	private final CompanyService companyService;
	private final ManagerMailboxService managerMailboxService;
	
	@RequestMapping("/")
	public String index(Model model) {
		int todayVisit = visitService.todayVisit();
		int totalVisit = visitService.totalVisit();
		
		
		
		Date d = new Date();
		System.out.println(d);
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String a = sdf.format(d);
		System.out.println(a);
		
		Calendar today = Calendar.getInstance();
		System.out.println(today.MONTH+"월 "+today.DATE+"일");
		d = today.getTime();
		
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<Integer> visitList = new ArrayList<Integer>();
		
		String days = sdf.format(d);
		System.out.println(days);
		list.add(days);
		int visit = visitService.selectVisitByDate(days);
		System.out.println(visit);
		visitList.add(visit);
		for(int i=0; i<6; i++) {
			today.add(Calendar.DATE, -1);
			d = today.getTime();
			days = sdf.format(d);
			System.out.println(today.get(Calendar.MONTH)+1+"-"+today.get(Calendar.DATE));
			list.add(days);
			visit = visitService.selectVisitByDate(days);
			visitList.add(visit);
		}
		System.out.println(list);
		
		int totalMem = memberService.getAllMemNoPort();
		int totalCre = memberService.getTotalRecord(null);
		int totalCom = companyService.selectAllCount();
		
		int a1=6;
		int a2=1;
		int a3 = a2*100/a1;
		System.out.println(a3);
		
		int totalRec = companyService.selectRecCount();
		int totalCon = companyService.selectConCount();
		int totalConNotEnd = companyService.selectConCountNotEnd();
		int totalConEnd = companyService.selectConCountEnd();
		
		int conRate = 0;
		int conEndRate = 0;
		if(totalRec>0) {
			conRate = totalCon*100/totalRec;
		}
		if(totalCon>0) {
			conEndRate = totalConEnd*100/totalCon;
		}
		
		String sumPayToday = memberService.sumPayToday();
		if(sumPayToday == null || sumPayToday.isEmpty()) {
			sumPayToday="0";
		}
		
		model.addAttribute("todayVisit",todayVisit);
		model.addAttribute("totalVisit",totalVisit);
		model.addAttribute("daysforvisit",list);
		model.addAttribute("visitfordays",visitList);
		model.addAttribute("curVisit",VisitListener.getActiveSessions());
		model.addAttribute("totalMem",totalMem);
		model.addAttribute("totalCre",totalCre);
		model.addAttribute("totalCom",totalCom);
		model.addAttribute("conRate",conRate);
		model.addAttribute("conEndRate",conEndRate);
		model.addAttribute("sumPayToday",sumPayToday);
		
		
		return "/admin/index";
	}
	
	@GetMapping("/login/adminLogin")
	public void adminLogin_get() {
		
	}
	
	@PostMapping("/login/adminLogin")
	public String adminLogin_post(@ModelAttribute ManagerVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		logger.info("로그인 처리, 파라미터 vo={}", vo);
		
		int result=managerService.checkLogin(vo.getManagerId(), vo.getManagerPwd());
		logger.info("로그인 처리 결과 result={}", result);
		
		String msg="로그인 처리 실패", url="/admin/login/adminLogin";
		if(result==MemberService.LOGIN_OK) {
			//회원정보 조회
			ManagerVO managerVo=managerService.selectByUserid(vo.getManagerId());
			logger.info("로그인 처리-회원정보 조회결과 memVo={}", managerVo);
			
			//[1] session에 저장
			HttpSession session=request.getSession();
			session.setAttribute("isAdmin", "admin");
			session.setAttribute("managerNo", managerVo.getManagerNo());
			session.setAttribute("managerId", vo.getManagerId());
			session.setAttribute("managerName", managerVo.getManagerName());
			session.setAttribute("managerPic", managerVo.getManagerPic());

			
			VisitListener.managerMap.put(vo.getManagerId(),"1");
			
			msg=managerVo.getManagerName() +"님 로그인되었습니다.";
			url="/admin/";
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_USERID) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	@RequestMapping("/login/adminLogout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");		

		VisitListener.managerMap.remove((String)session.getAttribute("managerId"));
		session.invalidate();
		

		return "redirect:/admin/login/adminLogin";
	}

}
