# 회원관리, 게시판 관리
  - 1. 일반회원 차단기능
  - 2. 기업회원 조회
  - 3. 메세지 전체 발송
  - 4. 신고 게시글 관리

***

## 1. 일반회원 차단 기능   

![일반회원](https://user-images.githubusercontent.com/99188096/180408019-9833c1b2-c322-4e9e-a34f-aff244e46ce4.PNG)   
- 차단회원의 경우 초록색 버튼 노출, 클릭시 차단 해제
- 비차단 회원의 경우 빨간색 버튼 노출, 클릭 시 경고수(일) 만큼 차단   

```java
  @RequestMapping("/memberLock")
	public String memberLock(@ModelAttribute MemberVO vo) {
		logger.info("일반회원 차단 vo={}",vo);
		
    //현재 일자
		Date date = new Date();
    
    //회원의 경고수를 일수로 변환
		long cutTime = (long)(vo.getMemWarncnt()*24*60*60*1000);		
    
    //현재일자로부터 경고수(일) 경과된 시간 계산
		Timestamp timestamp = new Timestamp(date.getTime()+cutTime);
		
		//회원의 차단일 세팅
		vo.setMemCutdate(timestamp);
		
		int cnt = memberService.lockMember(vo);
		logger.info("일반회원 차단 cnt={}",cnt);
		
		return "redirect:/admin/member/memberList";
	}
	

```


-차단 회원 접속시도시 로그인 차단   


![ㅊㅊ](https://user-images.githubusercontent.com/99188096/180408588-575285c0-4b2e-4054-992b-193255ee3a75.PNG)   


```java
@RequestMapping("/memberlogin")
	public String memlogin_post(@ModelAttribute MemberVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession session) {
		logger.info("로그인 처리, 파라미터 vo={}", vo);
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		try {
			String password = VisitListener.decryptRsa(privateKey, vo.getMemPw());
			vo.setMemPw(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("로그인 전 vo={}", vo);
		
		int result=memberService.checkLogin(vo.getMemId(), vo.getMemPw());
		logger.info("로그인 처리 결과 result={}", result);
		
		String msg="로그인 처리 실패", url="/";
		if(result==MemberService.LOGIN_OK) {
			//회원정보 조회
			MemberVO memVo=memberService.selectByUserid(vo.getMemId());
			logger.info("로그인 처리-회원정보 조회결과 memVo={}", memVo);
			
			if(memVo.getMemCutdate()!=null) {
				Timestamp cutdate = memVo.getMemCutdate();
				Date cutdate2 = new Date(cutdate.getTime());
				Date today = new Date();
				
				long gap = cutdate2.getTime()-today.getTime();
				System.out.println(gap);
				if(gap>0) {
					msg=cutdate+" 까지 이용이 차단된 계정입니다.";
					model.addAttribute("msg", msg);
					model.addAttribute("url", url);
					return "/common/message";
				}
				
			}
			
			//[1] session에 저장
			session.setAttribute("isLogin", "member");
			session.setAttribute("memNo", memVo.getMemNo());
			session.setAttribute("memId", vo.getMemId());
			session.setAttribute("memName", memVo.getMemName());
			
			msg=memVo.getMemName() +"님 로그인되었습니다.";
			url="/";
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_USERID) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
```

***

## 4. 신고 게시글 관리   

![신고게시글](https://user-images.githubusercontent.com/99188096/180407663-541a8767-0fbc-42ab-a484-3e7e36ff58ab.PNG)   

- 화살표 버튼 클릭시 해당 게시글로 이동
- 초록색 버튼 클릭시 해당 게시글 문제없음 판단, 신고 처리일자 입력
- 빨간색 버튼 클릭시 해당 게시글 문제있음 판단, 신고 처리일자 입력, 작성자 경고수 1 증가, 작성자 차단, 게시글 삭제 처리

