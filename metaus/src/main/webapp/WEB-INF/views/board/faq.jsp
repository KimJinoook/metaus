<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>

<!-- ===== Start of FAQ Section ===== -->
<section class="ptb80" id="faq-page">
	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<!-- Start of First Row -->
				<div class="row">
					<div class="col-md-12 text-center">

						<!-- =============== Start of Page Header 1 Section =============== -->
						<section class="page-header" style="margin-top: 50px;">
							<div class="container">

								<!-- Start of Page Title -->
								<div class="row">
									<div class="col-md-12">
										<h2>faq</h2>
									</div>
								</div>
								<!-- End of Page Title -->

								<!-- Start of Breadcrumb -->
								<div class="row">
									<div class="col-md-12">
										<ul class="breadcrumb">
											<li><a href="<c:url value='/'/>">home</a></li>
											<li class="active">커뮤니티</li>
											<li class="active">공지사항 - FAQ</li>
										</ul>
									</div>
								</div>
								<!-- End of Breadcrumb -->

							</div>
						</section>
						<!-- =============== End of Page Header 1 Section =============== -->
						<input type="text" class="live-search-box form-control mt20"
							placeholder="여기에 질문을 입력해주세요">
					</div>
				</div>
				<!-- End of First Row -->

				<!-- Start of Second Row -->
				<div class="row mt40">
					<c:if test="${empty list }">
						<div class="col-md-12 topic">
							<!-- Question -->
							<div class="open">
								<h6 class="question"
									data-search-term="1. how does cloudify work?">준비 중 입니다.</h6>
								<i class="fa fa-angle-down hidden-xs"></i>
							</div>

							<!-- Answer -->
							<p class="answer" style="display: none;">이용에 불편을 드려서 죄송합니다.</p>
						</div>
					</c:if>
					<c:if test="${!empty list }">
						<c:set var="i" value="1"/>
						<c:forEach var="vo" items="${list }">
							
							<div class="col-md-12 topic">
								<!-- Question -->
								<div class="open">
									<h6 class="question"
										data-search-term="1. how does cloudify work?">${i}.
										${vo.boardTitle}</h6>
									<i class="fa fa-angle-down hidden-xs"></i>
								</div>
								<p class="answer" style="display: none;">${vo.boardContent.substring(vo.boardContent.indexOf('>')+1,vo.boardContent.indexOf('</p>'))}</p>

								<!-- Answer -->
							</div>
							<c:set var="i" value="${i+1 }" />
						</c:forEach>
					</c:if>

				</div>
				<!-- End of Second Row -->

			</div>
		</div>
	</div>
</section>
<!-- ===== End of FAQ Section ===== -->

<%@ include file="../inc/footer.jsp"%>