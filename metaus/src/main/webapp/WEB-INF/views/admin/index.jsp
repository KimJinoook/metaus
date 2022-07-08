<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="inc/adminHeader.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                현재 접속자 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${curVisit }명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-users fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                총 방문자 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalVisit }명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-users fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            계약 작업 완료율
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${conEndRate }%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: ${conEndRate }%" aria-valuenow="${conEndRate }" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-handshake fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                금일 모델링 상품 매출액</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${sumPayToday } 원</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">1주일 방문자 수 현황</h6>
                                    
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">회원 현황</h6>
                                    
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 일반회원
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 크리에이터
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> 기업회원
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-12 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">계약 진행 현황</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">계약 체결 현황 <span
                                            class="float-right">${conRate }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: ${conRate}%"
                                            aria-valuenow="${conRate}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">계약 작업 현황 <span
                                            class="float-right">${conEndRate }%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: ${conEndRate}%"
                                            aria-valuenow="${conEndRate}" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    
                                </div>
                            </div>


                        </div>

                       
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <input type="hidden" id="d1" value="${daysforvisit[0] }">
            <input type="hidden" id="d2" value="${daysforvisit[1] }">
            <input type="hidden" id="d3" value="${daysforvisit[2] }">
            <input type="hidden" id="d4" value="${daysforvisit[3] }">
            <input type="hidden" id="d5" value="${daysforvisit[4] }">
            <input type="hidden" id="d6" value="${daysforvisit[5] }">
            <input type="hidden" id="d7" value="${daysforvisit[6] }">
            <input type="hidden" id="v1" value="${visitfordays[0] }">
            <input type="hidden" id="v2" value="${visitfordays[1] }">
            <input type="hidden" id="v3" value="${visitfordays[2] }">
            <input type="hidden" id="v4" value="${visitfordays[3] }">
            <input type="hidden" id="v5" value="${visitfordays[4] }">
            <input type="hidden" id="v6" value="${visitfordays[5] }">
            <input type="hidden" id="v7" value="${visitfordays[6] }">
            <input type="hidden" id="totalMem" value="${totalMem }">
            <input type="hidden" id="totalCre" value="${totalCre }">
            <input type="hidden" id="totalCom" value="${totalCom }">
            
            

    


    <!-- Page level plugins -->
    <!-- Page level plugins -->
    <script src="<c:url value='/admin/vendor/datatables/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
		
    <!-- Page level custom scripts -->
    <script src="<c:url value='/admin/js/demo/datatables-demo.js'/>"></script>
    <script src="<c:url value='/admin/vendor/chart.js/Chart.min.js'/>"></script>
    <script src="<c:url value='/admin/js/chart-area-index.js'/>"></script>
    

    <!-- Page level custom scripts -->
    
    <script src="<c:url value='/admin/js/chart-pie-index.js'/>"></script>
            <!-- End of Main Content -->
<%@ include file="inc/adminFooter.jsp" %>
