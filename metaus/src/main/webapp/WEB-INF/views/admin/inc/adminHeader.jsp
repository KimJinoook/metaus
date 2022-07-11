<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MetaUs Admin</title>
    <link rel="shortcut icon" href="<c:url value='/images/metaus_favicon.png'/>" type="image/x-icon">

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/admin/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/admin/css/sb-admin-2.min.css'/>" rel="stylesheet">
    
    
    <link href="<c:url value='/admin/css/pdlistSlider.css'/>" rel="stylesheet">
    
    
    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/admin/vendor/jquery/jquery.min.js'/>"></script>
    <script src="<c:url value='/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

<style>

.ck-editor__editable {
    min-height: 400px;
}
</style>
   

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/admin/'/>">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">MetaUs</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value='/admin/'/>">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>MetaUs 현황</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                사용자관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-users"></i>
                    <span>일반회원 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/member/memberList'/>">일반회원 조회</a>
                        <a class="collapse-item" href="<c:url value='/admin/member/cutmemberList'/>">차단 회원 관리</a>
                        <a class="collapse-item" href="#">공지 발송</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-building"></i>
                    <span>기업회원 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/member/comList'/>">기업 회원 조회</a>
                        
                    </div>
                </div>
            </li>
            
             <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseManager"
                    aria-expanded="true" aria-controls="collapseManager">
                    <i class="fas fa-fw fa-user-secret"></i>
                    <span>관리자 관리</span>
                </a>
                <div id="collapseManager" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/member/register'/>">관리자 등록</a>
                        <a class="collapse-item" href="<c:url value='/admin/member/managerList'/>">관리자 조회</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/admin/mail/sendAll'/>">
                    <i class="fas fa-mail-bulk"></i>
                    <span>공지발송</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                게시판 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMBoard"
                    aria-expanded="true" aria-controls="collapseMBoard">
                    <i class="fas fa-fw fa-pen"></i>
                    <span>관리자 게시판</span>
                </a>
                <div id="collapseMBoard" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/board/managerBoardList?btypeNo=1'/>">게시글 조회</a>
                        <a class="collapse-item" href="<c:url value='/admin/board/managerBoardWrite'/>">게시글 등록</a>
                    </div>
                </div>
            </li>
            
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUBoard"
                    aria-expanded="true" aria-controls="collapseUBoard">
                    <i class="fas fa-fw fa-pen"></i>
                    <span>사용자 게시판</span>
                </a>
                <div id="collapseUBoard" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/board/memberBoardList'/>">게시글 조회</a>
                        <a class="collapse-item" href="<c:url value='/admin/board/reportList'/>">신고게시글 조회</a>
                    </div>
                </div>
            </li>
     
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                모델링 상품 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePd"
                    aria-expanded="true" aria-controls="collapsePd">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>모델링 상품</span>
                </a>
                <div id="collapsePd" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<c:url value='/admin/pd/pdList'/>">모델링 상품 조회</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                       
 
                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <c:if test="${not empty sessionScope.navMsg }">
                                	<span class="badge badge-danger badge-counter">${sessionScope.navMsg.size() }</span>
                                </c:if>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                
                                <c:forEach var="vo" items="${sessionScope.navMsg }">
                                
                                
                                
	                                <a class="dropdown-item d-flex align-items-center" href="<c:url value='/admin/mail/mailDetail?msgNo=${vo.msgNo }&msgaddNo=${vo.msgaddNo }'/>">
	                                    <div class="dropdown-list-image mr-3">
	                                        <img class="rounded-circle" src="<c:url value='/manager_profile/${vo.managerPic }'/>" alt="..." onerror="this.onerror=null; this.src='<c:url value='/admin/img/undraw_profile.svg'/>'">
	                                            
	                                        <c:if test="${not empty sessionScope.managerMap.get(vo.msgaddAdser) }">    
	                                        	<div class="status-indicator bg-success"></div>
	                                        </c:if>
	                                        <c:if test="${empty sessionScope.managerMap.get(vo.msgaddAdser) }">    
	                                        	<div class="status-indicator"></div>
	                                        </c:if>
	                                        
	                                    </div>
	                                    <div class="font-weight-bold">
	                                        <div class="text-truncate">${vo.msgTitle }</div>
	                                        <c:if test="${not empty vo.managerName }">
	                                        <div class="small text-gray-500">${vo.managerName }</div>
	                                        </c:if>
	                                        <c:if test="${empty vo.managerName }">
	                                        <div class="small text-gray-500">${vo.msgaddAdser }</div>
	                                        </c:if>
	                                    </div>
	                                </a>
                                
                                
                                </c:forEach>
                                <c:if test="${empty sessionScope.navMsg }">
                                	<a class="dropdown-item align-items-center" href="<c:url value='/admin/mail/mailList'/>">
	                                   <div class="text-center">
	                                    
	                                        새로운 메세지가 없습니다.
	                                        
	                                    
	                                   </div>
	                                
                                	</a>
                                </c:if>
                                
                                
                               
                                <a class="dropdown-item text-center small text-gray-500" href="<c:url value='/admin/mail/mailList'/>">더보기</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.managerName }</span>
                                <img class="img-profile rounded-circle"
                                    src="<c:url value='/manager_profile/${sessionScope.managerPic }'/>" alt="..." onerror="this.onerror=null; this.src='<c:url value='/admin/img/undraw_profile.svg'/>'">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="<c:url value='/admin/member/managerEdit'/>">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    사용자정보
                                </a>
                                
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->