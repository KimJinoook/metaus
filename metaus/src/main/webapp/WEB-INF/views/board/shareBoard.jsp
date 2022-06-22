<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>
<script th:inline="javascript">
	$(function() {

		var result = /*[[${msg}]]*/'default';

		if (result == 'success') {
			alert("처리가 완료되었습니다. result:" + result);
		}

	});
</script>

<!-- =============== Start of Page Header 1 Section =============== -->
<section class="page-header" style="margin-top: 150px;">
	<div class="container">

		<!-- Start of Page Title -->
		<div class="row">
			<div class="col-md-12">
				<h2>공유/정보 게시판</h2>
			</div>
		</div>
		<!-- End of Page Title -->

		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">커뮤니티 - 공유/정보 게시판</li>
				</ul>
			</div>
		</div>
		<!-- End of Breadcrumb -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->

<a href="/metaus/board/boardWrite?btypeNo=6">[글쓰기]</a>
<!-- ===== Start of Blog Listing Section ===== -->
<section class="blog-listing ptb80" id="version2">
	<div class="container">
		<div class="row">

			<!-- Start of Blog Posts -->
			<div class="col-md-8 col-xs-12 blog-posts-wrapper">
<c:if test="${empty list }">
					<img alt="게시글 내용이 없습니다" src="<c:url value='/images/board/no_board.gif'/>"
					style="width: 800px;">
				</c:if>
				<c:if test="${!empty list }">
					<!-- 반복 시작 -->
					<c:forEach var="map" items="${list }">
						<!-- Start of Blog Post Article 1 -->
						<article class="col-md-12 blog-post">
							<!-	- Blog Post Thumbnail -->
							<div class="col-md-12 blog-thumbnail">
								<a href="<c:url value='/board/readCountUp?boardNo=${map["BOARD_NO"] }&btypeNo=6'/>">
								<img src="images/blog/blog1.jpg" class="img-responsive" alt=""></a>
							</div>

							<!-- Blog Post Description -->
							<div class="col-md-12 blog-desc">
								<h5>
									<a href="<c:url value='/board/readCountUp?boardNo=${map["BOARD_NO"] }&btypeNo=6'/>">
									${map['BOARD_TITLE'] }</a>
								</h5>
								<div class="post-detail pt10 pb20">
									<span><i class="fa fa-user"></i>${map['MEM_NAME'] }</span> <span><i
										class="fa fa-clock-o"></i>${map['BOARD_REGDATE'] }</span> <span><img src="<c:url value='/images/board/eye.png'/>"
											style="width: 14px;height: 14.4px;">
											${map['BOARD_READCOUNT'] }</span>
								</div>
								<a href="blog-post-right-sidebar.html"
									class="btn btn-blue btn-effect mt10">상세보기</a>
							</div>
						</article>
						<!-- End of Blog Post Article 1 -->
					</c:forEach>
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


			<!-- Start of Blog Sidebar -->
			<div class="col-md-4 col-xs-12 blog-sidebar">

				<!-- Start of Search -->
				<div class="col-md-12">
					<form action="#" method="get">
						<input type="text" class="form-control" placeholder="search...">
					</form>
				</div>
				<!-- End of Search -->

				<!-- Start of Popular Posts -->
				<div class="col-md-12 clearfix mt40">
					<h4 class="widget-title">popular posts</h4>

					<!-- Blog Post 1 -->
					<div class="sidebar-blog-post">
						<!-- Thumbnail -->
						<div class="thumbnail-post">
							<a href="blog-post-right-sidebar.html"> <img
								src="images/blog/blog1.jpg" alt="">
							</a>
						</div>

						<!-- Link -->
						<div class="post-info">
							<a href="blog-post-right-sidebar.html">top 10 tips for web
								developers</a> <span>1 day ago</span>
						</div>
					</div>

					<!-- Blog Post 2 -->
					<div class="sidebar-blog-post">
						<!-- Thumbnail -->
						<div class="thumbnail-post">
							<a href="blog-post-right-sidebar.html"> <img
								src="images/blog/blog2.jpg" alt="">
							</a>
						</div>

						<!-- Link -->
						<div class="post-info">
							<a href="blog-post-right-sidebar.html">how to prepare for an
								interview</a> <span>2 days ago</span>
						</div>
					</div>

					<!-- Blog Post 3 -->
					<div class="sidebar-blog-post">
						<!-- Thumbnail -->
						<div class="thumbnail-post">
							<a href="blog-post-right-sidebar.html"> <img
								src="images/blog/blog3.jpg" alt="">
							</a>
						</div>

						<!-- Link -->
						<div class="post-info">
							<a href="blog-post-right-sidebar.html">freelance vs
								employment</a> <span>3 days ago</span>
						</div>
					</div>

				</div>
				<!-- End of Popular Posts -->


				<!-- Start of Newsletter -->
				<div class="col-md-12 mt40">
					<h4 class="widget-title">newsletter</h4>

					<!-- Start Mailchimp Form -->
					<form action="#" class="mailchimp" novalidate>
						<div class="form-group">

							<!-- Input -->
							<input type="email" name="EMAIL" class="form-control"
								id="mc-email2" placeholder="Your Email" autocomplete="off">

							<!-- Label - Do not delete this -->
							<label for="mc-email2"></label>

							<!-- Subscribe Button -->
							<button type="submit" class="btn btn-blue btn-effect mt20">subscribe</button>
						</div>
					</form>
					<!-- End of Mailchimp Form -->
				</div>
				<!-- End of Newsletter -->


				<!-- Start of Trending Tags -->
				<div class="col-md-12 mt40">
					<h4 class="widget-title">trending tags</h4>

					<!-- Tags Wrapper -->
					<div class="tag-wrapper">
						<a href="#" class="tag-link">recruitment</a> <a href="#"
							class="tag-link">tags</a> <a href="#" class="tag-link">android</a>
						<a href="#" class="tag-link">cariera template</a> <a href="#"
							class="tag-link">html5</a> <a href="#" class="tag-link">css3</a>
						<a href="#" class="tag-link">design</a> <a href="#"
							class="tag-link">job board</a> <a href="#" class="tag-link">envato</a>
						<a href="#" class="tag-link">creative</a> <a href="#"
							class="tag-link">themeforest</a> <a href="#" class="tag-link">web
							art</a>
					</div>
				</div>
				<!-- End of Trending Tags -->


				<!-- Start of Social Media -->
				<div class="col-md-12 mt40">
					<h4 class="widget-title">share</h4>

					<ul class="social-btns list-inline">
						<!-- Social Media -->
						<li><a href="#" class="social-btn-roll facebook">
								<div class="social-btn-roll-icons">
									<i class="social-btn-roll-icon fa fa-facebook"></i> <i
										class="social-btn-roll-icon fa fa-facebook"></i>
								</div>
						</a></li>

						<!-- Social Media -->
						<li><a href="#" class="social-btn-roll twitter">
								<div class="social-btn-roll-icons">
									<i class="social-btn-roll-icon fa fa-twitter"></i> <i
										class="social-btn-roll-icon fa fa-twitter"></i>
								</div>
						</a></li>

						<!-- Social Media -->
						<li><a href="#" class="social-btn-roll google-plus">
								<div class="social-btn-roll-icons">
									<i class="social-btn-roll-icon fa fa-google-plus"></i> <i
										class="social-btn-roll-icon fa fa-google-plus"></i>
								</div>
						</a></li>

						<!-- Social Media -->
						<li><a href="#" class="social-btn-roll instagram">
								<div class="social-btn-roll-icons">
									<i class="social-btn-roll-icon fa fa-instagram"></i> <i
										class="social-btn-roll-icon fa fa-instagram"></i>
								</div>
						</a></li>

						<!-- Social Media -->
						<li><a href="#" class="social-btn-roll linkedin">
								<div class="social-btn-roll-icons">
									<i class="social-btn-roll-icon fa fa-linkedin"></i> <i
										class="social-btn-roll-icon fa fa-linkedin"></i>
								</div>
						</a></li>

						<!-- Social Media -->
						<li><a href="#" class="social-btn-roll rss">
								<div class="social-btn-roll-icons">
									<i class="social-btn-roll-icon fa fa-rss"></i> <i
										class="social-btn-roll-icon fa fa-rss"></i>
								</div>
						</a></li>
					</ul>
				</div>
				<!-- Start of Social Media -->


				<!-- Start of Categories -->
				<div class="col-md-12 mt40">
					<h4 class="widget-title">categories</h4>

					<ul class="sidebar-list">
						<li><a href="#">design</a></li>
						<li><a href="#">tech</a></li>
						<li><a href="#">strategy</a></li>
						<li><a href="#">job board</a></li>
						<li><a href="#">marketing</a></li>
						<li><a href="#">life</a></li>
						<li><a href="#">finance</a></li>
					</ul>
				</div>
				<!-- End of Categories -->

				<!-- Start of Archives -->
				<div class="col-md-12 mt40">
					<h4 class="widget-title">archives</h4>

					<ul class="sidebar-list">
						<li><a href="#">january</a></li>
						<li><a href="#">february</a></li>
						<li><a href="#">march</a></li>
						<li><a href="#">april</a></li>
						<li><a href="#">may</a></li>
					</ul>
				</div>
				<!-- End of Archives -->

			</div>
			<!-- End of Blog Sidebar -->

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