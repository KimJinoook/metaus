# 시스템 접속 관련 주요기능

- 1. 비밀번호 암호화
- 2. 이메일 인증
- 3. 소셜 로그인 (카카오)
- 4. 소셜로그인 후처리 (로그인 혹은 연동, 회원가입)

***

# 1. 비밀번호 암호화
 - 생각할 점
  - 클라이언트에서 서버로 비밀번호를 전송할 때 암호화하여 전송
    - 비밀번호가 전송될 때 해커의 공격으로 가로채기당할 위험성이 있으며, 가장 취약한 타이밍이기 때문
    - 자바스크립트에서 비밀번호를 암호화한 후 컨트롤러로 전송
    - 개인키를 가진 사람만 복호화가 가능
  - DB에 비밀번호를 저장하지 않고, 암호화된 키를 저장
    - 사용자가 항상 같은 비밀번호를 입력했을 때, DB에 저장된 암호키와 매칭이 가능해야 한다


- 웹 리스너와 java.security 패키지 이용, 세션이 새로 생성될때 매번 새로운 공개키와 개인키를 생성한다   

```java
@WebListener
public class VisitListener implements HttpSessionListener {
	private static final Logger logger = LoggerFactory.getLogger(VisitListener.class);
	
	public void sessionCreated(HttpSessionEvent e) {
		logger.info("create sessionId={}",e.getSession().getId());
		
		KeyPairGenerator generator;
		try {
			generator = KeyPairGenerator.getInstance("RSA");
			
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
			HttpSession session = e.getSession();
			
			// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
			session.setAttribute("__rsaPrivateKey__", privateKey);
			
			// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			session.setAttribute("publicKeyModulus", publicKeyModulus);
			session.setAttribute("publicKeyExponent", publicKeyExponent);
			logger.info(publicKeyModulus);
			logger.info(publicKeyExponent);
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (InvalidKeySpecException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
		public static String decryptRsa(PrivateKey pk, String val) throws Exception{
		Cipher cipher = Cipher.getInstance("RSA");
		byte[] encryptedBytes = hexToByteArray(val);
		cipher.init(Cipher.DECRYPT_MODE, pk);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		String decryptedValue = new String(decryptedBytes,"utf-8");
		return decryptedValue;
	}
	
	public static  byte[] hexToByteArray(String hex) {
		if(hex == null || hex.length() % 2 != 0) {
			return new byte[] {};
			
		}
		byte[] bytes = new byte[hex.length()/2];
		for(int i=0; i<hex.length(); i+=2) {
			byte value = (byte)Integer.parseInt(hex.substring(i,i+2),16);
			bytes[(int)Math.floor(i/2)] = value;
		}
		return bytes;
	}
}
```

- 자바스크립트에서 공개키를 이용하여, 서버로 전송하기 전 비밀번호를 암호화한다   

```javascript
<!-- 세션에 저장된 공개키 -->
<input type="hidden" id="publicKeyModule" value="${sessionScope.publicKeyModulus }">
<input type="hidden" id="publicKeyExponent" value="${sessionScope.publicKeyExponent }">


<!-- jsbn라이브러리와 공개키를 이용, 비밀번호 암호화 -->
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rsa.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/prng4.js"></script>        
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rng.js"></script>
<script>
$(function(){
	$('#memLoginBtn').click(function(){
		var inputText = $('#memPw').val();
		
		var rsaPkModule = $('#publicKeyModule').val();
		var rsaPkExponent = $('#publicKeyExponent').val();
		
		var rsa = new RSAKey();
		rsa.setPublic(rsaPkModule,rsaPkExponent);
		
		var securedPw = rsa.encrypt(inputText);
		$('#memPw').val(securedPw);
		$('#memloginfrm').submit();
	});
	$('#comLoginBtn').click(function(){
		var inputText = $('#signup-password').val();
		
		var rsaPkModule = $('#publicKeyModule').val();
		var rsaPkExponent = $('#publicKeyExponent').val();
		
		var rsa = new RSAKey();
		rsa.setPublic(rsaPkModule,rsaPkExponent);
		
		var securedPw = rsa.encrypt(inputText);
		$('#signup-password').val(securedPw);
		$('#comloginfrm').submit();
	});
});
</script>
```

