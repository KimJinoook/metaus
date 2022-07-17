<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/css/request.css'/>">

<script type="text/javascript"
	src="<c:url value='/js/jquery-3.6.0.min.js'/>">
	
</script>

<br>
<br>
<br>
<br>


<c:forEach var="cvo" items="${comlist }">
     <c:if test="${vo.comNo == cvo.comNo }">

    <!-- ===== Start of Job Header Section ===== -->
    <section class="job-header ptb60" id="one">
        <div class="container">

            <!-- Start of Row -->
            <div class="row" >

                <div class="col-md-6 col-xs-12" style="margin-top: 30px;">
                    <h3 style="color: white;">${vo.recTitle }</h3>
                </div>

	            <form id="insertScrap" action='<c:url value='/request/insertScrap'/>'>
                	<div class="col-md-6 col-xs-12 clearfix">
		                <input type="hidden" name="recNo" value="${vo.recNo }">
		                <input type="hidden" name="memNo" value="${memNo }">
	                    <a href="#" class="btn btn-blue btn-effect pull-right mt15" id="inesrtScrap"><i class="fa fa-star"></i>관심 의뢰 등록</a>
                	</div>
	            </form>
                <c:if test="${cvo.comId==comId }">
                <form id="requestUpdate"
                	action ="<c:url value='/request/update'/>" style="float:right; margin-right: 20px; margin-bottom: 10px;">
                <div class="mt20">
                			<input type="hidden" name="recNo" value="${vo.recNo }">
                            <a href="#" class="btn btn-blue btn-effect" id="requestUpdate">수정</a>
                        </div>
                </form>
                <form id="requestDelete"
							action="<c:url value='/request/requestDelete'/>" style="float: right; margin-right: 20px; margin-top: 20px;">
							<input type="hidden" name="recNo" value="${vo.recNo }">
							<a href="#" class="btn btn-red btn-effect" id="requestDelete">삭제하기</a>
						</form>
				</c:if>
            </div>
            <!-- End of Row -->

        </div>
    </section>
    <input type="hidden" id="comId" name="comId" value="${comId }">
       <input type="hidden" id="memId" name="memId" value="${memId }">
    <!-- ===== End of Job Header Section ===== -->





    <!-- ===== Start of Main Wrapper Job Section ===== -->
    <section class="ptb80" id="job-page">
        <div class="container">

            <!-- Start of Row -->
            <div class="row">

                <!-- ===== Start of Job Details ===== -->
                <div class="col-md-8 col-xs-12">

                    <!-- Start of Company Info -->
                    <div class="row company-info">

                        <!-- Job Company Image -->
                        <div class="col-md-2 col-xs-3" style="margin-top: 20px;">
                                <div class="candidate-img" >
                                        <img src="<c:url value='/com_profile/${cvo.comPic }'/>" class="img-responsive" alt="" onerror="this.onerror=null; this.src='<c:url value='/images/createrProfile/user.png'/>'">
                                </div>
                            </div>
                        <!-- Job Company Info -->
                        <div class="col-md-9">
                            <div class="job-company-info mt30">
                                <h3 class="capitalize">${cvo.comName }</h3>

                                <ul class="list-inline mt10">
                                    <li><a href="${vo.recWeb }"><i class="fa fa-link" aria-hidden="true"></i>Website</a></li>
                                    <li><a href="${vo.recTwitter }"><i class="fa fa-twitter" aria-hidden="true"></i>Twitter</a></li>
                                </ul>
                            </div>
                        </div>
						    
                    </div>
                     
                    <!-- End of Company Info -->


                    <!-- Start of Job Details -->
                    <div class="row job-details mt40">
                    
                        <div class="col-md-12">
								<c:forEach var="atcvo" items="${ratcList }">
									<c:if test="${atcvo.recNo == vo.recNo }">
										<img src="<c:url value='/recruit/${atcvo.recfileFilename }'/>"
											class="img-responsive" />
									</c:if>
								</c:forEach>
								<!-- Div wrapper -->
                          <ul class="list mt20">
                           <li>
                            <div class="pt40">
                            <h4 class="widget-title">의뢰 개요</h4>

                                <p class="mt20">${vo.recContent }</p>
                            </div>
                           </li>
<hr>
                            <!-- Div wrapper -->
                            <li>
                            <div class="pt40">
                            <h4 class="widget-title">주요 요구 사항</h4>
								<p class="mt20">${vo.recContent2 }
							 </div>
							</li>
                                <!-- Start of List -->
                                
                                
                                <!-- End of List -->
<hr>
                            
                            <!-- Div wrapper -->
                             <li>
                            <div class="pt40">
                            <h4 class="widget-title">제안 사항</h4>
								<p class="mt20">${vo.recContent3 }
                                <!-- Start of List -->
                                <!-- End of List -->
                                </div>
                            </li>
