# 시스템 접속 관련 주요기능

- 1. 비밀번호 암호화
- 2. 이메일 인증
- 3. 사업자등록번호 진위여부 확인
- 4. 다음 우편번호 api 및 위도경도 변환
- 5. 소셜 로그인 (카카오, 네이버, 페이스북)
- 6. 소셜로그인 후처리 (로그인 혹은 연동, 회원가입)

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

# 3. 사업자 등록번호 진위여부 확인

- 기업회원의 경우 사업자 등록번호 진위여부 확인
- 공공데이터 포털 api 이용
- 필수 전송데이터 : 대표자명, 사업자 등록번호, 개업일   

```javascript
/** 기업회원 사업자 등록번호 확인 */
		$('#comRrnCheck').click(function(){
			
			if ($.trim($('#comCeo').val()).length < 1) {
				alert("대표자명을 입력해주세요.");
				$('#comCeo').focus();
				event.preventDefault();
			}else if ($.trim($('#comRrn').val()).length < 1) {
				alert("사업자 등록번호를 입력해주세요.");
				$('#comRrn').focus();
				event.preventDefault();
			}else if ($.trim($('#comOpen').val()).length < 1) {
				alert("개업일 입력해주세요.");
				$('#comOpen').focus();
				event.preventDefault();
			}else if(!validate_tel($('#comRrn').val())){
				alert("사업자 등록번호는 숫자만 입력해주세요.");
				$('#comRrn').focus();
				event.preventDefault();				
			}else if(!validate_tel($('#comOpen').val())){
				alert("개업일 숫자만 입력해주세요.");
				$('#comOpen').focus();
				event.preventDefault();				
			}  else{
				var name = $('#comCeo').val();
				var open = $('#comOpen').val();
				
				var rrn = $('#comRrn').val();
				
				var data2 = {
						"businesses": [
						    {
						      "b_no": rrn,
						      "start_dt": open,
						      "p_nm": name
						    }
						  ]
				}
				$.ajax({
					url: "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=aKSHxC3JN3xtPxQP64ysM2CE9UhYKMLXVKM9w7aL7WiHH6dYWKgG%2FJaYTvF0O82Dawkq6c%2ByK0ByxSovTdkXHw%3D%3D",
					type:"POST",
					data: JSON.stringify(data2),
					dataType: "JSON",
					contentType: "application/json",
					
					async:false,
					success: function(result) {
					      if(result.data[0].valid=='02'){
					    	  alert('사업자 정보가 일치하지 않습니다.');
					      }else if(result.data[0].valid=='01'){
					    	  alert('사업자 정보가 확인되었습니다');
					    	  $('#isComRrnCheck').val('Y');
					      }
					  },
					  error: function(result) {
					      alert('사업자 정보 확인에 실패했습니다.');
					  }
				});
				event.preventDefault();	
			}
			
					
			
		});
```


***

# 4. 다음 우편번호 api 위도경도 변환 
- 회원가입 시 주소 입력을 위해 다음 우편번호 api 이용
- 기업회원의 경우 추후 카카오 지도 위치 표시를 위해 해당 회사의 위도경도 필요
- 카카오 로컬api를 이용, 입력한 주소를 토대로 위치 검색 후 위도경도로 변환   

