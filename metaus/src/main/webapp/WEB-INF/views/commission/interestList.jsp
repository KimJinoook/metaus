<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/sidebar.jsp"%>
<script type="text/javascript" 
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<div class="content-wrapper">
	<!-- ===== Start of Shop Section ===== -->
	<section class="shop ptb80" style="background-color: #ffffff; margin-bottom: 24px;">
		<div class="container">
			<div class="row">
			<c:if test="${empty scList }">
				<img src="<c:url value='/images/commission/조건에맞는.PNG'/>">
				
			</c:if>
				<!-- Start of Shop Product Wrapper -->
			<c:if test="${!empty scList }">
				<div class="col-md-12 col-xs-12 shop-products-wrapper">

					<!-- Start of Products -->
					<div class="row">

                	<c:forEach var="scvo" items="${scList }">
                		<c:forEach var="revo" items="${reList }">
                		<c:if test="${scvo.recNo==revo.recNo }">
						<!-- Start of Product 1 -->
						<div class="col-md-6 col-xs-12">
							<div class="product">
								<!-- Product Image -->
								<div class="product-image" style="background: #fff;">
									<!-- pop up for images 사용하려면 custom_mypage.js 364행 -->
									
										<div class="height-260">
												<div class="comList-company right" style="color: #000; font-size: 21px;">
													${vo.comName }</div>
												<div class="clear"></div>
												<div class="font comList-title">${revo.recTitle }</div>
												
												<div class="left comList-estimate">의뢰 견적</div>
												<div class="right font comList-price">
												${revo.recPay }원
												</div>
												<div class="clear"></div>											
										</div>
									

									<!-- Product overlay -->

									<div class="product-overlay">
										<a href="<c:url value='/request/detail?recNo=${revo.recNo }'/>" style="background: #28affa;"><i
											class="fa-solid fa-circle-plus" ></i>상세 보기</a>
									</div>
								</div>
								<!-- Product Description -->
								<div class="product-descr">

									
										<div
											class="com-decs-font com-decs-margin omList-avg-applicant left">지원자수</div>
										<div
											class="com-decs-font com-decs-margin-content left com-decs-font-bold">명</div>
										<div class="clear"></div>
								
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
					</c:forEach>					
					</div>



				</div>
	</c:if>
				<!-- End of Products -->

	</section>
</div>

<!-- ===== End of Shop Section ===== -->





<%@ include file="../inc/footer.jsp"%>