<hr>
                            
 						</ul>
                        </div>
                      
                    </div>
                    <!-- End of Job Details -->

                </div>
                <!-- ===== End of Job Details ===== -->





                <!-- ===== Start of Job Sidebar ===== -->
                <div class="col-md-4 col-xs-12">

                    <!-- Start of Job Sidebar -->
                    <div class="job-sidebar">

                        <h4 class="uppercase">의뢰 조건</h4>
                        <hr>

                        <!-- Start of Social Media ul -->
                        <ul class="social-btns list-inline mt20">
                            <!-- Social Media -->

                            <!-- Social Media -->
                            <li>
                                <a href="${vo.recTwitter }" class="social-btn-roll twitter transparent">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-twitter"></i>
                                        <i class="social-btn-roll-icon fa fa-twitter"></i>
                                    </div>
                                </a>
                            </li>

                            <!-- Social Media -->
                            <li>
                                <a href="${vo.recWeb }" class="social-btn-roll linkedin">
                                    <div class="social-btn-roll-icons">
                                        <i class="social-btn-roll-icon fa fa-linkedin"></i>
                                        <i class="social-btn-roll-icon fa fa-linkedin"></i>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- End of Social Media ul -->



                        <ul class="job-overview nopadding mt40">
                            <li>
                                <h5><i class="fa fa-calendar"></i> 등록일:</h5>
                                <span><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.recRegdate }"/></span>
                            </li>

                            <li>
                                <h5><i class="fa fa-user"></i> 대표자:</h5>
                                <span>${cvo.comCeo }</span>
                            </li>

                            <li>
                                <h5><i class="fa fa-money"></i> 페이:</h5>
                                <span><fmt:formatNumber value = "${vo.recPay }" pattern="#,###"/>원</span>
                            </li>
                        </ul>
                        
                        <div class="mt20">
                            <a href="<c:url value='/request/recpreWrite?recNo=${vo.recNo }'/>" class="btn btn-blue btn-effect" id="recpreWrite">지원하기</a>
                        </div>
                        
                        <div class="mt20">
                            <a href="#" class="btn btn-red btn-effect">신고</a>
                        </div>

                    </div>
                    <!-- Start of Job Sidebar -->


                    <!-- Start of Google Map -->
                    <!-- kakao map -->
    				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=078d40ccef9a6fb3704d3f172bd1ee2f"></script>
                    <div class="col-md-12 gmaps mt60">
                         <div id="map"></div>
                    </div>
                    <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = { 
                        center: new kakao.maps.LatLng(${cvo.comLati}, ${cvo.comLongi}), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };

	                var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	                // 마커가 표시될 위치입니다 
	                var markerPosition  = new kakao.maps.LatLng(${cvo.comLati}, ${cvo.comLongi}); 
	
	                // 마커를 생성합니다
	                var marker = new kakao.maps.Marker({
	                    position: markerPosition
	                });
	
	                // 마커가 지도 위에 표시되도록 설정합니다
	                marker.setMap(map);
				    </script>
                    
                   
                    <!-- End of Google Map -->


                </div>
                <!-- ===== End of Job Sidebar ===== -->

            </div>
            <!-- End of Row -->


            <!-- Start of Row -->
                    <!-- End of Owl Slider -->
                </div>
            </div>
            <!-- End of Row -->

        </div>
    </section>
    <!-- ===== End of Main Wrapper Job Section ===== -->

</c:if>
                     </c:forEach>

<script>
	$(function(){
		$('#requestDelete').click(function() {
			var msg = confirm('삭제하시겠습니까?');

			if (msg) {
				alert('삭제완료');
				$('#requestDelete').submit();
			} else {
				return false;
			}
		});
		
		$('#requestUpdate').click(function() {
			var msg = confirm('수정하시겠습니까?');

			if (msg) {
				alert('수정 페이지로 이동');
				$('#requestUpdate').submit();
			}
		});
		
		$('#recpreWrite').click(function(){
			if($('#memId').val()=="" || $('#memId').val()==null){
				alert('일반회원 로그인 후 이용가능합니다!');
				event.preventDefault();
			}
		});
		
		$('#inesrtScrap').click(function(){
			if($('#memId').val()=="" || $('#memId').val()==null){
				alert('일반회원 로그인 후 이용가능합니다!');
				event.preventDefault();
			}else{
				alert('관심의뢰 등록');
				$('#insertScrap').submit();
			}
		});
	});

	/* $(function(){
		$('#recpreWrite').click(function(){
			if($('#memId').val()=="" || $('#memId').val()==null){
				alert('일반회원 로그인 후 이용가능합니다!');
				event.preventDefault();
			}
		});
	}); */
</script>


<%@ include file="../inc/footer.jsp"%>

