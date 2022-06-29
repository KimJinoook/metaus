<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header">
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
    <!-- =============== End of Page Header 1 Section =============== -->
    <div style="width:780px;text-align:center;">
	<c:if test="${empty list }">
		<div class="line">
			카테고리에 해당하는 상품이 없습니다.
		</div>
	</c:if>
	<c:if test="${!empty list }">	
	   <!-- 반복 시작 -->
	   <c:forEach var="vo" items="${list }">

	   </c:forEach>
	   <!-- 반복 끝 -->
	</c:if>	   
</div>

<%@ include file="../inc/footer.jsp"%>