- 컨트롤러에서 암호화된 비밀번호를 받아 개인키를 이용하여 복호화   
- 복호화한 비밀번호를 db에 저장하기 위한 암호키로 암호화
	- 스프링 시큐리티의 BCrypt 이용

```java
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final MemberService memberService;
	private final KakaoService kakaoService;
	private final NaverService naverService;
	private final FacebookService facebookService;
	
	@PostMapping("/memberRegister")
	public String memregister_post(@ModelAttribute MemberVO vo, Model model, HttpSession session) {
		logger.info("일반회원 회원가입 처리, 파라미터 vo={}", vo);
		
		//개인키 확인
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		try {
			
			//개인키를 이용하여 암호호화된 비밀번호 복호화
			String password = VisitListener.decryptRsa(privateKey, vo.getMemPw());
			vo.setMemPw(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//db에 저장하기 위한 비밀번호 암호화, BCrypt 이용
		BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
		String memLock=encoder.encode(vo.getMemPw());
		vo.setMemLock(memLock);
		
		logger.info("회원가입 전 vo={}", vo);
		int cnt=memberService.insertMember(vo);
		logger.info("회원가입 결과, cnt={}", cnt);

		String msg="회원가입 실패", url="/member/register";
		if(cnt>0) {
			msg="회원가입되었습니다.";
			url="/";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "/common/message";
		
	}
}
```

- 로그인 시 db 비밀번호 암호키와, 사용자 입력 비밀번호 일치여부 확인   

```java
public class MemberServiceImpl implements MemberService {
	
	private final MemberDAO memberDao;
	
	public int insertMember(MemberVO vo){
		int cnt=memberDao.insertMember(vo);
		return cnt;
	}
	
	public int checkLogin(String userid, String pwd) {
		String dbPwd = memberDao.selectPwd(userid);
		String dbLock = memberDao.selectLock(userid);
		BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
		
		
		int result=0;
		if(dbPwd !=null && !dbPwd.isEmpty()) {
			
			//BCrypt의 matches 메서드를 이용, db에 저장된 암호키와 사용자 입력 비밀번호 일치여부 
			if(encoder.matches(pwd, dbLock)) {
				result=MemberService.LOGIN_OK;
			}else {
				result=MemberService.DISAGREE_PWD;				
			}
			

		}else {
			result=MemberService.NONE_USERID;
		}
		
		return result;
	}
}
```

***

# 2. 이메일 인증
- 일반회원 회원가입 시 아이디 중복확인과 동시에 이메일 인증
- Ajax 처리
	- 사용가능한 이메일일 경우 난수 발생 및 인증번호 발송과 동시에 3분 타이머 적용, 3분 후 인증번호 초기화   


- 회원가입 view의 javascript

