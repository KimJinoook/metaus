<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp" %>

<script type="text/javascript"
	src="<c:url value='/js/jquery-3.6.0.min.js'/>">
	
</script>
<script>
	function shareFacebook() {
		window.open('http://www.facebook.com/sharer.php?u=www.naver.com');
	}
	
	function reportBoard(no){
		$.ajax({
			url : "<c:url value='/board/report'/>" + "?boardNo="+no,
			type : 'GET',
			async : false,

			success : function(res) {
				if(res==1){
					alert('이미 신고된 게시글입니다.');
				}else if(res==2){
					alert('게시글이 신고되었습니다');
				}
			},
			error : function(xhr, status, error) {
				alert('error:' + error);
			}
		});
	}
	
	$(function() {
		var bool = true;
		
		$('#replyArea div').hide();
		$('form[name=replyFrm] button').click(function(){
			if(bool){
				$(this).parent().parent().parent().find('div').show();
				bool= !bool;
			}else{
				$(this).parent().parent().parent().find('#replyArea').hide();
				bool= !bool;
			}
		});
		$('#replyBt2').click(function(){
			$('#replyBt').click();
		});
		
		$('#cmtDelete2').click(function(){
			$('#cmtDeleteBt').click();
		});
		$('#cmtEditBt2').click(function(){
			$('#cmtEditBt').click();
		});
		
		
		$('#boardDeleteBt').click(function() {
			var rlt = confirm('삭제하시겠습니까?');

			if (rlt) {
				//확인 눌렀을시 실행문
				alert('삭제되었습니다.');
				$('#boardDelete').submit();
			} else {
				// 취소 눌렀을시 
				return false;
			}
		});

		$('#ajaxBt').click(
				function() {

					if ($('#memId').val() == "" || $('#memId').val() == null) {
						alert('로그인 후 이용 가능합니다.');
						event.preventDefault();
						return false;
					}

					var boardNo = "${vo.boardNo}";
					var memId = "${memId}";
					var cmtContent = $('#cmtContent').val();

					$.ajax({
						url : "<c:url value='/board/commentAjax'/>" + "?memId="
								+ memId + "&cmtContent=" + cmtContent
								+ "&boardNo=" + boardNo,
						type : 'GET',
						async : false,

						success : function(res) {
							var message = "댓글 등록 성공";
							alert(message);
							location.reload();
						},
						error : function(xhr, status, error) {
							alert('error:' + error);
						}
					});
				});

		$('form[name=delFrm] button').click(
				function() {
					var rlt = confirm('댓글을 삭제하시겠습니까?');

					if (rlt) {
						//확인 눌렀을시 실행문

						var cmtNo = $(this).find('input').val();
						$.ajax({
							url : "<c:url value='/board/commentAjaxDelete'/>"
									+ "?cmtNo=" + cmtNo,
							type : 'GET',
							success : function(res) {
								var message = "댓글 삭제 성공";

								alert(message);
								location.reload();
							},
							error : function(xhr, status, error) {
								alert('error:' + error);
							}
						});
					} else {
						// 취소 눌렀을시 
						return false;
					}
				});

		$('form[name=upFrm] button').click(
				function(e) {
					var cmtNo = $(this).find('input[name=cmtNo]').val();
					var cmtContent = $(this).parent().find(
							$('input[name=cmtContent]')).val();
					//console.log($(this).parent().parent().parent().find("p"));
					//let element = $($(this).parent().parent().parent().parent()[0]).find("p");
					//console.log(this);

					$.ajax({
						url : "<c:url value='/board/commentAjaxUpdate'/>"
								+ "?cmtNo=" + cmtNo + "&cmtContent="
								+ cmtContent,
						type : 'GET',
						async : false,
						success : function(res) {
							var message = "댓글 수정 성공";
							//let con = res.content;
							//console.log(res);

							//element[0].innerText = con;

							alert(message);
							location.reload();
							e.preventDefault();
						},
						error : function(xhr, status, error) {
							alert('error:' + error);
						}
					});

				});
		
		$('form[name=replyBox] button').click(
				function(e){
					
					var boardNo = "${vo.boardNo}";
					var memNo = "${sessionScope.memNo}";
					var cmtContent = $(this).parent().parent().find(
							$('textarea[name=cmtContent]')).val();
					var cmtGroupNo = $(this).parent().parent().find($('input[name=cmtGroupNo]')).val();
					var cmtStep = $(this).parent().parent().find($('input[name=cmtStep]')).val();
					var cmtSortNo = $(this).parent().parent().find($('input[name=cmtSortNo]')).val();
					
					$.ajax({
						url : "<c:url value='/board/commentReplyAjax'/>"
								+ "?boardNo=" + boardNo + "&memNo=" + memNo 
										+ "&cmtContent="+ cmtContent
										+ "&cmtGroupNo="+ cmtGroupNo
										+ "&cmtStep="+ cmtStep
										+ "&cmtSortNo="+ cmtSortNo,
						type : 'GET',
						async : false,
						success : function(res) {
							var message = "답글 작성 성공";

							alert(message);
							
							location.reload();
							e.preventDefault();
						},
						error : function(xhr, status, error) {
							alert('error:' + error);
						}
					});
		});
	});
