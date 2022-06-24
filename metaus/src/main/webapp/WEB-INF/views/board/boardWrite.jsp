<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>

<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('select[name=search-categories]').change(function(){
			alert('게시판 종류가 변경되었습니다');
			$('#btypeNo').val($(this).val());
		});
	});
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
				<h2>게시판 글작성</h2>
			</div>
		</div>
		<!-- End of Page Title -->

		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">커뮤니티 - 글 작성</li>
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
                <div class="col-md-3 col-sm-12 search-categories" style="display: contents;">
                    <label for="search-categories">게시판 종류</label>
                    <select name="search-categories" class="selectpicker" 
                    id="search-categories" data-live-search="true" 
                    title="게시판을 선택해주세요" data-size="5" 
                    data-container="body" style="display: flow-root">
                    
                        <option value="3" 
                        <c:if test="${param.btypeNo==3 }">selected="selected"</c:if>>QNA 게시판</option>
                        <option value="8"
                        <c:if test="${param.btypeNo==8 }">selected="selected"</c:if>>자유 게시판</option>
                        <option value="5"
                        <c:if test="${param.btypeNo==5 }">selected="selected"</c:if>>질문 게시판</option>
                        <option value="6"
                        <c:if test="${param.btypeNo==6 }">selected="selected"</c:if>>공유/정보 게시판</option>
                        <option value="7"
                        <c:if test="${param.btypeNo==7 }">selected="selected"</c:if>>개인의뢰 게시판</option>
                    </select>
                </div>
                	<input type="hidden" name="btypeNo" id="btypeNo" value="${param.btypeNo }">
                	<input type="hidden" name="memId" value="${memId }">
					<!-- Form Group -->
					
					<div class="form-group">
						<label>글 제목</label> <input class="form-control" type="text"
							placeholder="글 제목을 입력해주세요" required style="color: black;"
							name="boardTitle">
					</div>
					
					<!-- Form Group -->
					<div class="form-group">
						<label>글 내용</label>
						<textarea name="boardContent" id="editor"></textarea>	
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
						<button class="btn btn-blue btn-effect">submit</button>
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