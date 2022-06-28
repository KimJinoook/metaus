<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="vo" items="${cgList }">
	<!-- 반복 시작 -->
	<li>
		<a href
="<c:url value='/pd/pdByCategory?cateNo=${vo.cateNo }&cateName=${vo.cateName}'/>">
			${vo.cateName }
		</a>
	</li>
	<!-- 반복 끝 -->
</c:forEach>