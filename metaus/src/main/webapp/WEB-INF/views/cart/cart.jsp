<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<!-- =============== Start of Page Header 1 Section =============== -->
    <section class="page-header" style="margin-top: 150px;">
        <div class="container">

            <!-- Start of Page Title -->
            <div class="row">
                <div class="col-md-12">
                    <h2>장바구니</h2>
                </div>
            </div>
            <!-- End of Page Title -->

            <!-- Start of Breadcrumb -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">home</a></li>
                        <li class="active">장바구니</li>
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
                                    <th class="cart-product-name">Product</th>
                                    <th class="cart-product-price">Unit Price</th>
                                    <!-- <th class="cart-product-quantity">Quantity</th> -->
                                    <th class="cart-product-subtotal">Total</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:if test="${empty list }">
								<tr class="align_center">
									<td colspan="5" style="text-align: center;">장바구니가 비었습니다.</td>
								</tr>		
							</c:if>
							<!--반복 시작 -->
							<c:if test="${!empty list }">
						<c:forEach var="vo" items="${list }">
	                                <!-- Start of Cart Item 1 -->
                                <tr class="cart-item">

                                    <!-- Cart Remove Product -->
                                    <td class="cart-product-remove">
                                        <a href="#" class="remove" title="Remove this item"><i class="fa fa-times"></i></a>
                                    </td>

                                    <!-- Cart Product Thumbnail -->
                                    <td class="cart-product-thumbnail">
                                        <a href="#">
                                            <img width="64" height="64" src="images/shop/product1.jpg" alt="">
                                        </a>
                                    </td>

                                    <!-- Cart Product Name -->
                                    <td class="cart-product-name">
                                        <a href="#">${vo.pdName }</a>
                                    </td>

                                    <!-- Cart Product Price -->
                                    <td class="cart-product-price">
                                        <span class="amount">${vo.pdPrice }</span>
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
                                        <span class="amount">${vo.pdPrice }</span>
                                    </td>
                                </tr>
                                </c:forEach>
                                </c:if>
                                <!-- End of Cart Item 1 -->


                                <!-- Start of Cart Item 2 -->
                                <!-- <tr class="cart-item">

                                    Cart Remove Product
                                    <td class="cart-product-remove">
                                        <a href="#" class="remove" title="Remove this item"><i class="fa fa-times"></i></a>
                                    </td>

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
                                        <div class="quantity clearfix">
                                            <input type="button" value="-" class="minus">
                                            <input type="text" name="quantity" value="1" class="qty">
                                            <input type="button" value="+" class="plus">
                                        </div>
                                    </td>

                                    Cart Subtotal
                                    <td class="cart-product-subtotal">
                                        <span class="amount">$19.99</span>
                                    </td>
                                </tr> -->
                                <!-- End of Cart Item 2 -->


                                <!-- Start of Cart Item -->
                                <tr class="cart-item">
                                    <td colspan="6">
                                        <div class="row clearfix">

                                            <div class="col-md-6 col-xs-12">
                                                <div class="col-md-8 col-xs-7">
                                                    <input type="text" value="" class="form-control" placeholder="Enter Coupon Code..">
                                                </div>
                                                <div class="col-md-4 col-xs-5">
                                                    <a href="#" class="btn btn-blue btn-effect">Apply Coupon</a>
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-xs-12 proceed-checkout text-right">
                                                <a href="<c:url value='/cart/checkOut'/>" class="btn btn-purple btn-effect">Proceed to Checkout</a>
                                            </div>

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

                        <!-- Start of Calculate Shipping -->
                        <!-- <div class="col-md-6 clearfix">
                            <h4 class="pb30">Calculate Shipping</h4>
                            <form action="#">
                                <select class="form-control">
                                    <option value="AX">Åland Islands</option>
                                    <option value="AF">Afghanistan</option>
                                    <option value="AL">Albania</option>
                                    <option value="DZ">Algeria</option>
                                    <option value="AD">Andorra</option>
                                    <option value="AO">Angola</option>
                                    <option value="AI">Anguilla</option>
                                    <option value="AQ">Antarctica</option>
                                    <option value="AG">Antigua and Barbuda</option>
                                    <option value="AR">Argentina</option>
                                    <option value="AM">Armenia</option>
                                    <option value="AW">Aruba</option>
                                    <option value="AU">Australia</option>
                                    <option value="AT">Austria</option>
                                    <option value="AZ">Azerbaijan</option>
                                    <option value="BS">Bahamas</option>
                                    <option value="BH">Bahrain</option>
                                    <option value="BD">Bangladesh</option>
                                    <option value="BB">Barbados</option>
                                    <option value="BY">Belarus</option>
                                    <option value="PW">Belau</option>
                                    <option value="BE">Belgium</option>
                                    <option value="BZ">Belize</option>
                                    <option value="BJ">Benin</option>
                                    <option value="BM">Bermuda</option>
                                    <option value="BT">Bhutan</option>
                                    <option value="BO">Bolivia</option>
                                    <option value="BQ">Bonaire, Saint Eustatius and Saba</option>
                                    <option value="BA">Bosnia and Herzegovina</option>
                                    <option value="BW">Botswana</option>
                                    <option value="BV">Bouvet Island</option>
                                    <option value="BR">Brazil</option>
                                    <option value="IO">British Indian Ocean Territory</option>
                                    <option value="VG">British Virgin Islands</option>
                                    <option value="BN">Brunei</option>
                                    <option value="BG">Bulgaria</option>
                                    <option value="BF">Burkina Faso</option>
                                    <option value="BI">Burundi</option>
                                    <option value="KH">Cambodia</option>
                                    <option value="CM">Cameroon</option>
                                    <option value="CA">Canada</option>
                                    <option value="CV">Cape Verde</option>
                                    <option value="KY">Cayman Islands</option>
                                    <option value="CF">Central African Republic</option>
                                    <option value="TD">Chad</option>
                                    <option value="CL">Chile</option>
                                    <option value="CN">China</option>
                                    <option value="CX">Christmas Island</option>
                                    <option value="CC">Cocos (Keeling) Islands</option>
                                    <option value="CO">Colombia</option>
                                    <option value="KM">Comoros</option>
                                    <option value="CG">Congo (Brazzaville)</option>
                                    <option value="CD">Congo (Kinshasa)</option>
                                    <option value="CK">Cook Islands</option>
                                    <option value="CR">Costa Rica</option>
                                    <option value="HR">Croatia</option>
                                    <option value="CU">Cuba</option>
                                    <option value="CW">CuraÇao</option>
                                    <option value="CY">Cyprus</option>
                                    <option value="CZ">Czech Republic</option>
                                    <option value="DK">Denmark</option>
                                    <option value="DJ">Djibouti</option>
                                    <option value="DM">Dominica</option>
                                    <option value="DO">Dominican Republic</option>
                                    <option value="EC">Ecuador</option>
                                    <option value="EG">Egypt</option>
                                    <option value="SV">El Salvador</option>
                                    <option value="GQ">Equatorial Guinea</option>
                                    <option value="ER">Eritrea</option>
                                    <option value="EE">Estonia</option>
                                    <option value="ET">Ethiopia</option>
                                    <option value="FK">Falkland Islands</option>
                                    <option value="FO">Faroe Islands</option>
                                    <option value="FJ">Fiji</option>
                                    <option value="FI">Finland</option>
                                    <option value="FR">France</option>
                                    <option value="GF">French Guiana</option>
                                    <option value="PF">French Polynesia</option>
                                    <option value="TF">French Southern Territories</option>
                                    <option value="GA">Gabon</option>
                                    <option value="GM">Gambia</option>
                                    <option value="GE">Georgia</option>
                                    <option value="DE">Germany</option>
                                    <option value="GH">Ghana</option>
                                    <option value="GI">Gibraltar</option>
                                    <option value="GR">Greece</option>
                                    <option value="GL">Greenland</option>
                                    <option value="GD">Grenada</option>
                                    <option value="GP">Guadeloupe</option>
                                    <option value="GT">Guatemala</option>
                                    <option value="GG">Guernsey</option>
                                    <option value="GN">Guinea</option>
                                    <option value="GW">Guinea-Bissau</option>
                                    <option value="GY">Guyana</option>
                                    <option value="HT">Haiti</option>
                                    <option value="HM">Heard Island and McDonald Islands</option>
                                    <option value="HN">Honduras</option>
                                    <option value="HK">Hong Kong</option>
                                    <option value="HU">Hungary</option>
                                    <option value="IS">Iceland</option>
                                    <option value="IN">India</option>
                                    <option value="ID">Indonesia</option>
                                    <option value="IR">Iran</option>
                                    <option value="IQ">Iraq</option>
                                    <option value="IM">Isle of Man</option>
                                    <option value="IL">Israel</option>
                                    <option value="IT">Italy</option>
                                    <option value="CI">Ivory Coast</option>
                                    <option value="JM">Jamaica</option>
                                    <option value="JP">Japan</option>
                                    <option value="JE">Jersey</option>
                                    <option value="JO">Jordan</option>
                                    <option value="KZ">Kazakhstan</option>
                                    <option value="KE">Kenya</option>
                                    <option value="KI">Kiribati</option>
                                    <option value="KW">Kuwait</option>
                                    <option value="KG">Kyrgyzstan</option>
                                    <option value="LA">Laos</option>
                                    <option value="LV">Latvia</option>
                                    <option value="LB">Lebanon</option>
                                    <option value="LS">Lesotho</option>
                                    <option value="LR">Liberia</option>
                                    <option value="LY">Libya</option>
                                    <option value="LI">Liechtenstein</option>
                                    <option value="LT">Lithuania</option>
                                    <option value="LU">Luxembourg</option>
                                    <option value="MO">Macao S.A.R., China</option>
                                    <option value="MK">Macedonia</option>
                                    <option value="MG">Madagascar</option>
                                    <option value="MW">Malawi</option>
                                    <option value="MY">Malaysia</option>
                                    <option value="MV">Maldives</option>
                                    <option value="ML">Mali</option>
                                    <option value="MT">Malta</option>
                                    <option value="MH">Marshall Islands</option>
                                    <option value="MQ">Martinique</option>
                                    <option value="MR">Mauritania</option>
                                    <option value="MU">Mauritius</option>
                                    <option value="YT">Mayotte</option>
                                    <option value="MX">Mexico</option>
                                    <option value="FM">Micronesia</option>
                                    <option value="MD">Moldova</option>
                                    <option value="MC">Monaco</option>
                                    <option value="MN">Mongolia</option>
                                    <option value="ME">Montenegro</option>
                                    <option value="MS">Montserrat</option>
                                    <option value="MA">Morocco</option>
                                    <option value="MZ">Mozambique</option>
                                    <option value="MM">Myanmar</option>
                                    <option value="NA">Namibia</option>
                                    <option value="NR">Nauru</option>
                                    <option value="NP">Nepal</option>
                                    <option value="NL">Netherlands</option>
                                    <option value="AN">Netherlands Antilles</option>
                                    <option value="NC">New Caledonia</option>
                                    <option value="NZ">New Zealand</option>
                                    <option value="NI">Nicaragua</option>
                                    <option value="NE">Niger</option>
                                    <option value="NG">Nigeria</option>
                                    <option value="NU">Niue</option>
                                    <option value="NF">Norfolk Island</option>
                                    <option value="KP">North Korea</option>
                                    <option value="NO">Norway</option>
                                    <option value="OM">Oman</option>
                                    <option value="PK">Pakistan</option>
                                    <option value="PS">Palestinian Territory</option>
                                    <option value="PA">Panama</option>
                                    <option value="PG">Papua New Guinea</option>
                                    <option value="PY">Paraguay</option>
                                    <option value="PE">Peru</option>
                                    <option value="PH">Philippines</option>
                                    <option value="PN">Pitcairn</option>
                                    <option value="PL">Poland</option>
                                    <option value="PT">Portugal</option>
                                    <option value="QA">Qatar</option>
                                    <option value="IE">Republic of Ireland</option>
                                    <option value="RE">Reunion</option>
                                    <option value="RO">Romania</option>
                                    <option value="RU">Russia</option>
                                    <option value="RW">Rwanda</option>
                                    <option value="ST">São Tomé and Príncipe</option>
                                    <option value="BL">Saint Barthélemy</option>
                                    <option value="SH">Saint Helena</option>
                                    <option value="KN">Saint Kitts and Nevis</option>
                                    <option value="LC">Saint Lucia</option>
                                    <option value="SX">Saint Martin (Dutch part)</option>
                                    <option value="MF">Saint Martin (French part)</option>
                                    <option value="PM">Saint Pierre and Miquelon</option>
                                    <option value="VC">Saint Vincent and the Grenadines</option>
                                    <option value="SM">San Marino</option>
                                    <option value="SA">Saudi Arabia</option>
                                    <option value="SN">Senegal</option>
                                    <option value="RS">Serbia</option>
                                    <option value="SC">Seychelles</option>
                                    <option value="SL">Sierra Leone</option>
                                    <option value="SG">Singapore</option>
                                    <option value="SK">Slovakia</option>
                                    <option value="SI">Slovenia</option>
                                    <option value="SB">Solomon Islands</option>
                                    <option value="SO">Somalia</option>
                                    <option value="ZA">South Africa</option>
                                    <option value="GS">South Georgia/Sandwich Islands</option>
                                    <option value="KR">South Korea</option>
                                    <option value="SS">South Sudan</option>
                                    <option value="ES">Spain</option>
                                    <option value="LK">Sri Lanka</option>
                                    <option value="SD">Sudan</option>
                                    <option value="SR">Suriname</option>
                                    <option value="SJ">Svalbard and Jan Mayen</option>
                                    <option value="SZ">Swaziland</option>
                                    <option value="SE">Sweden</option>
                                    <option value="CH">Switzerland</option>
                                    <option value="SY">Syria</option>
                                    <option value="TW">Taiwan</option>
                                    <option value="TJ">Tajikistan</option>
                                    <option value="TZ">Tanzania</option>
                                    <option value="TH">Thailand</option>
                                    <option value="TL">Timor-Leste</option>
                                    <option value="TG">Togo</option>
                                    <option value="TK">Tokelau</option>
                                    <option value="TO">Tonga</option>
                                    <option value="TT">Trinidad and Tobago</option>
                                    <option value="TN">Tunisia</option>
                                    <option value="TR">Turkey</option>
                                    <option value="TM">Turkmenistan</option>
                                    <option value="TC">Turks and Caicos Islands</option>
                                    <option value="TV">Tuvalu</option>
                                    <option value="UG">Uganda</option>
                                    <option value="UA">Ukraine</option>
                                    <option value="AE">United Arab Emirates</option>
                                    <option value="GB">United Kingdom (UK)</option>
                                    <option value="US">United States (US)</option>
                                    <option value="KR" selected="selected">Republic of Korea</option>
                                    <option value="UY">Uruguay</option>
                                    <option value="UZ">Uzbekistan</option>
                                    <option value="VU">Vanuatu</option>
                                    <option value="VA">Vatican</option>
                                    <option value="VE">Venezuela</option>
                                    <option value="VN">Vietnam</option>
                                    <option value="WF">Wallis and Futuna</option>
                                    <option value="EH">Western Sahara</option>
                                    <option value="WS">Western Samoa</option>
                                    <option value="YE">Yemen</option>
                                    <option value="ZM">Zambia</option>
                                    <option value="ZW">Zimbabwe</option>
                                </select>


                                <input type="text" class="form-control mt15" placeholder="State / Country">

                                <input type="text" class="form-control mt15" placeholder="PostCode / Zip">
                                <a href="#" class="btn btn-blue btn-effect mt15">Update Total</a>
                            </form>
                        </div> -->
                        <!-- End of Calculate Shipping -->


                        <!-- Start of Cart Total -->
                        <div class="col-md-6 clearfix cart-total" style="float: right;">
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
                                            <!-- <td class="cart-product-name">
                                                <strong>Shipping</strong>
                                            </td>

                                            <td class="cart-product-name">
                                                <span class="amount">Free Delivery</span>
                                            </td> -->
                                        </tr>

                                        <!-- Start of Table Row -->
                                        <tr>
                                            <td class="cart-product-name">
                                                <strong>Total</strong>
                                            </td>

                                            <td class="cart-product-name">
                                                <span class="amount text-blue lead">
                                                    <strong>${vo.pdPrice }</strong>
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
                    <!-- End of Row -->

                </div>
                <!-- End of Cart Wrapper -->

            </div>
        </div>
    </section>
    <!-- ===== End of Shop Cart Section ===== -->
    <%@ include file="../inc/footer.jsp"%>