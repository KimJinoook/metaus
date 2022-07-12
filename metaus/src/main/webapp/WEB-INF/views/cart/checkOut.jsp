<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../inc/header.jsp"%> 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header" style="margin-top: 150px;">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>결제</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">결제</li>
                    </ul>
                </div>
            </div>
            <!-- End of Breadcrumb -->

        </div>
        </section>
<!-- ===== Start of Shop Check Out Section ===== -->
    <section class="shop ptb80">
        <div class="container">
            <div class="row">


                <!-- Start of Accordion Check Out -->
                <div class="col-md-9">

                    <!-- Start of Panel Group -->
                    <div class="panel-group" id="accordion">

                        <!-- ========== Start of Panel 1 ========== -->
                        <div class="panel panel-default">

                            <!-- Start of Panel Heading -->
                            <!-- <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false">
                                        Billing Address
                                    </a>
								</h4>
                            </div>
                            End of Panel Heading

                            Start of Accordion Body
                            <div id="collapseOne" class="accordion-body collapse" aria-expanded="false" role="menu">
                                <div class="panel-body">
                                    <div class="col-md-12 mtb20">


                                        Start of Form
                                        <form action="#" method="post">

                                            Start of Row
                                            <div class="row">
                                                <div class="form-group">

                                                    <div class="col-md-12">
                                                        <label>Country</label>
                                                        <select class="form-control">
                                                            <option value="">Select a country</option>
                                                        </select>
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-6">
                                                        <label>First Name</label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label>Last Name</label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-12">
                                                        <label>Company Name</label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-12">
                                                        <label>Address </label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-12">
                                                        <label>City </label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="col-md-12">

                                                    <input type="submit" value="Continue" class="btn btn-blue btn-effect">

                                                </div>
                                            </div>
                                            End of Row

                                        </form>
                                        End of Form


                                    </div>
                                </div>
                            </div>
                            End of Accordion Body
                        </div>
                        ========== End of Panel 1 ==========



                        ========== Start of Panel 2 ==========
                        <div class="panel panel-default">

                            Start of Panel Heading
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false">
                                        Shipping Address
                                    </a>
								</h4>
                            </div>
                            End of Panel Heading


                            Start of Accordion Body
                            <div id="collapseTwo" class="accordion-body collapse" aria-expanded="false" role="menu">
                                <div class="panel-body">
                                    <div class="col-md-12 mtb20">


                                        Start of Form
                                        <form action="#" method="post">

                                            Start of Row
                                            <div class="row">

                                                <div class="col-md-12">
                                                    <input type="checkbox" checked="checked" id="shipping">
                                                    <label for="shipping">Ship to billing address?</label>
                                                </div>

                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-12">
                                                        <label>Country</label>
                                                        <select class="form-control">
                                                            <option value="">Select a country</option>
                                                        </select>
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-6">
                                                        <label>First Name</label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                    <div class="col-md-6">
                                                        <label>Last Name</label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-12">
                                                        <label>Company Name</label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-12">
                                                        <label>Address </label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">
                                                <div class="form-group">

                                                    <div class="col-md-12">
                                                        <label>City </label>
                                                        <input type="text" value="" class="form-control">
                                                    </div>

                                                </div>
                                            </div>
                                            End of Row


                                            Start of Row
                                            <div class="row mt15">

                                                <div class="col-md-12">
                                                    <input type="submit" value="Continue" class="btn btn-blue btn-effect">
                                                </div>

                                            </div>
                                            End of Row
                                        </form>
                                        End of Form


                                    </div>
                                </div>
                            </div>
                            End of Accordion Body

                        </div> -->
                        <!-- ========== End of Panel 2 ========== -->


                        <!-- ========== Start of Panel 3 ========== -->
                        <div class="panel panel-default">

                            <!-- Start Panel Heading -->
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false">
                                        Review &amp; Payment
                                    </a>
                                </h4>
                            </div>
                            <!-- End Panel Heading -->


                            <!-- Start of Accordion Body -->
                            <div id="collapseThree" class="accordion-body collapse" aria-expanded="false" role="menu">
                                <div class="panel-body">

                                    <!-- Start of Cart Table -->
                                    <div class="col-md-12 mt20">
                                        <div class="table-responsive">
                                            <table class="table cart">
                                                <thead>
                                                    <tr>
                                                        <th class="cart-product-thumbnail">&nbsp;</th>
                                                        <th class="cart-product-name">상품 목록</th>
                                                        <th class="cart-product-price">상품 가격</th>
                                                        <!-- <th class="cart-product-quantity">Quantity</th> -->
                                                        <th class="cart-product-subtotal">합계</th>
                                                    </tr>
                                                </thead>

                                                <tbody>

                                                    <!-- Start of Cart Item 1 -->
														<!--반복 시작 -->
													<c:set var="sum" value="0"/>
													<c:forEach var="vo" items="${list }">
                                                    <tr class="cart-item">

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
                                                            <span class="amount"><fmt:formatNumber value="${vo.pdPrice }" pattern="#,###"/>원</span>
                                                        </td>

                                                        <!-- Cart Product Quantity -->
                                                        <!-- <td class="cart-product-quantity">
                                                            <span>2</span>
                                                        </td> -->

                                                        <!-- Cart Subtotal -->
                                                        <td class="cart-product-subtotal">
                                                            <span class="amount"><fmt:formatNumber value="${vo.pdPrice }" pattern="#,###"/>원</span>
                                                        </td>
                                                    
                                                    </tr>
                                                   <c:set var="sum" value="${sum+vo.pdPrice }"/>
                                                   </c:forEach>
                                                    <!-- End of Cart Item 1 -->
													

                                                    <!-- Start of Cart Item 2 -->
                                                    <!-- <tr class="cart-item">

                                                        Cart Product Thumbnail
                                                        <td class="cart-product-thumbnail">
                                                            <a href="#">
                                                                <img width="64" height="64" src="images/shop/product2.jpg" alt="">
                                                            </a>
                                                        </td>

                                                        Cart Product Name
                                                        <td class="cart-product-name">
                                                            <a href="#">Cariera Cap</a>
                                                        </td>

                                                        Cart Product Price
                                                        <td class="cart-product-price">
                                                            <span class="amount">$19.99</span>
                                                        </td>

                                                        Cart Product Quantity
                                                        <td class="cart-product-quantity">
                                                            <span>1</span>
                                                        </td>

                                                        Cart Subtotal
                                                        <td class="cart-product-subtotal">
                                                            <span class="amount">$19.99</span>
                                                        </td>
                                                    </tr>
 -->                                                    <!-- End of Cart Item 2 -->

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <!-- End of Cart Table -->


                                    <!-- Start of Cart Total -->
                                    <div class="col-md-12 cart-total clearfix mt20">
                                        <div class="table-responsive">
                                            <h4 class="pb30">장바구니 합계</h4>

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
                                                    <tr>
                                                        <td class="cart-product-name" style="text-align: center;">
                                                            <strong>합계</strong>
                                                        </td>

                                                        <td class="cart-product-name" style="text-align: center;">
                                                            <span class="amount text-blue lead" >
                                                    <strong>${sum }원</strong>
                                                </span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <!-- End of Table -->

                                        </div>
                                    </div>
                                    <!-- End of Cart Total -->

                                    <!-- Start of Form Div -->
                                    <div class="col-md-12 mtb20">
                                        <h4 class="pb20">결제 방법</h4>

                                        <!-- Start of Form -->
                                        <form action="#" method="post">

                                            <!-- Start of Row -->
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <input type="checkbox" id="bank">
                                                    <label for="bank">카드결제</label>

                                                </div>
                                            </div>
                                            <!-- End of Row -->

                                            <!-- Start of Row -->
                                            <div class="row">
                                                <!-- <div class="col-md-12">

                                                    <input type="checkbox" id="cheque">
                                                    <label for="cheque">Cheque Payment</label>

                                                </div> -->
                                            </div>
                                            <!-- End of Row -->

                                            <!-- Start of Row -->
                                            <div class="row">
                                                <!-- <div class="col-md-12">

                                                    <input type="checkbox" id="paypal">
                                                    <label for="paypal">PayPal</label>

                                                </div> -->
                                            </div>
                                            <!-- End of Row -->

                                        </form>
                                        <!-- End of Form -->
                                    </div>
                                    <!-- End of Form Div -->

                                </div>
                            </div>
                            <!-- End of Accordion Body -->

                        </div>
                        <!-- ========== Start of Panel 3 ========== -->

                    </div>
                    <!-- End of Panel Group -->

                    <div class="col-md-12 text-right" style="">
                        <input type="submit" value="결제 하기" name="proceed" id="checkOut" class="btn btn-blue btn-effect">
                    </div>

                </div>
                <!-- End of Accordion Check Out -->


                <!-- Start of Cart Total -->
                <div class="col-md-3 clearfix cart-total" style="width: 40%">
                    <div class="table-responsive">
                        <h4 class="pb30">장바구니 합계</h4>

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
                                <!-- <tr>
                                    <td class="cart-product-name">
                                        <strong>Shipping</strong>
                                    </td>

                                    <td class="cart-product-name">
                                        <span class="amount">Free Delivery</span>
                                    </td>
                                </tr> -->

                                <!-- Start of Table Row -->
                                <tr>
                                    <td class="cart-product-name">
                                        <strong>합계</strong>
                                    </td>

                                    <td class="cart-product-name" style="text-align: center;">
                                        <span class="amount text-blue lead">
                                            <strong>${sum }원</strong>
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <!-- End of Table -->

                    </div>
                </div>
                <!-- End of Cart Total -->

            </div>
        </div>
    </section>
    <!-- ===== End of Shop Check Out Section ===== -->
