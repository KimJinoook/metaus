<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>

<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	
</script>
<style>
  .ck-editor__editable { height: 500px; }
</style>
<!-- =============== Start of Page Header 1 Section =============== -->
<section class="page-header" style="margin-top: 150px;">
	<div class="container">

		<!-- Start of Page Title -->
		<div class="row">
			<div class="col-md-12">
				<h2>게시판 글수정</h2>
			</div>
		</div>
		<!-- End of Page Title -->

		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">커뮤니티 - 글 수정</li>
				</ul>
			</div>
		</div>
		<!-- End of Breadcrumb -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->

<!-- ===== Start of Main Wrapper Section ===== -->
<section class="ptb80" id="post-job">
	<div class="container">

		<!-- Start of Post Resume Form -->
		<form action="<c:url value='/board/boardWrite'/>" 
			class="post-job-resume mt50" 
			style="margin-top: 0px;" method="post"
			enctype="multipart/form-data">

			<!-- Start of Resume Details -->
			<div class="row">
				<div class="col-md-12">
				
				<!-- Start of category input -->
               
                	<input type="hidden" name="btypeNo" id="btypeNo" value="${param.btypeNo }">
                	<input type="hidden" name="memId" value="${memId }">
					<!-- Form Group -->
					
					<div class="form-group">
						<label>글 제목</label> <input class="form-control" type="text"
							required style="color: black;"
							name="boardTitle"
							value="${boardVo.boardTitle }">
					</div>
					
					<!-- Form Group -->
					<div class="form-group">
						<label>글 내용</label>
						<textarea name="boardContent" id="editor">${boardVo.boardContent }</textarea>	
						<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
						<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
					    <script>
					      	ClassicEditor.create( document.querySelector( '#editor' ), {
					      		language: "ko"
					      	});
					    </script>
					</div>

					<!-- Form Group -->
					<div class="form-group">
						<label>사진 업로드</label>

						<!-- Upload Button -->
						<div class="form-group">
							<span><i class="fa fa-upload"></i> Upload</span><input
								type="file" name="application_attachment"
								accept=".jpg,.png,.gif">
						</div>
					</div>
					<!-- Form Group -->
					<div class="form-group pt30 nomargin" id="last">
						<button class="btn btn-blue btn-effect">수정하기</button>
					</div>
				</div>
			</div>
			<!-- End of Resume Details -->
		</form>
		<!-- End of Post Resume Form -->
	</div>
</section>
<!-- ===== End of Main Wrapper Section ===== -->
<%@ include file="../inc/footer.jsp"%>