```javascript
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
	$(function() {
		/**기업회원 주소찾기*/
		$('#comAdd').click(function(){
			execDaumPostcode2();

		});
	}

	/** 기업회원 우편번호 찾기 */
	function execDaumPostcode2() {
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	              $("#comAdd").val(data.roadAddress);
	              mapsearch();
	            }
	        }).open();
	    });
	}
	
	/** 기업 주소 위도경도로 변환*/
	function mapsearch(){
		var address = $('#comAdd').val();
		var geocoder2 = new kakao.maps.services.Geocoder();
		geocoder2.addressSearch(address, function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        
		        $('#comLati').val(result[0].y);
		    	$('#comLongi').val(result[0].x);
		    } 
		});	
	}

</script>


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

## 2. 네이버 로그인
- 네이버 로그인의 경우 모달방식 이용, 콜백url 호출
- 네이버 로그인의 경우 api에서 자체적으로 버튼을 생성
	- 개인적으로 만든 버튼을 이용하고 싶은 경우
		- api에서 만든 버튼을 숨긴 후, 커스텀 버튼 클릭 시 해당 버튼이 클릭되는 메서드 생성
		- 커스텀 버튼은 네이버 정책에 맞도록 제작   

```javascript
<!-- 네이버 api에서 만든 로그인 버튼이 들어갈 div, display:none으로 보이지 않게 설정 -->
<div id="naverIdLogin" style="display: none"></div>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript">	

	// 커스텀 버튼 클릭 시 네이버 로그인 버튼 클릭 메서드
	function loginFormWithNaver(){
		var nl = document.getElementById("naverIdLogin").firstChild;
		nl.click();
	};
	
	var naverLogin = new naver.LoginWithNaverId({
		clientId: "클라이언트 아이디",
		callbackUrl: "http://도메인/metaus/login/navercallback",
		isPopup: false,
		loginButton:{color:'green',type:5,height:60}
	});
	naverLogin.init();
</script>
```

- 네이버 로그인 연결 성공 후 callback url의 jsp   
- 네이버 로그인 정보를 폼에 담아 submit   

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="form-naver-login" method="post" action="<c:url value='/login/naverlogin'/>">
	<input type="hidden" name="naverEmail"/>
	<input type="hidden" name="naverName"/>
</form>
<script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
	var naverLogin = new naver.LoginWithNaverId({
		clientId: "클라이언트 아이디", 
		callbackUrl: "http://도메인/login/naverlogin", 
		isPopup: false,
		callbackHandle: true
	});
	naverLogin.init();
	window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
	if (status) {
		var email = naverLogin.user.getEmail();
		var name = naverLogin.user.getName();
		  $('#form-naver-login input[name=naverEmail]').val(email);
          $('#form-naver-login input[name=naverName]').val(name);
		  document.querySelector('#form-naver-login').submit();
	} else {
		console.log("callback 처리에 실패하였습니다.");
	}
	});
});
</script>
</body>
</html>
```

## 3. 페이스북 로그인
- 페이스북 로그인은 현재 이용자가 페이스북에 로그인 되어있는지 status에 따라 결과를 응답
- 로그인 버튼 클릭 시 페이스북에 로그인 되어있지 않을 경우
	- 페이스북 로그인 창 팝업, 팝업창에서 페이스북 로그인
	- 팝업창에서 페이스북 로그인해도, 버튼 클릭 당시 비로그인 상태이기에 홈페이지 로그인 불가
		- 팝업창에서 로그인 후, 성공시 페이스북 로그인 함수를 재귀호출, 로그인상태 변환하여 처리   

```javascript
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=550605189855072"
	nonce="SiOBIhLG"></script>
<script>
	function loginFormWithFacebook(){
		
		function fnFbCustomLogin(){
			FB.login(function(response) {
			
				//현재 페이스북 연결상태인 경우, 폼에 정보를 담아 submit
				if (response.status === 'connected') {
					FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
						console.log(r);
						$('#form-facebook-login input[name=facebookEmail]').val(r.email);
			           		 $('#form-facebook-login input[name=facebookName]').val(r.name);
			            		document.querySelector('#form-facebook-login').submit();
					})
				} else if (response.status === 'not_authorized') {
					
					alert('앱에 로그인해야 이용가능한 기능입니다.');
					
				//페이스북 비연결 상태인 경우, 팝업창에서 로그인 후 페이스북로그인 함수 
				} else {
					
					fnFbCustomLogin();
				}
			}, {scope: 'public_profile,email'});
		}
		fnFbCustomLogin();
		window.fbAsyncInit = function() {
			FB.init({
				appId      : '550605189855072', // 내 앱 ID를 입력한다.
				cookie     : true,
				xfbml      : true,
				version    : 'v10.0'
			});
			FB.AppEvents.logPageView();   
		};
	};
</script>
```
