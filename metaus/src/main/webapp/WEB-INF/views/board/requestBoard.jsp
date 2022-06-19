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
				<h2>개인의뢰 게시판</h2>
			</div>
		</div>
		<!-- End of Page Title -->

		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">커뮤니티 - 개인의뢰 게시판</li>
				</ul>
			</div>
		</div>
		<!-- End of Breadcrumb -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->


<a href="/metaus/board/boardWrite?btypeNo=7">[글쓰기]</a>


<!-- ===== Start of Main Wrapper Section ===== -->
<section class="search-jobs ptb80" id="version4">
	<div class="container">

		<!-- Start of Form -->
		<form class="job-search-form row" action="#" method="get">

			<!-- Start of keywords input -->
			<div class="col-md-3 col-sm-12 search-keywords">
				<label for="search-keywords">Keywords</label> <input type="text"
					name="search-keywords" class="form-control" id="search-keywords"
					placeholder="Keywords">
			</div>

			<!-- Start of category input -->
			<div class="col-md-3 col-sm-12 search-categories">
				<label for="search-categories">Category</label> <select
					name="search-categories" class="selectpicker"
					id="search-categories" data-live-search="true" title="Any Category"
					data-size="5" data-container="body">
					<option value="1">Accountance</option>
					<option value="2">Banking</option>
					<option value="3">Design & Art</option>
					<option value="4">Developement</option>
					<option value="5">Insurance</option>
					<option value="6">IT Engineer</option>
					<option value="7">Healthcare</option>
					<option value="8">Marketing</option>
					<option value="9">Management</option>
				</select>
			</div>

			<!-- Start of location input -->
			<div class="col-md-4 col-sm-12 search-location">
				<label for="search-location">Location</label> <input type="text"
					name="search-location" class="form-control" id="search-location"
					placeholder="Location">
			</div>

			<!-- Start of submit input -->
			<div class="col-md-2 col-sm-12 search-submit">
				<button type="submit" class="btn btn-blue btn-effect">
					<i class="fa fa-search"></i>search
				</button>
			</div>

		</form>
		<!-- End of Form -->


		<!-- Start of Row -->
		<div class="row mt60">

			<div class="col-md-12">
				<h4>999개의 검색결과가 있습니다</h4>
			</div>
			<c:if test="${!empty list }">
				<!-- 반복 시작 -->
				<c:forEach var="map" items="${list }">

					<!-- ===== Start of Job Post Column 1 ===== -->
					<div class="col-md-12 mt20">
						<div class="item-block shadow-hover">
							<!-- Start of Job Post Header -->
							<div class="job-post-header clearfix">
								<a href="company-page-1.html"><img
									src="images/companies/envato.svg" alt=""></a>
								<div>
									<a href="job-page.html"><h4>${map['BOARD_TITLE'] }</h4></a>
									<h5>
										<small>${map['MEM_NAME'] }</small>
									</h5>
								</div>

								<ul class="pull-right">
									<li>
										<h6 class="time">${map['BOARD_REFDATE'] }</h6>
									</li>
									<li><a href="#" class="btn btn-green btn-small btn-effect">지원하기</a></li>
								</ul>

							</div>
							<!-- End of Job Post Header -->

							
						</div>
					</div>
					<!-- ===== End of Job Post Column 1 ===== -->
				</c:forEach>
			</c:if>

			<!-- Start of Pagination -->
			<div class="col-md-12 mt10">
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
		<!-- End of Row -->

	</div>
</section>
<!-- ===== End of Main Wrapper Section ===== -->





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