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

<!-- ===== Start of Login - Register Section ===== -->
<section class="ptb80" id="login">
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-xs-12">

			<!-- Start of Login Box -->
			<div class="login-box">

				<div class="login-title">
					<h4>메타어스 계정 확인</h4>
				</div>

				<!-- Start of Login Form -->
				<form method="post"
					action="<c:url value='/member/${socialType}Merge'/>"
					id="frm-social-merge">
					<!-- Form Group -->
					<div class="form-group">
						<label>Email</label> <input type="email" class="form-control"
							name="memId" id="memId" placeholder="Your Email"
							value="${memId }" readonly="readonly"
							style="background-color: white"> <input type="hidden"
							name="socialEmail" value="${socialEmail }"> <input
							type="hidden" name="socialName" value="${socialName }"> <input
							type="hidden" name="socialType" value="${socialType }">
					</div>


					<!-- Form Group -->
					<div class="form-group">
						<label>Password</label> <input type="password" name="memPw"
							id="memPw" class="form-control" placeholder="Your Password">
					</div>

					<!-- Form Group -->
					<div class="form-group">
						<div class="row">
							<div class="col-xs-6"></div>

							<div class="col-xs-6 text-right">
								<a href="lost-password.html">비밀번호를 잊으셨나요?</a>
							</div>
						</div>
					</div>

					<!-- Form Group -->
					<div class="form-group text-center">
						<button id="socialMerge" type="button"
							class="btn btn-blue btn-effect">연동하기</button>
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
		/** 일반회원 유효성검사*/
		$('#socialMerge').click(function() {
			var id = $('#memId').val();
			var pw = $('#memPw').val();
			if ($.trim($('#memPw').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#memPw').focus();
				event.preventDefault();

			}else{
				$.ajax({
					url: "<c:url value='/login/ajaxLoginCheck'/>"+"?memId="+id+"&memPw="+pw,
					type:"get",
					async:false,
					success:function(data){
						if(data==1){
							document.querySelector('#frm-social-merge').submit();
						}else if(data==2){
							alert('비밀번호가 일치하지 않습니다');
						}else{
							alert('비밀번호 확인이 실패했습니다.');
						}
					}
				});
			}
			
		});
	});
</script>

<%@ include file="../inc/footer.jsp"%>