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

<script th:inline="javascript">

$(function () {
	
	var result =/*[[${msg}]]*/ 'default';
	
	if(result == 'success'){
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
				<h2>자유 게시판</h2>
			</div>
		</div>
		<!-- End of Page Title -->

		<!-- Start of Breadcrumb -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><a href="#">home</a></li>
					<li class="active">커뮤니티</li>
					<li class="active">커뮤니티 - 자유 게시판</li>
				</ul>
			</div>
		</div>
		<!-- End of Breadcrumb -->

	</div>
</section>
<!-- =============== End of Page Header 1 Section =============== -->







<%@ include file="../inc/footer.jsp"%>