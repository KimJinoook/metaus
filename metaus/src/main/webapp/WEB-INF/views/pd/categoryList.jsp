<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<li class="catelist">
	<a href="<c:url value='/pd/pd'/>">전체목록</a>
	</li>
<c:forEach var="vo" items="${cgList }">
	<!-- 반복 시작 -->
	<li class="catelist">
		<a href
="<c:url value='/pd/pdByCategory?cateNo=${vo.cateNo }&cateName=${vo.cateName}'/>" >
			${vo.cateName }
		</a>
	</li>
	<!-- 반복 끝 -->
</c:forEach>