<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/search.css'/>">
<script type="text/javascript">
	function boardList(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
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

		<!-- 검색 시작 -->
<div id="searchBox">
	<div class="col-md-3 col-sm-12 search-categories"
		style="display: contents;">
		<label for="search-categories"></label> <select name="searchCondition"
			class="selectpicker" id="search-categories" data-live-search="true"
			title="검색 조건" data-size="3" data-container="body"
			style="display: flow-root;">
			<option value="memNo">작성자</option>
			<option value="boardTitle">제목</option>
			<option value="boardContent">내용</option>
		</select> <input type="text" class="live-search-box form-control mt20"
			placeholder="검색하실 내용을 입력해주세요" name="searchKeyword" id=""searchKeyword"">
		<a href="/metaus/board/boardWrite?btypeNo=8">
			<button class="btn btn-large btn-blue btn-effect mt30" id="searchBt">
				검색</button>
		</a> <a href="/metaus/board/boardWrite?btypeNo=8">
			<button class="btn btn-large btn-blue btn-effect mt30">글쓰기</button>
		</a>
	</div>
</div>
<!-- 검색 끝 -->

		<!-- Start of Row -->
		<div class="row mt60">
			<!-- Start of Candidate Main -->
			<div class="col-md-12 candidate-main">

				<c:if test="${empty list }">
					<img alt="게시글 내용이 없습니다"
						src="<c:url value='/images/board/no_board.gif'/>"
						style="width: 950px; margin-left: 100px;">
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
										<a
											href="<c:url value='/board/readCountUp?boardNo=${map["BOARD_NO"] }&btypeNo=3'/>">
											<c:forEach var="vo" items="${atcList }">
												<c:if test="${vo.boardNo==map['BOARD_NO'] }">
													<img
														src="<c:url value='/img_upload/${vo.bfileFilename }'/>"
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
										<a
											href="<c:url value='/board/readCountUp?boardNo=${map["BOARD_NO"] }&btypeNo=3'/>">
											<h5>${map['BOARD_TITLE'] }</h5>
										</a>
									</div>

									<!-- Candidate Info -->
									<div class="candidate-info mt5">
										<ul class="list-inline">
											<li><span><i class="fa fa-user"></i>${map['MEM_NAME'] }</span></li>

											<li><span><i class="fa fa-clock-o"></i> <fmt:formatDate
														value="${map['BOARD_REGDATE'] }" pattern="yyyy-MM-dd" />
											</span></li>

											<li><span><img
													src="<c:url value='/images/board/eye.png'/>"
													style="width: 14px; height: 14.4px;">
													${map['BOARD_READCOUNT'] }</span></li>
										</ul>
									</div>
								</div>
								<!-- End of Candidate Name & Info -->

								<!-- CTA -->
								<div class="col-md-2 col-xs-3">
									<div class="candidate-cta ptb30">
										<a
											href="<c:url value='/board/readCountUp?boardNo=${map["BOARD_NO"] }&btypeNo=3'/>"
											class="btn btn-blue btn-small btn-effect">답변하기</a>
									</div>
								</div>

							</div>
							<!-- ===== End of Single Candidate 1 ===== -->
					</c:forEach>
					<!-- 반복 종료 -->
					
					<!-- Start of Pagination -->
					<div class="col-md-12">
					<ul class="pagination list-inline text-center">
					<c:if test="${pagingInfo.firstPage>1 }">
						<li><a href="#" onclick="boardList(${pagingInfo.firstPage-1})">prev</a></li>
					</c:if>

					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<li class="active"><a>${i }</a></li>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<li><a href="#" onclick="boardList(${i})">${i } </a></li>
						</c:if>
					</c:forEach>

					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<li><a href="#" onclick="boardList(${pagingInfo.lastPage+1})">Next</a></li>
					</c:if>
					<!--  페이지 번호 끝 -->
					</ul>
					</div>
					<!-- End of Pagination -->
					
					
				</c:if>
			</div>
			<!-- 페이징 처리를 위한 form 시작-->
			<form name="frmPage" method="post"
				action="<c:url value='/board/qna?btypeNo=3'/>">
				<input type="hidden" name="currentPage">
			</form>
			<!-- 페이징 처리 form 끝 -->
			<!-- End of Candidates Wrapper -->
		</div>
		<!-- End of Candidate Main -->
	</div>
	<!-- End of Row -->
	</div>
</section>
<!-- ===== End of Main Wrapper Section ===== -->

<%@ include file="../inc/footer.jsp"%>