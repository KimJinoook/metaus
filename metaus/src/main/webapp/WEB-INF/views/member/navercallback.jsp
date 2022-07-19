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
		clientId: "hP_hkEdQKOSZIWk68Pgk", // 본인걸로 수정, 띄어쓰기 금지.
		callbackUrl: "http://192.168.0.66:9091/login/naverlogin", // 아무거나 설정
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