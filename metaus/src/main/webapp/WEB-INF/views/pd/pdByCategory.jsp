<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/search.css'/>">
<script type="text/javascript">
$(function(){
	$('#pdPost').click(function(){
		if($('#memId').val()=="" || $('#memId').val()==null){
			alert('로그인 후 이용가능합니다!');
			event.preventDefault();
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
                    <h2>3D ${param.cateName } 목록</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">3D Model</li>
                    </ul>
                </div>
            </div>
            <!-- End of Breadcrumb -->

        </div>
    </section>
    <!-- container -->
		<div id="container">
			<nav class="cateMenu">
				<dl id="leftNavi">
					<!-- category list -->
				    <c:import url="/pd/categoryList"></c:import>
					
				</dl>
			</nav>
 <!-- 검색 시작 -->
<form id="searchFrm" method="post" action="<c:url value='/pd/pd'/>">
	<div id="searchBox">
		<div class="col-md-3 col-sm-12 search-categories"
			style="display: contents;">
			<label for="search-categories"></label> <select
				name="searchCondition" class="selectpicker" id="searchCondition"
				data-live-search="true" title="검색 조건" data-size="3"
				data-container="body" style="display: flow-root;">
				<option value="memName">작성자</option>
				<option value="pdName">제목</option>
				<option value="pdPre">내용</option>
			</select> <input type="text" class="live-search-box form-control mt20"
				placeholder="검색하실 내용을 입력해주세요" name="searchKeyword"
				id="searchKeyword">
				<input type="hidden" name="btypeNo" value="8">
			<button class="btn btn-large btn-blue btn-effect mt30" id="searchBt"
				type="submit">검색</button>
		</div>
	</div>
</form>
<a href="<c:url value='/pd/pdPost'/>" id="pdPost">
	<button class="btn btn-large btn-blue btn-effect mt30" id="pdPost">상품 등록</button>
</a>
<!-- 검색 끝 -->
<input type="hidden" id="memId" name="memId" value="${memId }">
    <!-- =============== End of Page Header 1 Section =============== -->
<!-- Section-->
        <section class="py-5">        
            <div class="container px-4 px-lg-5 mt-5">
            <c:if test="${!empty list }">
            <c:forEach var="vo" items="${list }">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">        
                                      
                        <div class="card h-100">
                            <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..."/>
                            
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${vo.pdName }</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            </a>
                        </div>
                    </div>                                        
                  </div>
            </c:forEach>
            </c:if>
                                                            
                    <!-- Start of Pagination -->
					<div class="col-md-12">
						<ul class="pagination list-inline text-center">
							<c:if test="${pagingInfo.firstPage>1 }">
								<li><a href="#"
									onclick="boardList(${pagingInfo.firstPage-1})">prev</a></li>
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
								<li><a href="#"
									onclick="boardList(${pagingInfo.lastPage+1})">Next</a></li>
							</c:if>
							<!--  페이지 번호 끝 -->
						</ul>
					</div>
					<!-- End of Pagination -->
                    <!-- 페이징 처리를 위한 form 시작-->
				<form name="frmPage" method="post"
					action="<c:url value='/pd/pd'/>">
					<input type="hidden" name="currentPage">
				</form>
				<!-- 페이징 처리 form 끝 -->
        </section>

<%@ include file="../inc/footer.jsp"%>