```javascript
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	var timer = null;
	var isRunning = false;
	
	$(function() {
		/** 일반회원 유효성검사*/
		$('#btnMemSign').click(function() {
			 
			
			if ($('#ismailcodeCheck').val() != 'Y'){
				alert("이메일 인증이 필요합니다.");
				event.preventDefault();
				
			} else if ($.trim($('#mailcode').val()) != $.trim($('#mailcodeCheck').val())) {
				alert("이메일 인증번호가 일치하지 않습니다");
				$('#mailcode').focus();
				event.preventDefault();
			
			} else if ($.trim($('#memPw').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#memPw').focus();
				event.preventDefault();
			} else if ($.trim($('#memPw').val()) != $.trim($('#memPwCheck').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#memPwCheck').focus();
				event.preventDefault();
						
			} else if ($.trim($('#memName').val())=="") {
				alert("이름을 입력해주세요.");
				$('#memName').focus();
				event.preventDefault();
						
			}else if(!validate_birth($('#memBirth').val())){
				alert("생년월일은 숫자만 입력해주세요.");
				$('#memBirth').focus();
				event.preventDefault();
			}else if(!validate_tel($('#memTel').val())){
				alert("휴대전화는 숫자만 입력해주세요.");
				$('#memTel').focus();
				event.preventDefault();
			}else{
				var inputText = $('#memPw').val();
				
				var rsaPkModule = $('#publicKeyModule').val();
				var rsaPkExponent = $('#publicKeyExponent').val();
				
				var rsa = new RSAKey();
				rsa.setPublic(rsaPkModule,rsaPkExponent);
				
				var securedPw = rsa.encrypt(inputText);
				$('#memPw').val(securedPw);
				$('#registerFrm').submit();
			} 
		});
		
		
		/** 일반회원 이메일 인증 */
		$('#sendEmail').click(function(){
			$('#ismailcodeCheck').val('Y');
			var id = $('#memId').val();
			var num = Math.floor(Math.random() * 10000)+1;
			var datas = {"id":id,"num":num};
			var getdata;
			
			if(!validate_email(id)){
				alert("이메일 형식이 올바르지 않습니다.");
				$('#memId').focus();
				event.preventDefault();
			}else{
				$.ajax({
					url: "<c:url value='/email/signEmail'/>"+"?receiver="+id+"&num="+num,
					type:"get",
					async:false,
					success:function(data){
						if(data==1){
							alert('해당 이메일로 인증번호가 발송되었습니다.');
							$('#mailcodeCheck').val(num);
							
							var display = $('#emailCnt');
					    	var leftSec = 180;
					    	// 남은 시간
					    	// 이미 타이머가 작동중이면 중지
					    	if (isRunning){
					    		clearInterval(timer);
					    		display.html("");
					    		$('#emailCnt').css("color","red");
					    		startTimer(leftSec, display);
					    	}else{
					    		startTimer(leftSec, display);
					    		
					    	}
						}else if(data==2){
							alert('이미 사용중인 이메일 계정입니다.');
						}else{
							alert('인증번호 발송이 실패했습니다.');
						}
					}
				});
				event.preventDefault();			
			}
		});
		
		/**일반회원 인증번호 입력*/
		$('#mailcode').keyup(function(){
			if($.trim($('#mailcode').val()) == $.trim($('#mailcodeCheck').val())){
				clearInterval(timer);
				$('#emailCnt').html("&nbsp;&nbsp;[인증번호 일치]");
				$('#emailCnt').css("color","green");
			}
		});
		
	
	});
	function validate_userid(id) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);		
	}
	function validate_tel(tel) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
	function validate_birth(birth) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(birth);
	}
	function validate_email(email) {
		var pattern = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		return pattern.test(email);
	}
	
	function startTimer(count, display) {
	
		var minutes, seconds;
        timer = setInterval(function () {
	        minutes = parseInt(count / 60, 10);
	        seconds = parseInt(count % 60, 10);
	 
	        minutes = minutes < 10 ? "0" + minutes : minutes;
	        seconds = seconds < 10 ? "0" + seconds : seconds;
	 
	        display.html("&nbsp;&nbsp;("+minutes + ":" + seconds+")");
	 
	        // 타이머 끝
	        if (--count < 0) {
		    	clearInterval(timer);
		    	display.html("&nbsp;&nbsp;시간초과");
		    	isRunning = false;
		    	$('#mailcodeCheck').val("");
	        }
	    }, 1000);
	         isRunning = true;
	}

</script>

```

- 컨트롤러   

```java
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	private final EmailSender emailSender;
	private final MemberService memberService;
	
	
	@ResponseBody
	@RequestMapping("/signEmail")
	public int sendEmail(String receiver, String num) {
		
		int echeck=0;
		int result=0;
		if(receiver!=null && !receiver.isEmpty()) {
				echeck=memberService.duplicateId(receiver);
			
			logger.info("이메일 중복확인 결과, echeck={}", echeck);
		}
	
		if(echeck==MemberService.UNUSABLE_ID) {
			result = MemberService.UNUSABLE_ID;
			return result;
		}else if(echeck==MemberService.USABLE_ID) {
			String subject="메타어스 회원가입 이메일 인증번호 발송";
			String content = "인증번호 : "+num;
			String sender = "kimjin0132@naver.com";
			
			try {
				emailSender.sendEmail(subject, content, receiver, sender);
				logger.info("이메일발송");
				result = MemberService.USABLE_ID;
				return result;
			} catch (MessagingException e) {
				e.printStackTrace();
				logger.info("이메일실패");
			}
		}
		
		
		return result;
	}
}
```

