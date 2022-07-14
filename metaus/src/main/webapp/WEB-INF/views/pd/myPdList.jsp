<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header" style="margin-top: 150px;">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>구매한 상품</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">구매한 상품</li>
                    </ul>
                </div>
            </div>
            <!-- End of Breadcrumb -->

        </div>
        </section>        

<!-- ===== Start of Shop Cart Section ===== -->
    <section class="shop ptb80">
        <div class="container">
            <div class="row">

                <!-- Start of Cart Wrapper -->
                <div class="col-md-12 cart-wrapper">

                    <!-- Start of Table Responsive -->
                    <div class="table-responsive">
                        <!-- Start of Cart Table -->
                        <table class="table cart">
                            <thead>
                                <tr>
                                    <th class="cart-product-remove">&nbsp;</th>
                                    <th class="cart-product-thumbnail">&nbsp;</th>
                                    <th class="cart-product-name">상품 이름</th>
                                    <th class="cart-product-price">상품 가격</th>
                                    <!-- <th class="cart-product-quantity">Quantity</th> -->
                                    <th class="cart-product-subtotal">다운로드</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:if test="${empty list }">
								<tr class="align_center">
									<td colspan="5" style="text-align: center;">구입한 상품이 없습니다.</td>
								</tr>		
							</c:if>
							
							<c:if test="${!empty list }">
							<!--반복 시작 -->
						<c:forEach var="vo" items="${list }">
	                         <!-- Start of Cart Item 1 -->
                                <tr class="cart-item">

                                    <!-- Cart Remove Product -->
                                     <td class="cart-product-remove">
                                        <%-- <a href="<c:url value='/cart/delete?pdNo=${vo.pdNo }'/>" class="remove" title="Remove this item"><i class="fa fa-times"></i></a> --%>
                                    </td> 

                                    <!-- Cart Product Thumbnail -->
                                    <td class="cart-product-thumbnail">
                                    
                                        <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">
                                            <img width="75" height="50" src="<c:url value='/images/cartimg.jpg'/>" alt="">
                                        </a>
                                    </td>

                                    <!-- Cart Product Name -->
                                    <td class="cart-product-name">
                                        <a href="<c:url value='/pd/pdDetail?pdNo=${vo.pdNo }'/>">${vo.pdName }</a>
                                    </td>

                                    <!-- Cart Product Price -->
                                    <td class="cart-product-price">
                                        <div class="col-md-6 col-xs-12 proceed-checkout text-right">
                                        <span class="amount" style="margin-right: -38px;"><fmt:formatNumber value="" pattern="#,###"/>${vo.pdPrice }원</span>
                                        </div>
                                    </td>

                                    <!-- Cart Product Quantity -->
                                    <!-- <td class="cart-product-quantity">
                                        <div class="quantity clearfix">
                                            <input type="button" value="-" class="minus">
                                            <input type="text" name="quantity" value="2" class="qty">
                                            <input type="button" value="+" class="plus">
                                        </div>
                                    </td> -->

                                    <!-- Cart Subtotal -->
                                    <td class="cart-product-subtotal">
                                                <a href="" class="btn btn-purple btn-effect" id="download">다운로드</a>
                                    </td>
                                </tr>
                                </c:forEach>
                                </c:if>
                                <!-- End of Cart Item 1 -->

                                <!-- Start of Cart Item -->
                                <tr class="cart-item">
                                    <td colspan="6">
                                        <div class="row clearfix">

                                            <div class="col-md-6 col-xs-12">
                                                
                                            </div>
											<%-- <c:if test="${!empty list }">
                                            <div class="col-md-6 col-xs-12 proceed-checkout text-right">
                                                <a href="<c:url value='/cart/checkOut'/>" class="btn btn-purple btn-effect" id="checkOut">결제 하기</a>
                                            </div>
                                            </c:if> --%>
                                        </div>
                                    </td>
                                </tr>
                                <!-- End of Cart Item -->

                            </tbody>
                        </table>
                        <!-- End of Cart Table -->
                    </div>
                    <!-- End of Table Responsive -->

                    <div class="row clearfix mt60">

                        <!-- Start of Cart Total -->
                        <div class="col-md-6 clearfix cart-total" style="float: right;">
                            <div class="table-responsive">
                               <!--  <h4 class="pb30">장바구니 합계</h4> -->

                                <!-- Start of Table -->
                                <table class="table">
                                    <tbody>
                                        <!-- Start of Table Row -->
                                        <tr>
                                             <!-- <td class="cart-product-name">
                                                <strong>Cart Subtotal</strong>
                                            </td>
                                            <td class="cart-product-name">
                                                <span class="amount">$79.97</span>
                                            </td> -->
                                        </tr>

                                        <!-- Start of Table Row -->
                                        <tr>
                                            <!-- <td class="cart-product-name">
                                                <strong>Shipping</strong>
                                            </td>

                                            <td class="cart-product-name">
                                                <span class="amount">Free Delivery</span>
                                            </td> -->
                                        </tr>

                                        <!-- Start of Table Row -->
                                        <%-- <tr>
                                            <td class="cart-product-name" style="text-align: center;">
                                                <strong>합계</strong>
                                            </td>

                                            <td class="cart-product-name" style="text-align: center;">
                                                <c:if test="${!empty list }">
                                                <span class="amount text-blue lead">
                                                    <strong><fmt:formatNumber value="${sum }" pattern="#,###"/>원</strong>
                                                </span>
                                                </c:if>
                                                <c:if test="${empty list }">
                                                <span class="amount text-blue lead">
                                                    <strong>0원</strong>
                                                </span>
                                                </c:if>
                                            </td>
                                        </tr> --%>
                                    </tbody>
                                </table>
                                <!-- End of Table -->

                            </div>
                        </div>
                        <!-- End of Cart Total -->
                    </div>
                    <!-- End of Row -->

                </div>
                <!-- End of Cart Wrapper -->

            </div>
        </div>
    </section>
    <!-- ===== End of Shop Cart Section ===== -->
<%@ include file="../inc/footer.jsp"%>