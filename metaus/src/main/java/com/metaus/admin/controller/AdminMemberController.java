package com.metaus.admin.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.metaus.admin.model.ManagerService;
import com.metaus.admin.model.ManagerVO;
import com.metaus.common.ConstUtil;
import com.metaus.common.FileUploadUtil;
import com.metaus.member.model.CompanyService;
import com.metaus.member.model.CompanyVO;
import com.metaus.member.model.MemberService;
import com.metaus.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/member")
@RequiredArgsConstructor
public class AdminMemberController {

	private static final Logger logger
	=LoggerFactory.getLogger(AdminMemberController.class);
	
	private final ManagerService managerService;
	private final MemberService memberService;
	private final CompanyService comService;
	private final FileUploadUtil fileUploadUtil;
	
	@RequestMapping("/memberList")
	public void memberList(@ModelAttribute MemberVO mvo,Model model) {
		logger.info("일반 회원 조회 페이지");
		
		List<MemberVO> list=memberService.selectAll();
		logger.info("list={}",list);
		model.addAttribute("list",list);
		
		Date today = new Date();
		model.addAttribute("today",today);
	}
	@RequestMapping("/cutmemberList")
	public void cutmemberList(@ModelAttribute MemberVO mvo,Model model) {
		logger.info("차단 회원 조회 페이지");
		
		List<MemberVO> list=memberService.selectAll();
		logger.info("list={}",list);
		model.addAttribute("list",list);
		
		Date today = new Date();
		model.addAttribute("today",today);
	}
	
	@RequestMapping("/comList")
	public void comList(Model model) {
		logger.info("기업 회원 조회 페이지");
		
		List<CompanyVO> list=comService.selectAll();
		model.addAttribute("list",list);
		
	}
	@RequestMapping("/comDetail")
	public void comDetail(@RequestParam(defaultValue = "0") int comNo,Model model) {
		logger.info("기업 회원 디테일 페이지 comNo={}",comNo);
		
		CompanyVO comVo = comService.selectByComNo(comNo);
		model.addAttribute("comVo",comVo);
		
	}
	
	@RequestMapping("/managerList")
	public void managerList(Model model) {
		logger.info("관리자 조회 페이지");
		
		List<ManagerVO> list=managerService.selectAll();
		model.addAttribute("list",list);
	}
	@GetMapping("/managerEdit")
	public void managerEdit_get(Model model, HttpSession session) {
		logger.info("관리자 조회 페이지");

		String userid = (String)session.getAttribute("managerId");
		ManagerVO managerVo = managerService.selectByUserid(userid);
		managerVo=managerService.selectBymanagerNo(managerVo.getManagerNo());
		model.addAttribute("managerVo",managerVo);
		
		
	}
	
	@PostMapping("/managerEdit")
	public String managerEdit_post(@ModelAttribute ManagerVO vo,HttpServletRequest request,Model model) {
		logger.info("관리자 수정 처리,파라미터 vo={}",vo);
		
		
		
		String fileName = "";		
		try {
			List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_MANAGER_PROFILE_FLAG);

			for (Map<String, Object> fileMap : fileList) {				
				fileName = (String) fileMap.get("fileName");
			}
			logger.info("파일 업로드 성공, fileName={}", fileName);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setManagerNo(vo.getManagerNo());
		vo.setManagerPic(fileName);
		int cnt=managerService.updatemanager(vo);
		String msg="실패",url="/admin/member/managerEdit";
		if(cnt>0) {
			msg="수정 성공";
			url="/admin/member/managerEdit";	
		}else {
			msg="수정 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "/common/message";
	}
	
	
	
	
	
	@GetMapping("/register")
	public void get_manager() {
		logger.info("관리자 등록 페이지");
	}
	
	@PostMapping("/managerList")
	public String post_manager(@ModelAttribute ManagerVO vo,Model model) {
	logger.info("관리자 등록 처리, 파라미터 vo={}", vo);
		
		int cnt=managerService.insertMember(vo);
		logger.info("관리자 등록 결과, cnt={}", cnt);

		String msg="관리자 등록 실패", url="admin/member/register";
		if(cnt>0) {
			msg="관리자가 등록 되었습니다.";
			url="/admin/member/managerList";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";
	}
	
	@ResponseBody
	@RequestMapping("managerIdCheck")
	public int comIdCheck(String id) {
		int result = 0;
		if(id!=null && !id.isEmpty()) {
			result=managerService.duplicateId(id);
		
			logger.info("아이디 중복확인 결과, result={}", result);
		}
		
		return result;
	}
	
	@GetMapping("/lostAccount")
	public void get_lostAccount() {
		logger.info("관리자 계정 찾기 페이지");
	}
	
	@ResponseBody
	@RequestMapping("/findId")
	public String findId(String managerName, String managerTel) {

		ManagerVO vo = new ManagerVO();
		vo.setManagerName(managerName);
		vo.setManagerTel(managerTel);
		logger.info("관리자 아이디 찾기 vo={}",vo);
		String result = "";
		String managerId = managerService.findId(vo);
		if(managerId!=null && !managerId.isEmpty()) {
			result=managerId;
		
			logger.info("아이디 중복확인 결과, result={}", result);
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/findPw")
	public int findPw(String managerName, String managerTel, String managerId) {

		ManagerVO vo = new ManagerVO();
		vo.setManagerName(managerName);
		vo.setManagerTel(managerTel);
		vo.setManagerId(managerId);
		logger.info("관리자 비밀번호 찾기 vo={}",vo);
		int result = 0;
		String managerPw = managerService.findPw(vo);
		if(managerPw!=null && !managerPw.isEmpty()) {
			result=1;
		
			logger.info("비밀번호 확인 결과, result={}", result);
		}
		
		return result;
	}
	
	@RequestMapping("/managerPwReset")
	public String managerPwReset(@ModelAttribute ManagerVO vo, Model model) {
		model.addAttribute("managerId",vo.getManagerId());
		return "/admin/member/managerPwReset";
	}
	
	@PostMapping("/updatePw")
	public String updatePw(@ModelAttribute ManagerVO vo, Model model) {
		logger.info("관리자 비밀번호 변경 처리, 파라미터 vo={}", vo);
		
		int cnt=managerService.updatePw(vo);
		logger.info("비밀번호 변경 결과, cnt={}", cnt);
		
		model.addAttribute("managerId",vo.getManagerId());
		String msg="비밀번호 변경 실패", url="/admin/member/managerPwReset";
		if(cnt>0) {
			msg="비밀번호 변경 성공";
			url="/admin/login/adminLogin";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";
		
	}
}
