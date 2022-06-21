<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>
<script src="<c:url value='js/jquery-3.1.1.min.js'/>"></script>
<script src="<c:url value='js/bootstrap.min.js'/>"></script>
<script src="<c:url value='js/bootstrap-select.min.js'/>"></script>
<script src="<c:url value='js/swiper.min.js'/>"></script>
<script src="<c:url value='js/jquery.ajaxchimp.js'/>"></script>
<script src="<c:url value='js/jquery.countTo.js'/>"></script>
<script src="<c:url value='js/jquery.inview.min.js'/>"></script>
<script src="<c:url value='js/jquery.magnific-popup.min.js'/>"></script>
<script src="<c:url value='js/jquery.easypiechart.min.js'/>"></script>
<script src="<c:url value='js/jquery-ui.min.js'/>"></script>
<script src="<c:url value='js/owl.carousel.min.js'/>"></script>
<script src="<c:url value='js/tinymce/tinymce.min.js'/>"></script>
<script src="<c:url value='js/countdown.js'/>"></script>
<script src="<c:url value='js/isotope.min.js'/>"></script>
<script src="<c:url value='js/custom.js'/>"></script>

<!-- =============== Start of Page Header 1 Section =============== -->
<section class="page-header" style="margin-top: 150px;">
	<div class="container">

		<!-- Start of Page Title -->
		<div class="row">
			<div class="col-md-12">
				<h2>News</h2>
			</div>
		</div>
		<!-- End of Page Title -->

		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="<c:url value='/'/>">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">커뮤니티 - 기사</li>
				</ul>
			</div>
		</div>
		<!-- End of Breadcrumb -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->

<!-- ===== Start of Blog Listing Section ===== -->
<section class="blog-listing ptb80" id="version1">
	<div class="container">
		<div class="row">

			<!-- Start of Blog Posts -->
			<div class="col-md-12 col-xs-12 blog-posts-wrapper">
				<c:if test="${!empty list }">
					<!-- 반복 시작 -->
					<c:forEach var="map" items="${list }">

						<!-- Start of Blog Post Article 1 -->
						<article class="col-md-12 blog-post">
							<!-- Blog Post Thumbnail -->
							<div class="col-md-4 blog-thumbnail">
								<a href="<c:url value='/board/readCountUp?boardNo=${map["BOARD_NO"] }&btypeNo=4'/>">
								<img src="images/blog/blog1.jpg" class="img-responsive" alt=""></a>
							</div>

							<!-- Blog Post Description -->
							<div class="col-md-8 blog-desc">
								<h5>
									<a href="<c:url value='/board/readCountUp?boardNo=${map["BOARD_NO"] }&btypeNo=4'/>">
									${map['BOARD_TITLE'] }</a>
								</h5>
								<div class="post-detail pt10 pb20">
									<span><i class="fa fa-user"></i>${map['MEM_NAME'] }</span> <span><i
										class="fa fa-clock-o"></i>${map['BOARD_REGDATE'] }</span> <span><i
										class="fa fa-comments-o"></i>${map['BOARD_READCOUNT'] }</span>
								</div>
								<a href="blog-post-right-sidebar.html"
									class="btn btn-blue btn-effect mt10">자세히</a>
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