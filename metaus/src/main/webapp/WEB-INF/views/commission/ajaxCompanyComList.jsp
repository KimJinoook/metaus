<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
						<!-- Start of Products -->
                    <div class="row ajaxProduct">
						<c:forEach var="map" items="${list }">
                        <!-- Start of Product 1 -->
                        <div class="col-md-6 col-xs-12">
                            <div class="product">

                                <!-- Product Image -->
                                <div class="product-image" style="background: #fff;">
									<!-- pop up for images 사용하려면 custom_mypage.js 364행 -->
                                    <a href="commissionDetail" class="hover-zoom height-260">
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
	                                        <div class="clear"></div>
	                                        <div class="font comList-title">${map['REC_TITLE'] }</div>
	                                        <div class="comList-estimate">${map['REC_CONTENT'] }</div>
										</div>
                                    </a>

                                    <!-- Product overlay -->
                                    <div class="product-overlay">
                                        <a href="commissionCancel"><i class="fa-solid fa-circle-minus"></i>의뢰 취소</a>
                                    </div>

                                </div>

                                <!-- Product Description -->
                                <div class="product-descr">

                                    <a href="shop-product.html">
                                        <div class="com-decs-font com-decs-margin comList-avg-estimate left"><i class="fa-solid fa-sack-dollar"></i> 페이</div>
										<div class="com-decs-font com-decs-margin-content left com-decs-font-bold">${map['REC_PAY'] }원 &nbsp;&nbsp;&nbsp;&nbsp;|</div>
										<div class="com-decs-font com-decs-margin omList-avg-applicant left"><i class="fa-solid fa-user-tie"></i> 지원자수</div>
										<div class="com-decs-font com-decs-margin-content left com-decs-font-bold">${map['applicantNo'] }명</div>
										<div class="clear"></div>
                                    </a>
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