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
				<h2>사용자 계정 찾기</h2>
			</div>
		</div>

		<!-- End of Breadcrumb -->

	</div>
</section>

<!-- ===== Start of Login - Register Section ===== -->
<section class="ptb80" id="login">
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-xs-12">

			<!-- Start of Login Box -->
			<div class="login-box">

				<div class="login-title">
					<h4>비밀번호 재설정</h4>
				</div>

				<!-- Start of Login Form -->
				<form method="post"
					action="<c:url value='/company/updatePw'/>"
					id="frm-pw-update">
					<!-- Form Group -->
					<div class="form-group">
						<label>비밀번호</label> 
						<input type="password" class="form-control"
							name="comPw" id="comPw"> 
						<input type="hidden" name="comId" value="${comId }">  
					</div>


					<!-- Form Group -->
					<div class="form-group">
						<label>비밀번호 확인</label> 
						<label id="comPwCheckLb"></label> 
						<input type="password" name="memPw"
							id="comPwCheck" class="form-control">
					</div>


					<!-- Form Group -->
					<div class="form-group text-center">
						<button type="submit"
							class="btn btn-blue btn-effect">변경하기</button>
					</div>

				</form>
				<!-- End of Login Form -->
			</div>
			<!-- End of Login Box -->

		</div>
	</div>
</section>
<!-- ===== End of Login - Register Section ===== -->
<script type="text/javascript"
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#frm-pw-update').submit(function(){
			if ($.trim($('#comPw').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#comPw').focus();
				event.preventDefault();

			} else if ($.trim($('#comPw').val()) != $.trim($('#comPwCheck').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#comPwCheck').focus();
				event.preventDefault();
						
			}
		});
		
		
		/**기업회원 비밀번호 확인*/
		$('#comPwCheck').keyup(function(){
			if($.trim($('#comPw').val()) != $.trim($('#comPwCheck').val())){
				$('#comPwCheckLb').html("&nbsp;&nbsp;[비밀번호 불일치]");
				$('#comPwCheckLb').css("color","red");
			}else{
				$('#comPwCheckLb').html("&nbsp;&nbsp;[비밀번호 일치]");
				$('#comPwCheckLb').css("color","green");
				
			}
		});
	});
</script>

<%@ include file="../inc/footer.jsp"%>