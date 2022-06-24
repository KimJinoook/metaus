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


<!-- ===== Start of Single Blog Post Section ===== -->
<form action="<c:url value='/board/boardUpdate'/>" method="post" >
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
			
			<input type="text" name="boardNo" value="${vo.boardNo }">
			<input type="text" name="boardTitle" value="${vo.boardTitle }">
			<input type="text" name="boardContent" value="${vo.boardContent }">
			<input type="text" name="bfileNo" value="${AtcVo.bfileNo }">
			<input type="text" name="bfileFilename" value="${AtcVo.bfileFilename }">
			<input type="text" name="bfileOriginname" value="${AtcVo.bfileOriginname }">
			
			<input type="hidden" value="${memName2 }">
			<input type="hidden" value="${memName }">
			
			<c:if test="${memName == memName2 }">
			<div>
				<button class="btn btn-large btn-blue btn-effect mt30"
						id="writeBoard" type="submit">수정</button>
						
				 <a href="/metaus/board/boardDelete" id="boardDelete">
					<button class="btn btn-large btn-blue btn-effect mt30"
						id="writeBoard">삭제</button>
				</a>
			</div>
			</c:if>
			</form>
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

					<!-- Social Media -->
					<li><a href="#" class="social-btn-roll pinterest">
							<div class="social-btn-roll-icons">
								<i class="social-btn-roll-icon fa fa-pinterest"></i> <i
									class="social-btn-roll-icon fa fa-pinterest"></i>
							</div>
					</a></li>

					<!-- Social Media -->
					<li><a href="#" class="social-btn-roll linkedin">
							<div class="social-btn-roll-icons">
								<i class="social-btn-roll-icon fa fa-linkedin"></i> <i
									class="social-btn-roll-icon fa fa-linkedin"></i>
							</div>
					</a></li>
				</ul>
				<!-- End of Social Media Buttons -->


				<!-- Start of Blog Post Comments -->
				<div class="mt60" id="blog-comments">
					<div class="main-content">

						<h4>4 comments</h4>

						<!-- Start of Comment List -->
						<ul class="comments-list">

							<!-- Start of Comment 1 -->
							<li class="comment">
								<!-- Commenter Image --> <a class="pull-left commenter" href="#">
									<img src="images/clients/client1.jpg" alt=""
									class="img-responsive">
							</a>

								<div class="media-body comment-body">
									<!-- Comment Wrapper -->
									<div class="comment-content-wrapper">
										<div class="media-heading clearfix">

											<!-- Commenters Name -->
											<h6 class="commenter-name">john doe</h6>

											<div class="comment-reply pull-right">
												<a href="javascript:void(0)"
													class="btn btn-blue btn-small btn-effect">reply</a>
											</div>

											<!-- Comment Info -->
											<div class="comment-info">
												<span>Nov 11, 2016 at 7:49 am</span>
											</div>

											<!-- Comment -->
											<p>Lorem Ipsum is simply dummy text of the printing and
												typesetting industry. Lorem Ipsum has been the industry's
												standard dummy text ever since the 1500s, when an unknown
												printer took a galley of type and scrambled it to make a
												type specimen book.</p>
										</div>

										<!-- ==== Start of Comment Replies ==== -->
										<ul class="comment-replies">

											<!-- Start of Comment Reply 1 -->
											<li class="comment-replied">
												<!-- Commenter Image --> <a class="pull-left commenter"
												href="#"> <img src="images/clients/client2.jpg" alt=""
													class="img-responsive">
											</a>

												<div class="media-body comment-body">
													<!-- Comment Wrapper -->
													<div class="comment-content-wrapper">
														<div class="media-heading clearfix">

															<!-- Commenters Name -->
															<h6 class="commenter-name">john doe</h6>

															<!-- Comment Info -->
															<div class="comment-info">
																<span>Nov 11, 2016 at 7:51 am</span>
															</div>

															<!-- Comment -->
															<p>Lorem Ipsum is simply dummy text of the printing
																and typesetting industry. Lorem Ipsum has been the
																industry's standard dummy text ever since the 1500s,
																when an unknown printer took a galley of type and
																scrambled it to make a type specimen book.</p>
														</div>
													</div>
													<!-- End of Comment Wrapper -->
												</div>
											</li>
											<!-- End of Comment Reply 1 -->

											<!-- Start of Comment Reply 2 -->
											<li class="comment-replied">
												<!-- Commenter Image --> <a class="pull-left commenter"
												href="#"> <img src="images/clients/client3.jpg" alt=""
													class="img-responsive">
											</a>

												<div class="media-body comment-body">
													<!-- Comment Wrapper -->
													<div class="comment-content-wrapper">
														<div class="media-heading clearfix">

															<!-- Commenters Name -->
															<h6 class="commenter-name">john doe</h6>

															<!-- Comment Info -->
															<div class="comment-info">
																<span>Nov 11, 2016 at 7:52 am</span>
															</div>

															<!-- Comment -->
															<p>Lorem Ipsum is simply dummy text of the printing
																and typesetting industry. Lorem Ipsum has been the
																industry's standard dummy text ever since the 1500s,
																when an unknown printer took a galley of type and
																scrambled it to make a type specimen book.</p>
														</div>
													</div>
													<!-- End of Comment Wrapper -->
												</div>
											</li>
											<!-- End of Comment Reply 2 -->

										</ul>
										<!-- ==== End of Comment Replies ==== -->
									</div>
									<!-- End of Comment Wrapper -->
								</div>
							</li>
							<!-- End of Comment 1 -->


							<!-- Start of Comment 2 -->
							<li class="comment">
								<!-- Commenter Image --> <a class="pull-left commenter" href="#">
									<img src="images/clients/client1.jpg" alt=""
									class="img-responsive">
							</a>

								<div class="media-body comment-body">
									<!-- Comment Wrapper -->
									<div class="comment-content-wrapper">
										<div class="media-heading clearfix">

											<!-- Commenters Name -->
											<h6 class="commenter-name">john doe</h6>

											<div class="comment-reply pull-right">
												<a href="javascript:void(0)"
													class="btn btn-blue btn-small btn-effect">reply</a>
											</div>

											<!-- Comment Info -->
											<div class="comment-info">
												<span>Nov 11, 2016 at 8:51 am</span>
											</div>

											<!-- Comment -->
											<p>Lorem Ipsum is simply dummy text of the printing and
												typesetting industry. Lorem Ipsum has been the industry's
												standard dummy text ever since the 1500s, when an unknown
												printer took a galley of type and scrambled it to make a
												type specimen book.</p>
										</div>
									</div>
									<!-- End of Comment Wrapper -->
								</div>
							</li>
							<!-- End of Comment 2 -->


							<!-- Start of Comment 3 -->
							<li class="comment">
								<!-- Commenter Image --> <a class="pull-left commenter" href="#">
									<img src="images/clients/client4.jpg" alt=""
									class="img-responsive">
							</a>

								<div class="media-body comment-body">
									<!-- Comment Wrapper -->
									<div class="comment-content-wrapper">
										<div class="media-heading clearfix">

											<!-- Commenters Name -->
											<h6 class="commenter-name">john doe</h6>

											<div class="comment-reply pull-right">
												<a href="javascript:void(0)"
													class="btn btn-blue btn-small btn-effect">reply</a>
											</div>

											<!-- Comment Info -->
											<div class="comment-info">
												<span>Nov 11, 2016 at 8:55 am</span>
											</div>

											<!-- Comment -->
											<p>Lorem Ipsum is simply dummy text of the printing and
												typesetting industry. Lorem Ipsum has been the industry's
												standard dummy text ever since the 1500s, when an unknown
												printer took a galley of type and scrambled it to make a
												type specimen book.</p>
										</div>
									</div>
									<!-- End of Comment Wrapper -->
								</div>
							</li>
							<!-- End of Comment 3 -->

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