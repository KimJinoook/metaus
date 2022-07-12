<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../inc/header.jsp"%> 
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
                                                        <th class="cart-product-name">Product</th>
                                                        <th class="cart-product-price">Unit Price</th>
                                                        <th class="cart-product-quantity">Quantity</th>
                                                        <th class="cart-product-subtotal">Total</th>
                                                    </tr>
                                                </thead>

                                                <tbody>

                                                    <!-- Start of Cart Item 1 -->
                                                    <tr class="cart-item">

                                                        <!-- Cart Product Thumbnail -->
                                                        <c:if test="${!empty list }">
														<c:set var="sum" value="0"/>
                                                        <td class="cart-product-thumbnail">
                                                            <a href="#">
                                                                <img width="64" height="64" src="images/shop/product1.jpg" alt="">
                                                            </a>
                                                        </td>

                                                        <!-- Cart Product Name -->
                                                        <td class="cart-product-name">
                                                            <a href="#">Cariera T-Shirt</a>
                                                        </td>

                                                        <!-- Cart Product Price -->
                                                        <td class="cart-product-price">
                                                            <span class="amount">$29.99</span>
                                                        </td>

                                                        <!-- Cart Product Quantity -->
                                                        <td class="cart-product-quantity">
                                                            <span>2</span>
                                                        </td>

                                                        <!-- Cart Subtotal -->
                                                        <td class="cart-product-subtotal">
                                                            <span class="amount">$59.98</span>
                                                        </td>
                                                    </c:if>
                                                    </tr>
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
                                            <h4 class="pb30">Cart Totals</h4>

                                            <!-- Start of Table -->
                                            <table class="table">
                                                <tbody>
                                                    <!-- Start of Table Row -->
                                                    <tr>
                                                        <td class="cart-product-name">
                                                            <strong>Cart Subtotal</strong>
                                                        </td>
                                                        <td class="cart-product-name">
                                                            <span class="amount">$79.97</span>
                                                        </td>
                                                    </tr>

                                                    <!-- Start of Table Row -->
                                                    <tr>
                                                        <td class="cart-product-name">
                                                            <strong>Shipping</strong>
                                                        </td>

                                                        <td class="cart-product-name">
                                                            <span class="amount">Free Delivery</span>
                                                        </td>
                                                    </tr>

                                                    <!-- Start of Table Row -->
                                                    <tr>
                                                        <td class="cart-product-name">
                                                            <strong>Total</strong>
                                                        </td>

                                                        <td class="cart-product-name">
                                                            <span class="amount text-blue lead">
                                                    <strong>$79.97</strong>
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
                                        <h4 class="pb20">Payment</h4>

                                        <!-- Start of Form -->
                                        <form action="#" method="post">

                                            <!-- Start of Row -->
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <input type="checkbox" checked="checked" id="bank">
                                                    <label for="bank">Direct Bank Transfer</label>

                                                </div>
                                            </div>
                                            <!-- End of Row -->

                                            <!-- Start of Row -->
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <input type="checkbox" id="cheque">
                                                    <label for="cheque">Cheque Payment</label>

                                                </div>
                                            </div>
                                            <!-- End of Row -->

                                            <!-- Start of Row -->
                                            <div class="row">
                                                <div class="col-md-12">

                                                    <input type="checkbox" id="paypal">
                                                    <label for="paypal">PayPal</label>

                                                </div>
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
                        <input type="submit" value="Place Order" name="proceed" class="btn btn-blue btn-effect">
                    </div>

                </div>
                <!-- End of Accordion Check Out -->


                <!-- Start of Cart Total -->
                <div class="col-md-3 clearfix cart-total" style="width: 40%">
                    <div class="table-responsive">
                        <h4 class="pb30">Cart Totals</h4>

                        <!-- Start of Table -->
                        <table class="table">
                            <tbody>
                                <!-- Start of Table Row -->
                                <tr>
                                    <td class="cart-product-name">
                                        <strong>Cart Subtotal</strong>
                                    </td>
                                    <td class="cart-product-name">
                                        <span class="amount">$79.97</span>
                                    </td>
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
                                        <strong>Total</strong>
                                    </td>

                                    <td class="cart-product-name">
                                        <span class="amount text-blue lead">
                                            <strong>$79.97</strong>
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
    <%@ include file="../inc/footer.jsp"%>