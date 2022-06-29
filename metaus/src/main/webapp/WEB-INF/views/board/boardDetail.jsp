<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>

<script>
$(function(){
	$('#boardDelete').click(function(){
		var rlt = confirm('삭제하시겠습니까?'); 

		if(rlt){
		 //확인 눌렀을시 실행문
			alert('삭제되었습니다.');
		}else{
		// 취소 눌렀을시 
			return false;
		}
	});
	
	
});
</script>
<!-- =============== Start of Page Header 1 Section =============== -->
<section class="page-header" style="margin-top: 150px;">
	<div class="container">

		<!-- Start of Page Title -->
		<div class="row">
			<div class="col-md-12">
				<h2>커뮤니티 - 게시글 상세보기</h2>
			</div>
		</div>
		<!-- End of Page Title -->
		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">커뮤니티 - 글 상세보기</li>
				</ul>
			</div>
		</div>
		<!-- End of Breadcrumb -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->


<!--===== Start of Single Blog Post Section ===== -->
<section class="ptb80" id="blog-post">
	<div class="container">

		<!-- Start of Blog Post Content Wrapper -->
		<div class="col-md-12">

			<!-- Start of Post Title -->
			<div class="post-title">
				<h2>${vo.boardTitle }</h2>
				<!-- Post Details -->
				<div class="post-detail">
					<span id="memVoName"><i class="fa fa-user"></i>${memVo.memName }</span> <span><i
						class="fa fa-clock-o"></i> <fmt:formatDate
							value="${vo.boardRegdate }" pattern="yyyy년MM월dd HH시mm분" /> &nbsp;
						<img src="<c:url value='/images/board/eye.png'/>"
						style="width: 14px; height: 14.4px;"> ${vo.boardReadcount }</span>
				</div>
			</div>
			<!-- End of Post Title -->
			<!-- Post Image -->
			<c:if test="${!empty AtcVo.bfileFilename }">
				<div class="post-img" style="height: auto;">
					<img src="<c:url value='/img_upload/${AtcVo.bfileFilename }'/>">
				</div>
			</c:if>
			<!-- Start of Post Content -->
			<div class="post-content">
				<p>${vo.boardContent }</p>
				
			<c:set var="memName2" value="${memVo.memName }"/>
			<c:set var="memName" value="${memName }"/>
			
			<input type="hidden" name="boardNo" value="${vo.boardNo }">
			<input type="hidden" name="boardTitle" value="${vo.boardTitle }">
			<input type="hidden" name="boardContent" value="${vo.boardContent }">
			<input type="hidden" name="bfileNo" value="${AtcVo.bfileNo }">
			<input type="hidden" name="bfileFilename" value="${AtcVo.bfileFilename }">
			<input type="hidden" name="bfileOriginname" value="${AtcVo.bfileOriginname }">
			
			<input type="hidden" value="${memName2 }">
			<input type="hidden" value="${memName }">
			
			<c:if test="${memName == memName2 }">
			<div>
			<a href="<c:url value='/board/boardUpdate?boardNo=${vo.boardNo }&bfileNo=${AtcVo.bfileNo}'/>">
				<button class="btn btn-large btn-blue btn-effect mt30"
						id="writeBoard">수정</button>
				</a>
						
				 <form id="boardDelete" action="<c:url value='/board/boardDelete'/>"
				 style="display: inline-block;">
				 <input type="hidden" name="boardNo" value="${vo.boardNo }">
				 <input type="hidden" name="btypeNo" value="${vo.btypeNo }">
					<button class="btn btn-large btn-blue btn-effect mt30"
						id="boardDelete" type="submit">삭제</button>
				</form>
			</div>
			</c:if>
		
				<!-- Start of Social Media Buttons -->
				<ul class="social-btns list-inline mt20">
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
				</ul>
				<!-- End of Social Media Buttons -->


				<!-- Start of Blog Post Comments -->
				<div class="mt60" id="blog-comments">
					<div class="main-content">

						<h5>${count } 개의 댓글이 달렸습니다.</h5>

						<!-- Start of Comment List -->
						<ul class="comments-list">
							<!-- 반복시작 -->
							
							<!-- Start of Comment 1 -->
							<c:if test="${!empty list }">
							<c:forEach var="vo" items="${list }">
							<li class="comment">
								<!-- Commenter Image --> <a class="pull-left commenter" href="#">
									<img class="img-responsive">
							</a>	

								<div class="media-body comment-bo dy">
									<!-- Comment Wrapper -->
									<div class="comment-content-wrapper">
										<div class="media-heading clearfix">

											<!-- Commenters Name -->
											<h6 class="commenter-name">${vo.memNo }</h6>

											<!-- Comment Info -->
											<div class="comment-info">
												<span>${vo.cmtRegdate }</span>
											</div>
											
											<!-- Comment -->
											<p>${vo.cmtContent }</p>
										</div>
									
										</ul>
										<!-- ==== End of Comment Replies ==== -->
									</div>
									<!-- End of Comment Wrapper -->
								</div>
							</li>
							
							</c:forEach>
							<!-- End of Comment 1 -->
							
							<!-- 반복 끝 -->
							</c:if>
						</ul>
						<!-- End of Comment List -->


						<!-- Start of Comment Submit Form -->
						<h4 class="pt40">댓글 남기기</h4>

						<form class="row" id="comment-form">
							<div class="col-md-6 form-group">
								<input class="form-control input-box" type="text" name="name"
									disabled="disabled" value="">
							</div>

							<div class="col-md-6 form-group">
								<input class="form-control input-box" type="email" name="email"
									disabled="disabled">
							</div>

							<div class="col-md-12 form-group mb30">
								<textarea class="form-control textarea-box" rows="8"
									name="message" placeholder="여기에 댓글을 써주세요..."></textarea>
							</div>
							<div class="col-md-6 col-xs-6 comment-require">
								<p>욕설 및 상대방을 비하하는 댓글은 삭제될 수 있습니다.</p>
							</div>
							<div class="col-md-6 col-xs-6 comment-submit">
								<button class="btn btn-blue btn-effect pull-right" type="submit">
									댓글 쓰기</button>
							</div>
						</form>
						<!-- End of Comment Submit Form -->
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../inc/footer.jsp"%>