<script type="text/javascript">
	$(function(){
		$('#checkOut').click(function(){
	         if(!$('#bank').is(':checked')){
	            alert('결제 방식을 체크해주세요.');
	            $('#bank').focus();
	            event.preventDefault();
	         }else{
	        	 var IMP = window.IMP; // 생략가능
	     		IMP.init('imp60165917'); 
	     		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	     		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	     		IMP.request_pay({
	     			pg: 'kakao',
	     			pay_method: 'card',
	     			merchant_uid: 'merchant_' + new Date().getTime(),
	     			/* 
	     			 *  merchant_uid에 경우 
	     			 *  https://docs.iamport.kr/implementation/payment
	     			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	     			 */
	     			name: '주문명 : +이름추가+',
	     			// 결제창에서 보여질 이름
	     			// name: '주문명 : ${auction.a_title}',
	     			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
	     			amount: ${sum},
	     			// amount: ${bid.b_bid},
	     			// 가격 
	     			buyer_name: '이름',
	     			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
	     			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
	     			buyer_postcode: '123-456',
	     			}, function (rsp) {
	     				console.log(rsp);
	     			if (rsp.success) {
	     				var msg = '결제가 완료되었습니다.';
	     				msg += '결제 금액 : ' + rsp.paid_amount;
	     				location.href="<c:url value=''/>";
	     				// success.submit();
	     				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
	     				// 자세한 설명은 구글링으로 보시는게 좋습니다.
	     			} else {
	     				var msg = '결제에 실패하였습니다.';
	     				msg += '에러내용 : ' + rsp.error_msg;
	     			}
	     			alert(msg);
	     		});
	         }
	      });
	});
</script>
    <%@ include file="../inc/footer.jsp"%>