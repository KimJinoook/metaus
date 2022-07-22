# 시스템 접속 관련 주요기능

- 1. 비밀번호 암호화
- 2. 이메일 인증
- 3. 사업자등록번호 진위여부 확인
- 4. 다음 우편번호 api 및 위도경도 변환
- 5. 소셜 로그인 (카카오, 네이버, 페이스북)

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
	- 사용가능한 이메일일 경우 인증번호 발송과 동시에 3분 타이머 적용, 3분 후 인증번호 초기화   


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
