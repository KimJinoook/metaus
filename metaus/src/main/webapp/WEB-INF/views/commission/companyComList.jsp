<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/sidebar.jsp" %>
<style>
.contractor{
	font-size: 20px;
	color: black;
	margin-top: 21px;
    margin-right: 9px;
}

.btn-applicant{
	margin-right: 11px;
}

.align-line{
	line-height: 37px;
}

</style>
<script type=text/javascript>
	$(function(){
		$(document).on("click", ".btn-commission", function(){
			//console.log($(this).prev().val());
			var currentPage = $(this).prev().val();
			currentPage = Number(currentPage);
			$.ajax({
				url: "<c:url value='/commission/ajaxCompanyComList'/>",
				type: "GET",
				data: {
					"currentPage" : currentPage
				},
				success: function(data){
					$('.shop-products-wrapper').html(data);
				},
				error: function(xhr, status, error){
					alert('error:' + error);
				} 
			});
		});
		
		$(document).on("click",".cancel-commission",function(){
			var recNo = $(this).prev().val();
			//console.log(recNo);
			$.ajax({
				url: "<c:url value='/commission/cancelCommission'/>",
				type: "GET",
				data: {
					"recNo" : recNo
				},
				success: function(data){
					$('.shop-products-wrapper').html(data);
				},
				error: function(xhr, status, error){
					alert('error:' + error);
				} 
			});
		});
		
		
	});
</script>

<div class="content-wrapper">
    <!-- ===== Start of Shop Section ===== -->
    <section class="shop ptb80">
        <div class="container">
            <div class="row">

                <!-- Start of Shop Product Wrapper -->
                <div class="col-md-12 col-xs-12 shop-products-wrapper">

					
					<!-- Start of Products -->
                    <div class="row ajaxProduct">
						<c:forEach var="map" items="${list }">
                        <!-- Start of Product 1 -->
                        <div class="col-md-6 col-xs-12">
                            <div class="product">

                                <!-- Product Image -->
                                <div class="product-image" style="background: #fff;">
									<!-- pop up for images 사용하려면 custom_mypage.js 364행 -->
									<input type="hidden" value="${map['REC_NO'] }">
                                    <a href='<c:url value="/request/detail?recNo=${map['REC_NO'] }"/>' class="hover-zoom height-260">
	                                    <div class="height-260">
                                    		<c:if test="${map['conFlag'] eq 'recruiting' }">
                                    			<div class="comList-cat left">
                                    				모집중
                                    			</div>
                                    		</c:if>
                                    		<c:if test="${map['conFlag'] eq 'contracted' }">
                                    			<div class="comList-cat left" style="background-color: #fa5757db;">
                                    				계약진행
                                    			</div>
                                    		</c:if>
                                    		<c:if test="${map['conFlag'] eq 'done' }">
                                    			<div class="comList-cat left" style="background-color: #c2bdbdf0;">	
                                    				계약완료
                                    			</div>
                                    		</c:if>
                                    		<c:if test="${map['conFlag'] ne 'recruiting' }">
	                                    		<div class="right contractor">
	                                    			계약자 : ${map['memName'] } ${map['memId'] }
	                                    		</div>
                                    		</c:if>
	                                        <div class="clear"></div>
	                                        <div class="font comList-title">${map['REC_TITLE'] }</div>
	                                        <div class="comList-estimate">${map['REC_CONTENT'] }</div>
										</div>
                                    </a>

									<c:if test="${map['conFlag'] eq 'recruiting'}">
                                    	<!-- Product overlay -->
	                                    <div class="product-overlay">
	                                    	<input type="hidden" value="${map['REC_NO'] }">
	                                        <a role="button" class="cancel-commission"><i class="fa-solid fa-circle-minus"></i>의뢰 취소</a>
	                                    </div>
                                    </c:if>

                                </div>

                                <!-- Product Description -->
                                <div class="product-descr">

                                        <div class="com-decs-font com-decs-margin comList-avg-estimate left align-line"><i class="fa-solid fa-sack-dollar"></i> 페이</div>
										<div class="com-decs-font com-decs-margin-content left com-decs-font-bold align-line">${map['REC_PAY'] }원 &nbsp;&nbsp;&nbsp;&nbsp;|</div>
										<div class="com-decs-font com-decs-margin omList-avg-applicant left align-line"><i class="fa-solid fa-user-tie"></i> 지원자수</div>
										<div class="com-decs-font com-decs-margin-content left com-decs-font-bold align-line">${map['applicantNo'] }명</div>
										<c:if test="${map['applicantNo'] > 0}">
											<div class="right">
												<a role="button">
													<button class="btn btn-applicant"><i class="fa-solid fa-eye"></i> 지원자 보기</button>
												</a>
											</div>
										</c:if>
										<div class="clear"></div>
                                </div>

                            </div>
                        </div>
                        <!-- End of Product 1 -->
                        </c:forEach>
					</div>
					<!-- End of Products -->
					
					
                    <!-- Start of Pagination -->
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="pagination list-inline text-center">
                            	<!-- 이전블럭으로 이동 -->
                            	<c:if test="${pagingInfo.firstPage>1 }">
                            		<input type="hidden" value="${pagingInfo.firstPage-1}" class="currentPage${i}">
                            		<li class="btn-commission"><a role="button">Prev</a></li>
                            	</c:if>
                            	<!-- 페이지 번호 추가 -->						
								<!-- [1][2][3][4][5][6][7][8][9][10] -->
								<c:forEach var="i" begin="${pagingInfo.firstPage }" 
									end="${pagingInfo.lastPage }">
									<c:if test="${i==pagingInfo.currentPage }">
										<input type="hidden" value="${i}" class="currentPage${i}">
	                                	<li class="active btn-commission"><a href="javascript:void(0)">${i}</a></li>
	                                </c:if>
	                                <c:if test="${i!=pagingInfo.currentPage }">
	                                	<input type="hidden" value="${i}" class="currentPage${i}">
	                                	<li class="btn-commission"><a role="button">${i}</a></li>
	                                </c:if>
								</c:forEach>
								<!-- 다음 블럭으로 이동 -->
								<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
									<input type="hidden" value="${pagingInfo.lastPage+1}" class="currentPage${i}">
                                	<li class="btn-commission"><a role="button">Next</a></li>
                                </c:if>	
                                
                            </ul>
                        </div>
                    </div>
                    <!-- End of Pagination -->

                </div>
                <!-- End of Shop Product Wrapper -->

            </div>
        </div>
    </section>
    <!-- ===== End of Shop Section ===== -->


</div>

<%@ include file="../layout/sidebar_function_bottom.jsp" %>
</body>

</html>