</script>
<!-- =============== Start of Page Header 1 Section =============== -->
<section class="page-header" id="find-candidate" style="margin-top:150px">
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
					<span id="memVoName"><i class="fa fa-user"></i>${memVo.memNick }</span>
					<span><i class="fa fa-clock-o"></i> <fmt:formatDate
							value="${vo.boardRegdate }" pattern="yyyy년MM월dd HH시mm분" />
						&nbsp; <img src="<c:url value='/images/board/eye.png'/>"
						style="width: 14px; height: 14.4px;"> ${vo.boardReadcount }</span>
					<i class="fa fa-bell"></i><a href="javascript:reportBoard(${vo.boardNo })">신고</a>
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

				<c:set var="memName2" value="${memVo.memName }" />
				<c:set var="memName" value="${memName }" />

				<input type="hidden" name="boardNo" value="${vo.boardNo }">
				<input type="hidden" name="boardTitle" value="${vo.boardTitle }">
				<input type="hidden" name="boardContent" value="${vo.boardContent }">
				<input type="hidden" name="bfileNo" value="${AtcVo.bfileNo }">
				<input type="hidden" name="bfileFilename"
					value="${AtcVo.bfileFilename }"> <input type="hidden"
					name="bfileOriginname" value="${AtcVo.bfileOriginname }"> <input
					type="hidden" value="${memName2 }"> <input type="hidden"
					value="${memName }">

				<c:if test="${memName == memName2 }">
					<div>
						<a
							href="<c:url value='/board/boardUpdate?boardNo=${vo.boardNo }&bfileNo=${AtcVo.bfileNo}'/>">
							<button class="btn btn-large btn-blue btn-effect mt30"
								id="writeBoard">수정</button>
						</a>

						<form id="boardDelete"
							action="<c:url value='/board/boardDelete'/>"
							style="display: inline-block;">
							<input type="hidden" name="boardNo" value="${vo.boardNo }">
							<input type="hidden" name="btypeNo" value="${vo.btypeNo }">
							<button class="btn btn-large btn-blue btn-effect mt30"
								id="boardDeleteBt" type="button">삭제</button>
						</form>
					</div>
				</c:if>

				<!-- Start of Social Media Buttons -->
                        <ul class="social-btns list-inline mt20">
                        
                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll facebook transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-envelope-o"></i>
                                        <i class="social-btn-roll-icon fa fa-envelope-o"></i>
                                    </div>
                                </a>
                            </li>


                            <!-- Social Media -->
                            <li>
                                <a href="<c:url value='/board/freeBoard?btypeNo=8&memName=${memVo.memNick }'/>" class="social-btn-roll instagram transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-file-text"></i>
                                        <i class="social-btn-roll-icon fa fa-file-text"></i>
                                    </div>
                                </a>
                            </li>

                            <!-- Social Media -->
                            <li>
                                <a href="#" class="social-btn-roll linkedin transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-shopping-basket"></i>
                                        <i class="social-btn-roll-icon fa fa-shopping-basket"></i>
                                    </div>
                                </a>
                            </li>

                        </ul>
                        <!-- End of Social Media Buttons -->


				<!-- Start of Blog Post Comments -->
				<div class="mt60" id="blog-comments">
					<div class="main-content">

						<h5>${count }개의댓글이달렸습니다.</h5>

						<!-- Start of Comment List -->
						<ul class="comments-list">
							<!-- 반복시작 -->

							<!-- Start of Comment 1 -->
							<c:if test="${!empty list }">
								<c:forEach var="map" items="${list }">
										<c:if test="${map['CMT_STEP']==1 }">
												<li class="comment" style="margin-left: 30px;">
										</c:if>
										<c:if test="${map['CMT_STEP']==2 }">
												<li class="comment" style="margin-left: 60px;">
										</c:if>
										<c:if test="${map['CMT_STEP']==3 }">
												<li class="comment" style="margin-left: 90px;">
										</c:if>
										<c:if test="${map['CMT_STEP']==4 }">
												<li class="comment" style="margin-left: 120px;">
										</c:if>
										<c:if test="${map['CMT_STEP']==0 }">
											<li class="comment">
										</c:if>
										
										<div class="media-body comment-bo dy" id="rightMargin">
											<!-- Comment Wrapper -->
											<div class="comment-content-wrapper">
										<c:if test="${map['CMT_STEP']>0 }">
										<img src="<c:url value='/images/board/reply.png'/>" style="width: 50px;
										float: left; margin-right: 10px;">
										</c:if>
												<div class="media-heading clearfix">

													<!-- Commenters Name -->
													<h6 class="commenter-name">${map['MEM_ID'] }</h6>

													<!-- Comment Info -->
													<div class="comment-info">
														<span>${map['CMT_REGDATE'] }</span>
													</div>

													<!-- Comment -->
													<p>${map['CMT_CONTENT'] }</p>
													<div>
														<c:if test="${map['MEM_ID'] == memId }">
															<form name="upFrm" id="cmtUpdate"
																style="display: inline-block; width: 66px;">
																<div class="form-group">
																	<input class="form-control" type="text"
																		placeholder="수정할 내용을 입력해주세요" required
																		style="color: black; width: 500px;" name="cmtContent">
																</div>
																<button onclick="edit()"
																	class="btn btn-large btn-blue btn-effect mt30">
																	<input id="cmtNo" type="hidden"
																		value="${map['CMT_NO'] }" name="cmtNo">수정
																</button>
															</form>
															<form name="delFrm" id="cmtDelete"
																style="display: inline-block;">
																<button class="btn btn-large btn-blue btn-effect mt30"
																	type="button">
																	<input id="cmtNo" type="hidden"
																		value="${map['CMT_NO'] }"> 삭제
																</button>
															</form>
														</c:if>
														<c:if test="${!empty memId }">
														<form name="replyFrm" style="display: inline-block;">
														<button class="btn btn-large btn-blue btn-effect mt30"
															type="button" style="display: inline-block;" id="replyBt">
															답글</button>
														</form>
														</c:if>
													</div>
													<div id="replyArea">
													<div>
														<!-- Start of Comment Submit Form -->
														<h4 class="pt40">답글 남기기</h4>

														<form class="row" id="comment-form" name="replyBox">
															<div class="col-md-6 form-group">
																<input class="form-control input-box" type="text"
																	name="memName" id="memName" disabled="disabled"
																	value="${memName }">
															</div>
															<div class="col-md-6 form-group">
																<input class="form-control input-box" type="text"
																	name="memId" id="memId" disabled="disabled"
																	value="${memId }">
															</div>

															<div class="col-md-12 form-group mb30">
																<textarea class="form-control textarea-box" rows="8"
																	name="cmtContent" placeholder="여기에 답글을 써주세요..."
																	></textarea>
															</div>
															<div class="col-md-6 col-xs-6 comment-require">
																<p>욕설 및 상대방을 비하하는 댓글은 삭제될 수 있습니다.</p>
															</div>
															<div class="col-md-6 col-xs-6 comment">
																<button class="btn btn-blue btn-effect pull-right"
																	id="replyBtAjax" type="button">답글 쓰기</button>
															</div>
															<input  style="margin-left: 10px;" type="hidden" name="cmtGroupNo" value="${map['CMT_GROUPNO'] }">
															<input type="hidden" name="cmtStep" value="${map['CMT_STEP'] }">
															<input type="hidden" name="cmtSortNo" value="${map['CMT_SORTNO'] }">
														</form>
														<!-- End of Comment Submit Form -->
													</div>
												</div>
										<c:if test="${map['CMT_STEP']>0 }">
											<c:forEach begin="1" end="${map['CMT_STEP'] }">
												</li>
											</c:forEach>
											
										</c:if>
										<c:if test="${map['CMT_STEP']==0 }">
											</li>
										</c:if>
								</c:forEach>
						</ul>
						<!-- ==== End of Comment Replies ==== -->
					</div>
					<!-- End of Comment Wrapper -->
				</div>
				</li>

				<!-- End of Comment 1 -->

				<!-- 반복 끝 -->
				</c:if>
				</ul>
				<!-- End of Comment List -->


				<!-- Start of Comment Submit Form -->
				<h4 class="pt40">댓글 남기기</h4>

				<form class="row" id="comment-form">
					<div class="col-md-6 form-group">
						<input class="form-control input-box" type="text" name="memName"
							id="memName" disabled="disabled" value="${memName }">
					</div>
					<div class="col-md-6 form-group">
						<input class="form-control input-box" type="text" name="memId"
							id="memId" disabled="disabled" value="${memId }">
					</div>

					<div class="col-md-12 form-group mb30">
						<textarea class="form-control textarea-box" rows="8"
							name="message" placeholder="여기에 댓글을 써주세요..." id="cmtContent"></textarea>
					</div>
					<div class="col-md-6 col-xs-6 comment-require">
						<p>욕설 및 상대방을 비하하는 댓글은 삭제될 수 있습니다.</p>
					</div>
					<div class="col-md-6 col-xs-6 comment">
						<button class="btn btn-blue btn-effect pull-right" id="ajaxBt"
							type="button">댓글 쓰기</button>
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