***



# 5. 소셜 로그인

## 1. 카카오 로그인
- 팝업방식과 모달방식 중 팝업방식 이용
- 카카오 로그인 api 호출 후 카카오 연결 성공 시 회원정보 추출
- 추출한 회원정보를 hidden form에 입력 후 form submit

```javascript
<form id="form-kakao-login" method="post"
	action="<c:url value='/login/kakaologin'/>">
	<input type="hidden" name="kakaoEmail" /> 
	<input type="hidden" name="kakaoName" />
</form>

<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	function loginFormWithKakao(){
		Kakao.init('카카오javascript키');
		Kakao.Auth.login({
	        success: function(authObj) {
	         
	          Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(res) {
	              console.log(res);
	              var id = res.id;
	              var account = res.kakao_account;
		      
		      //카카오 연결 성공 시 폼에 로그인정보를 담은 후 제출
	              $('#form-kakao-login input[name=kakaoEmail]').val(account.email);
	              $('#form-kakao-login input[name=kakaoName]').val(account.profile.nickname);
			document.querySelector('#form-kakao-login').submit();
			
	              
	        }
	          })
	          console.log(authObj);
	          var token = authObj.access_token;
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	};
</script>

```



## 4. 로그아웃의 경우
- 로그인시 세션에 로그인 타입을 저장, 로그아웃 시 로그인 타입에 따라 서로 다른 로그아웃 처리
- 카카오의 로그아웃
	- 카카오의 로그아웃은 카카오 연결해제 (logout), 카카오 - 앱 서비스 탈퇴 (unlink) 두가지 중 unlink 이용
- 네이버의 로그아웃
	- 네이버는 정책적으로, 다른 홈페이지에서 네이버 로그아웃을 금지하여 따로 네이버 로그아웃처리 하지않고, 홈페이지만 로그아웃 처리

```javascript
<script>
$(function(){
	
	$('#logoutBtn').click(function(){
		var loginType = '${sessionScope.isLogin}';
		if(loginType=='kakao'){
			Kakao.init('48fd685b6c1070cc71f894be6653d843');
			if (Kakao.Auth.getAccessToken()) {
			      Kakao.API.request({
			    	  
			        url: '/v1/user/unlink',
			        success: function(response) {
			        	console.log(response);
			        	console.log('성공');
			        	Kakao.Auth.setAccessToken(undefined);
						location.href="<c:url value='/login/logout'/>";
			        },
			        fail: function(error) {
			          console.log(error);
			        }
			      });
		    }
		}else if(loginType=='naver'){
			location.href="<c:url value='/login/logout'/>";
		}else if(loginType=='facebook'){
	
		        FB.login(function(response) {
		            if (response.status === 'connected') {
		                FB.logout(function(response) {
		                		location.href="<c:url value='/login/logout'/>";
		                    });
		                }
		     
		        });
		}else{
			location.href="<c:url value='/login/logout'/>";
		}
	});
});
</script>
```


***

# 6. 소셜로그인 후처리

