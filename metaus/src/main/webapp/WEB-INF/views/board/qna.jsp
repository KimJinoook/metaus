<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>


<!-- =============== Start of Page Header 1 Section =============== -->
<section class="page-header" id="find-candidate"
	style="margin-top: 150px;">
	<div class="container">

		<!-- Start of Page Title -->
		<div class="row">
			<div class="col-md-12">
				<h2>QNA</h2>
			</div>
		</div>
		<!-- End of Page Title -->

		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">공지사항 - QNA</li>
				</ul>
			</div>
		</div>
		<!-- End of Breadcrumb -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->





<!-- ===== Start of Main Wrapper Section ===== -->
<section class="find-candidate ptb80">
	<div class="container">

		<!-- Start of Form -->
		<form class="row" action="#" method="get">

			<!-- Start of keywords input -->
			<div
				class="col-md-6 col-md-offset-2 col-sm-6 col-sm-offset-2 col-xs-8">
				<label for="search-keywords">Keywords</label> <input type="text"
					name="search-keywords" id="search-keywords" class="form-control"
					placeholder="여기에 검색할 내용을 입력해주세요">
			</div>

			<!-- Start of submit input -->
			<div class="col-md-2 col-sm-2 col-xs-4">
				<button type="submit" class="btn btn-blue btn-effect">
					<i class="fa fa-search"></i>검색
				</button>
			</div>
			<a href="/metaus/board/boardWrite?btypeNo=3">[글쓰기]</a>

		</form>
		<!-- End of Form -->

		<!-- Start of Row -->
		<div class="row mt60">
			<!-- Start of Candidate Main -->
			<div class="col-md-12 candidate-main">

				<c:if test="${empty list }">
					<img alt="게시글 내용이 없습니다" src="<c:url value='/images/board/no_board.gif'/>"
					style="width: 1000px;margin-left: 100px;">
				</c:if>
				<c:if test="${!empty list }">
					<!-- 반복 시작 -->
					<c:forEach var="map" items="${list }">
						<!-- Start of Candidates Wrapper -->
						<div class="candidate-wrapper">

							<!-- ===== Start of Single Candidate 1 ===== -->
							<div class="single-candidate row nomargin">

								<!-- Candidate Image -->
								<div class="col-md-2 col-xs-3">
									<div class="candidate-img">
										<a href="<c:url value='/board/boardDetail?boardNo=${map["BOARD_NO"] }&btypeNo=3'/>">
										<c:forEach var="vo" items="${atcList }">
											<c:if test="${vo.boardNo==map['BOARD_NO'] }">
												<img src="<c:url value='/img_upload/${vo.bfileFilename }'/>"
													class="img-responsive" alt="이미지" />
											</c:if>
										</c:forEach>
										</a>
									</div>
								</div>

								<!-- Start of Candidate Name & Info -->
								<div class="col-md-8 col-xs-6 ptb20">

									<!-- Candidate Name -->
									<div class="candidate-name">
										<a href="candidate-profile-1.html"><h5>${map['BOARD_TITLE'] }</h5></a>
									</div>

									<!-- Candidate Info -->
									<div class="candidate-info mt5">
										<ul class="list-inline">
											<li><span><i class="fa fa-user"></i>${map['MEM_NAME'] }</span></li>

											<li><span><i class="fa fa-clock-o"></i> <fmt:formatDate
														value="${map['BOARD_REGDATE'] }" pattern="yyyy-MM-dd" />
											</span></li>

											<li><span><i class="fa fa-briefcase"></i>${map['BOARD_READCOUNT'] }</span></li>
										</ul>
									</div>
								</div>
								<!-- End of Candidate Name & Info -->

								<!-- CTA -->
								<div class="col-md-2 col-xs-3">
									<div class="candidate-cta ptb30">
										<a href="<c:url value='/board/boardDetail?boardNo=${map["BOARD_NO"] }&btypeNo=3'/>"
											class="btn btn-blue btn-small btn-effect">답변하기</a>
									</div>
								</div>

							</div>
							<!-- ===== End of Single Candidate 1 ===== -->
					</c:forEach>
					<!-- 반복 종료 -->
				</c:if>
			</div>
			<!-- End of Candidates Wrapper -->

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
		<!-- End of Candidate Main -->

	</div>
	<!-- End of Row -->

	</div>
</section>
<!-- ===== End of Main Wrapper Section ===== -->

<%@ include file="../inc/footer.jsp"%>