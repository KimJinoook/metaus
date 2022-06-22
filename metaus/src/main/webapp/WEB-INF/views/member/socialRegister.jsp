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
