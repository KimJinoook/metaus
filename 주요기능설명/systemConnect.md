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

### 클라이언트 비밀번호 암호화
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
