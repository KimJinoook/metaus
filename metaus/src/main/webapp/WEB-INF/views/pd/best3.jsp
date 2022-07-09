<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <input type="hidden" id="memId" name="memId" value="${memId }">
<!-- ===== Start of Shop Section ===== -->
    <section class="shop ptb80">
        <div class="container">
            <div class="row">

                <!-- Start of Shop Product Wrapper -->
                <div class="col-md-12 col-xs-12 shop-products-wrapper">
				<c:if test="${empty list }">
            <p class="noPd2" style="text-align: center;"><img src="<c:url value='/images/noPd2.png'/>" alt="..." width="40%"/></p>            
            </c:if>
            <c:if test="${!empty list }">
             <!-- 반복 시작 -->
            <c:forEach var="vo" items="${list }">
                    <!-- Start of Products -->
                    <div class="row">

                        <!-- Start of Product 1 -->
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <div class="product">

                                <!-- Product Image -->
                                <div class="product-image">

                                    <a href="<c:url value='/images/shop/product1.jpg'/>" class="hover-zoom">
                                        <img src="<c:url value='/images/shop/product1.jpg'/>" class="img-responsive" alt="">
                                    </a>

                                    <!-- Product overlay -->
                                    <div class="product-overlay">
                                        <a href="<c:url value='/cart/cart'/>"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                    </div>

                                </div>

                                <!-- Product Description -->
                                <div class="product-descr">

                                    <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">
                                        <h4>${vo.pdName }</h4>

                                        <!-- Price -->
                                        <span class="price">
								            <del><span class="amount">$39.99</span></del>
                                        <span class="amount">$<fmt:formatNumber value="${vo.pdPrice }" pattern="#,###"/></span>
                                        </span>
                                    </a>
                                </div>

                            </div>
                        </div>
                        <!-- End of Product 1 -->
						 </c:forEach>
            <!-- 반복 끝 -->
            </c:if>