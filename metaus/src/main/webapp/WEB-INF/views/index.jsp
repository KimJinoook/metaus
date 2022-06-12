<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>
<div id="centerCon">
	<img src="<c:url value='/images/herb.JPG'/>" alt="herb 이미지">
</div>
<div id="rightCon">
	<!-- 공지사항 -->
	<c:import url="/board/mainNotice" />
</div>
<div id="listCon">
	<!-- 이벤트별 상품 목록 -->
	<%@ include file="shop/product/productCatalog.jsp" %>
	
</div>


<%@ include file="inc/bottom.jsp" %>
