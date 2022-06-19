<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>
<!-- =============== Start of Page Header 1 Section =============== -->
<section class="page-header" style="margin-top: 150px;">
	<div class="container">

		<!-- Start of Page Title -->
		<div class="row">
			<div class="col-md-12">
				<h2>질문 게시판</h2>
			</div>
		</div>
		<!-- End of Page Title -->

		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">커뮤니티 - 질문 게시판</li>
				</ul>
			</div>
		</div>
		<!-- End of Breadcrumb -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->



<a href="/metaus/board/boardWrite?btypeNo=5">[글쓰기]</a>

<!-- ===== Start of Blog Listing Section ===== -->
<section class="blog-listing ptb80" id="version2" style="padding: 30px;">
	<div class="container">
		<div class="row">

			<!-- Start of Blog Posts -->
			<div class="col-md-12 col-xs-12 blog-posts-wrapper">
				<c:if test="${!empty list }">
					<!-- 반복 시작 -->
					<c:forEach var="map" items="${list }">
						<!-- Start of Blog Post Article 1 -->
						<article class="col-md-12 blog-post"
							style="margin-bottom: 5px; padding-bottom: 5px; height: 80px;">

							<!-- Blog Post Thumbnail -->
							<!-- Blog Post Description -->
							<div class="col-md-12 blog-desc" style="margin-top: 10px;">
								<h5>
									<a href="blog-post-right-sidebar.html">${map['BOARD_TITLE'] }</a>
								</h5>
								<div class="post-detail pt10 pb20">
									<span><i class="fa fa-user"></i>${map['MEM_NAME'] }</span> <span><i
										class="fa fa-clock-o"></i>${map['BOARD_REGDATE'] }</span> <span><i
										class="fa fa-comments-o"></i>${map['BOARD_READCOUNT'] }</span>
								</div>
							</div>
						</article>
						<!-- End of Blog Post Article 1 -->
					</c:forEach>
					<!-- 반복 종료 -->
				</c:if>

				<!-- Start of Pagination -->
				<div class="col-md-12">
					<ul class="pagination list-inline text-center">
						<li class="active"><a href="javascript:void(0)">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</div>
				<!-- End of Pagination -->

			</div>
			<!-- End of Blog Posts -->

		</div>
	</div>
</section>
<!-- ===== End of Blog Listing Section ===== -->





<!-- ===== Start of Get Started Section ===== -->
<section class="get-started ptb40">
	<div class="container">
		<div class="row ">

			<!-- Column -->
			<div class="col-md-10 col-sm-9 col-xs-12">
				<h3 class="text-white">20,000+ People trust Cariera! Be one of
					them today.</h3>
			</div>

			<!-- Column -->
			<div class="col-md-2 col-sm-3 col-xs-12">
				<a href="#" class="btn btn-blue btn-effect">get start now</a>
			</div>

		</div>
	</div>
</section>
<!-- ===== End of Get Started Section ===== -->

<%@ include file="../inc/footer.jsp"%>