![연동](https://user-images.githubusercontent.com/99188096/180376059-6a9da1c5-78cc-4c3d-b441-14af1f52e252.PNG)


- 로그인한 소셜계정이 메타어스 계정과 연동되어있을 경우
	- 메타어스 계정으로 로그인
- 로그인한 소셜계정이 메타어스 계정과 연동되어있지 않을 경우
	- 소셜계정과 동일한 id를 가진 메타어스 계정 검색
		- 있을 경우 연동여부 확인 및 연동
		- 없을 경우 회원가입 페이지 이동   


- 소셜 로그인 form 제출 후 컨트롤러   

```java
@RequestMapping("/kakaologin")
	public String kakaologin_post(@ModelAttribute KakaoVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		logger.info("카카오 로그인 처리, 파라미터 vo={}", vo);
		
		KakaoVO kakaoVo = kakaoService.selectByUserid(vo.getKakaoEmail());
		String kakaoId = vo.getKakaoEmail().substring(0, vo.getKakaoEmail().indexOf("@"));
		logger.info("kakaoId={}",kakaoId);
		
		String url = "/", msg="로그인 실패";
		
		if(kakaoVo != null) {
			//[1] session에 저장
			MemberVO memVo = memberService.selectByMemNo(kakaoVo.getMemNo());
			
			HttpSession session=request.getSession();
			session.setAttribute("isLogin", "kakao");
			session.setAttribute("memNo", memVo.getMemNo());
			session.setAttribute("memId", memVo.getMemId());
			session.setAttribute("memName", memVo.getMemName());
			
			msg = memVo.getMemName()+"님 환영합니다";
			
		}else if(kakaoVo == null) {
			MemberVO memVo = memberService.selectBySocialid(kakaoId);
			model.addAttribute("vo",memVo);
			model.addAttribute("socialEmail",vo.getKakaoEmail());
			model.addAttribute("socialName",vo.getKakaoName());
			model.addAttribute("socialType","kakao");
			msg = "연동된 계정이 없습니다";
			return "/member/socialRegister";
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
```

- 연동된 메타어스 계정이 없을 경우 연동 페이지

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>

<section class="page-header">
	<div class="container">

		<!-- Start of Page Title -->
		<div class="row">
			<div class="col-md-12">
				<h2>소셜계정 로그인</h2>
			</div>
		</div>
	
		<!-- End of Breadcrumb -->

	</div>
</section>



<!-- ===== Start of Main Wrapper Section ===== -->
<section class="ptb80" id="contact">
	<div class="container">
		<div class="row">
			<c:if test="${empty vo }">
			<div class="text-center">
				<!-- Form Group -->
				<div class="form-group">
					<h4 >연동된 계정이 존재하지 않습니다.</h4><br><br>
						
					<label for="agree2">메타어스와 소셜계정을 연동하시면 간편하게 로그인할 수 있습니다.
					<br>간단한 회원가입을 통해 메타어스와 함께하실 수 있습니다.</label> <br>
					<br>
				</div>
			</div>
			
			</c:if>
			<c:if test="${!empty vo }">
			<div class="text-center">
				<!-- Form Group -->
				<div class="form-group">
					<h4 >혹시 메타어스 계정이 있으신가요?</h4><br><br>
						
					<label for="agree2">회원님의 정보로 가입된 아이디가 있습니다.
					<br>기존 아이디와 연동하시면, 이력서 및 회원정보가 유지됩니다.</label> <br>
					<br>
				</div>
			</div>
			<form method="post" action="<c:url value='/member/socialMerge'/>">
				<div class="col-md-4 col-md-offset-3">
					<!-- Form Group -->
					<div class="form-group">
						<label></label> <input type="text" class="form-control"
							name="memId" value="${vo.memId }" readonly="readonly" style="background-color: white">
							<input type="hidden" name="socialEmail" value="${socialEmail}">
							<input type="hidden" name="socialName" value="${socialName}">
							<input type="hidden" name="socialType" value="${socialType}">
					</div>
				</div>

				<div class="col-md-2">
					<div class="form-group">
						<label> </label>
						<button type="submit" style="margin-top: 2px"
							class="btn btn-blue btn-effect form-control">연동하기</button>
					</div>
				</div>
			</form>
			</c:if>
			
			
			<div class="col-md-6 col-md-offset-3">
				<!-- Form Group -->
				<div class="form-group text-center nomargin">
					<br>
					<a href="<c:url value='/member/register'/>"><button type="button" class="btn btn-blue btn-effect">신규 회원가입</button></a>
				</div>

			</div>
		</div>

	</div>

</section>
<!-- ===== End of Main Wrapper Section ===== -->

<%@ include file="../inc/footer.jsp"%>
```
