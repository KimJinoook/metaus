<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/sidebar.jsp"%>
<script type="text/javascript" 
	src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	function List(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<div class="content-wrapper">
	<!-- ===== Start of Shop Section ===== -->
	<section class="shop ptb80" style="background-color: #ffffff; margin-bottom: 24px;">
		<div class="container">
			<div class="row">
			<c:if test="${empty list }">
				<img src="<c:url value='/images/commission/조건에맞는.PNG'/>">
				
			</c:if>
				<!-- Start of Shop Product Wrapper -->
			<c:if test="${!empty list }">
				<div class="col-md-12 col-xs-12 shop-products-wrapper">

					<!-- Start of Products -->
					<div class="row">

                	<c:forEach var="vo" items="${list }">
                	
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
												<div class="font comList-title">${vo.recTitle }</div>
												
												<div class="left comList-estimate">의뢰 견적</div>
												<div class="right font comList-price">
												${vo.recPay }원
												</div>
												<div class="clear"></div>											
										</div>
									

									<!-- Product overlay -->

									<div class="product-overlay">
										<a href="<c:url value='/request/detail?recNo=${vo.recNo }'/>" style="background: #28affa;"><i
											class="fa-solid fa-circle-plus" ></i>상세 보기</a>
									</div>
								</div>
							
							
							
							
							
								
							
							
							
							
							

								<!-- Product Description -->
								<div class="product-descr">

									
										<div
											class="com-decs-font com-decs-margin omList-avg-applicant left">지원자수</div>
										<div
											class="com-decs-font com-decs-margin-content left com-decs-font-bold">${vo.recCount }명</div>
										<div class="clear"></div>
								
								</div>
							</div>
						</div>
					</c:forEach>					
					</div>



				</div>

				<!-- End of Products -->


				<!-- Start of Pagination -->
				<div class="col-md-12">
						<ul class="pagination list-inline text-center">
							<c:if test="${pagingInfo.firstPage>1 }">
								<li><a href="#"
									onclick="List(${pagingInfo.firstPage-1})">prev</a></li>
							</c:if>

							<!-- [1][2][3][4][5][6][7][8][9][10] -->
							<c:forEach var="i" begin="${pagingInfo.firstPage }"
								end="${pagingInfo.lastPage }">
								<c:if test="${i==pagingInfo.currentPage }">
									<li class="active"><a>${i }</a></li>
								</c:if>
								<c:if test="${i!=pagingInfo.currentPage }">
									<li><a href="#" onclick="List(${i})">${i } </a></li>
								</c:if>
							</c:forEach>

							<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
								<li><a href="#"
									onclick="List(${pagingInfo.lastPage+1})">Next</a></li>
							</c:if>
							<!--  페이지 번호 끝 -->
						</ul>
					</div>
					<!-- End of Pagination -->

				</c:if>

				<!-- 페이징 처리를 위한 form 시작-->
				<form name="frmPage" method="post"
					action="<c:url value='/commission/commissionList'/>">
					<input type="hidden" name="currentPage">
				</form>
				<!-- 페이징 처리 form 끝 -->
				<!-- End of Pagination -->

			</div>
			<!-- End of Shop Product Wrapper -->

		</div>

	</section>
</div>

<!-- ===== End of Shop Section ===== -->





<%@ include file="../inc/footer.jsp"%>