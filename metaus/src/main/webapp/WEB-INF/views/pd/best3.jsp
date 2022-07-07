<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <section class="py-5">        
	<div class="container px-4 px-lg-5 mt-5">
  <c:if test="${!empty list }">
            <!-- 반복 시작 -->
            <c:forEach var="vo" items="${list }">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">
                            <!-- Product image-->
                            <img class="card-img-top" src="<c:url value='/product/${vo.pdFilename }'/>" alt="..."/>
                            
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
            </c:forEach>
            <!-- 반복 끝 -->
            </c:if>
       </div>
       </section>