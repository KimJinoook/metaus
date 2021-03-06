<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>

<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">


<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script>

</script>

<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-2 text-gray-800">기업 정보</h1>
                    </div>
                    
                
                    

                    	<div class="row">

	                        <div class="col-lg-4">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">지도</h6>
	                                </div>
	                                <div class="card-body">
		                                <div id="map" style="height:400px">
	                                    </div>
	                                </div>
	                                    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48fd685b6c1070cc71f894be6653d843&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${comVo.comLati}, ${comVo.comLongi}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }; 
var map = new kakao.maps.Map(mapContainer, mapOption); 
var coords = new kakao.maps.LatLng(${comVo.comLati}, ${comVo.comLongi});
var marker = new kakao.maps.Marker({
    map: map,
    position: coords
});


</script>
	                                    
	                               
	                            </div>
	
	                        </div>
	                        
	                        <div class="col-lg-8">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">기업 정보</h6>
	                                </div>
	                                <div class="card-body">
	                                    <form class="user" method="post" enctype="multipart/form-data" action="<c:url value='/admin/member/managerEdit'/>">
	                                		<div class="row">
		                                		<div class="col-md-6">
	                             
			                                        <div class="form-group">
			                                        	<span>기업명</span>
			                                            <input type="text" class="form-control"
			                                                value="${comVo.comName }" readonly="readonly" style="background-color: white;">    
			                                        </div>
			                                        <br/>
			                                        <div class="form-group">
			                                        	<span>주소</span>
			                                            <input type="text" class="form-control"
			                                                value="${comVo.comAdd }" readonly="readonly" style="background-color: white;">
			                                        </div>
			                                        <br/>
			                                        
			                               
		                                   		</div>
		                                		<div class="col-md-6">
	                             
			                                        <div class="form-group">
			                                        	<span>대표자명</span>
			                                            <input type="text" class="form-control"
			                                            	value="${comVo.comCeo }"
			                                                readonly="readonly" style="background-color: white;">
			                                                
			                                        </div>
			                                        <br/>
			                                        <div class="form-group">
			                                        	<span>전화번호</span>
			                                            <input type="tel" class="form-control"
			                                            	value="${comVo.comTel }"
			                                                readonly="readonly" style="background-color: white;">
			                                        </div>
			                                        <br/>
			                                        
			                                        
			                               
		                                   		</div>
		                                		<div class="col-lg-12">
			                                        <div class="form-group">
			                                        	<span>기업소개</span>
			                                            <textarea class="form-control" rows="6">${comVo.comPreview }</textarea>
			                                        </div>
			                               
		                                   		</div>
	                                   		</div>
	                                    </form>
	                                </div>
	                            </div>
	
	                        </div>
	                        
	                        
	                        
                        </div>
                        
                        <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">등록 의뢰 목록
                            </h6>
                        </div>
                        
                        <div class="card-body">
                        
                            <div class="table-responsive">
                            
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                           <th>의뢰 번호</th>
                                            <th>의뢰 제목</th>
                                            <th>페이</th>
                                            <th>등록일</th>
                                            <th>진행상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>의뢰 번호</th>
                                            <th>의뢰 제목</th>
                                            <th>페이</th>
                                            <th>등록일</th>
                                            <th>진행상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="vo" items="${recList}">
                                        <c:if test="${vo.memNo==0 }">
                                        <tr>
                                            <td>${vo.recNo }</td>
                                            <td>${vo.recTitle }</td>
                                            <td>${vo.recPay }</td>
                                            <td>${vo.recRegdate }</td>
                                            <td>모집중</td>
                                            <td style="padding:10px">
                                            	<a href="javascript:void(0)" class="btn btn-primary btn-icon-split btn-sm" style="margin:0px;height:27px">
                                        			<span class="icon text-white" style="margin:0px">
                                            			<i class="fas fa-arrow-right"></i>
                                        			</span>
                                    			</a>	
                                    		</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${not empty vo.conDonedate }">
                                        <tr style="color:green">
                                            <td>${vo.recNo }</td>
                                            <td>${vo.recTitle }</td>
                                            <td>${vo.recPay }</td>
                                            <td>${vo.recRegdate }</td>
                                            <td>작업완료</td>
                                            <td style="padding:10px">
                                            	<a href="javascript:void(0)" class="btn btn-primary btn-icon-split btn-sm" style="margin:0px;height:27px">
                                        			<span class="icon text-white" style="margin:0px">
                                            			<i class="fas fa-arrow-right"></i>
                                        			</span>
                                    			</a>	
                                    		</td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${empty vo.conDonedate && vo.memNo != 0 }">
                                        <tr style="color:orange;">
                                            <td>${vo.recNo }</td>
                                            <td>${vo.recTitle }</td>
                                            <td>${vo.recPay }</td>
                                            <td>${vo.recRegdate }</td>
                                            <td>작업중</td>
                                            <td style="padding:10px">
                                            	<a href="javascript:void(0)" class="btn btn-primary btn-icon-split btn-sm" style="margin:0px;height:27px">
                                        			<span class="icon text-white" style="margin:0px">
                                            			<i class="fas fa-arrow-right"></i>
                                        			</span>
                                    			</a>	
                                    		</td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>




                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
            
            
            
            <c:forEach var="i" begin="1" end="12">
            	<input type="hidden" id="m${i }" value="${monthForSell[i-1] }">
            	<input type="hidden" id="s${i }" value="${sellForMonth[i-1] }">
            </c:forEach>
            
            
            
	<!-- Page level plugins -->
	<script src="<c:url value='/admin/vendor/datatables/jquery.dataTables.min.js'/>"></script>
	<script src="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
	

	<!-- Page level custom scripts -->
    <script src="<c:url value='/admin/js/demo/datatables-demo.js'/>"></script>
    <script src="<c:url value='/admin/vendor/chart.js/Chart.min.js'/>"></script>
    <script src="<c:url value='/admin/js/chart-area-pdDetail.js'/>"></script>

<%@ include file="../inc/adminFooter.jsp" %>
